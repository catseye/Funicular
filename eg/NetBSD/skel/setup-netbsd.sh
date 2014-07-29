#!/bin/sh

umount /cdrom/
if [ ! -d /home/user ]; then
  useradd -m -G wheel -F user
  echo "About to run chpass."
  echo "Please delete user's password using vi"
  echo "(arrow to the start of the ***'s and press D.  Then type :wq to exit.)"
  echo "Press Enter to continue."
  read LINE
  chpass user
fi

chown user /cdrom
mount /cdrom

grep >fstab -v '/cdrom' /etc/fstab
echo >>fstab '/dev/cd0a    /cdrom    cd9660    ro'
mv fstab /etc/fstab

su user -c "/bin/sh /cdrom/init-toolshelf.sh"
