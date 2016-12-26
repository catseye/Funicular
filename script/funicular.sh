#!/bin/sh

. ./Funicularfile

DRIVER_DIR=`dirname $0`
. ${DRIVER_DIR}/fu-platform-${PLATFORM}.sh

runnable() {
    command -V $1 >/dev/null
}

funicular_init() {
    imgtype=$1
    shift
    case $imgtype in
        system)
            if [ -e $SYSTEM_IMAGE ]; then
                echo "$SYSTEM_IMAGE already exists!  Delete it first."
                exit 1
            fi
            platform_initsys $SYSTEM_IMAGE
            ;;
        setup)
            if [ -e $SETUP_IMAGE ]; then
                echo "$SETUP_IMAGE already exists!  Delete it first."
                exit 1
            fi
            funicular_initsetup $SETUP_IMAGE
            ;;
        dist)
            if [ -e $DIST_IMAGE ]; then
                echo "$DIST_IMAGE already exists!  Delete it first."
                exit
            fi
            platform_initdist $DIST_IMAGE
            ;;
        *)
            echo "Usage: funicular init (system|setup|dist)"
            exit 1
    esac
}

funicular_install() {
    if runnable install_instructions; then
        cat <<EOF
=========================
INSTALLATION INSTRUCTIONS
=========================
EOF
        install_instructions
    fi

    platform_install $*
}

funicular_initsetup() {
    echo "creating setup image..."

    rm -rf "$SETUP_IMAGE"

    mkdir -p distfiles
    for url in $DISTFILES; do
        dest=`basename $url`
        wget $url -O distfiles/$dest
    done

    mkdir -p distrepos
    cd distrepos
    for url in $DISTREPOS; do
        git clone $url
    done
    cd ..

    rm -rf staging_area
    mkdir -p staging_area

    for url in $DISTFILES; do
        dest=`basename $url`
        # TODO apply name map here
        dest_name=$dest
        cp -p distfiles/$dest staging_area/$dest_name
    done

#        for spec in string.gmatch(distrepos_specs, "[^%s]+") do
#            local url = get_url_for_spec(funicular, spec)
#            local source_name = basename(url)
#            local dest_name = source_name
#            local domain = 'bitbucket.org' -- FIXME
#            local username = 'catseye' -- FIXME
#            if funicular.name_map and funicular.name_map[source_name] then
#                dest_name = funicular.name_map[source_name]
#            end
#            if funicular.toolshelf_inside then
#                local tarball_name = domain .. ',' .. username .. ',' .. dest_name .. '-master.tar.gz'
#                execute(funicular, 'cd distrepos && ' ..
#                        'tar zcf ../staging_area/' .. tarball_name .. ' ' .. source_name)
#            elseif funicular.zip_unversioned then
#                if exists('distrepos/' .. source_name .. '/.hg') then
#                    execute(funicular, 'cd distrepos/' .. source_name ..
#                            ' && hg archive -r tip -t zip ' ..
#                            '-X .hgignore -X .gitignore -X .hgtags -X .hg_archival.txt ' ..
#                            '../../staging_area/' .. dest_name .. '.zip')
#                else
#                    execute(funicular, 'cd distrepos/' .. source_name ..
#                            ' && git archive --format=zip HEAD ' ..
#                            '--output=../../staging_area/' .. dest_name .. '.zip')
#                end
#            else
#                execute(funicular, 'cd distrepos && tar zcf ../staging_area/' ..
#                        dest_name .. '.tgz ' .. source_name)
#            end
#        end

    if [ -d skel ]; then
        cp -Rp skel/* staging_area/
    fi

    if runnable setup_script; then
        setup_script
    fi

    platform_initsetup

    rm -rf staging_area
}

funicular_setup() {
    echo "setup"
#        if funicular.setup_instructions then
#            print [[
#
#==================
#SETUP INSTRUCTIONS
#==================
#]]
#            print(funicular.setup_instructions)
#        end
#        execute(funicular, funicular.platform.architecture.emulator_mode.setup_command)
}

funicular_start() {
    echo "start"
    platform_start $*
}

funicular_builddist() {
    echo "builddist"
#        if not funicular.dist_image or not exists(funicular.dist_image) then
#            print "No distribution image defined or created."
#            return
#        end
#        if funicular.dist_script then
#            run_script(funicular, funicular.dist_script)
#        end
#        if funicular.dist_instructions then
#            print [[
#
#=========================
#DISTRIBUTION INSTRUCTIONS
#=========================
#]]
#            print(funicular.dist_instructions)
#        end
#        if funicular.platform.architecture.emulator_mode.dist_command then
#            print("starting " .. funicular.platform.architecture.emulator_mode.emulator.name .. "...")
#            execute(funicular, funicular.platform.architecture.emulator_mode.dist_command)
#        end
}

funicular_distboot() {
    echo "distboot"
        #if not funicular.dist_image or not exists(funicular.dist_image) then
        #    print "No distribution image defined or created."
        #    return
        #end
        #print("distbooting " .. funicular.platform.architecture.emulator_mode.emulator.name .. "...")
        #execute(funicular, funicular.platform.architecture.emulator_mode.distboot_command)
}

funicular_backup() {
    bu=`basename $SYSTEM_IMAGE`
    bu="$bu-backup.tar.gz"
    if [ -e $bu ]; then
        echo "$bu already exists!  Delete it or rename it first."
        exit 1
    fi
    tar zcvf $bu $SYSTEM_IMAGE
}

funicular_restore() {
    if [ -e $SYSTEM_IMAGE ]; then
        echo "$SYSTEM_IMAGE already exists!  Delete it first."
        exit 1
    fi

    bu=`basename $SYSTEM_IMAGE`
    bu="$bu-backup.tar.gz"
    tar zxvf $bu
}

########
# MAIN #
########

CMD=$1
shift

case $CMD in
  init|install|setup|start|builddist|distboot|backup|restore)
    funicular_$CMD $*
    ;;
  *)
    cat <<EOF
Usage: funicular <command>
where <command> is one of:
    init
    install
    setup
    start
    builddist
    distboot
    backup
    restore
EOF
    exit 1
esac
