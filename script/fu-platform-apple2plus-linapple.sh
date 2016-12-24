#!/bin/sh

# Apple ][+ w/ Linapple w/ certain options

DISTFILE_URL='https://github.com/timob/linapple/archive/master.zip'

start() {
    linapple
}

setup() {
    linapple
}

dist() {
    linapple
}

distboot() {
    linapple
}

install() {
    echo "No install step.  Installation will happen during setup."
}

$1 $*
