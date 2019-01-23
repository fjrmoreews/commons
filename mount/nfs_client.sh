#bin/bash
############
# NFS client mount
# for debian + ubuntu
############
#can be used for openstack manila SHARES
apt-get install -y nfs-common
#########"edit this######
NFS_SERVER_IP=xxxxx
SPATH=$NFS_SERVER_IP:/var/lib/manila/mnt/share-xxxxxxxxxxxx
SHAREDIR=/mnt/shares1
#########################

function simplemnt {

 mkdir -p $SHAREDIR && chmod 744 $SHAREDIR
 mount $SPATH   $SHAREDIR  -vvvv
 
}

function unmnt {
 
  umount $SHAREDIR
}

#############fstab version

function fstabmnt {

 sudo chmod  777  /etc/fstab
 OPTFSTAB=""
 #for old ubuntu version (e.g ubuntu 14-> nfs version 3)
 #OPTFSTAB=",nfsvers=3"
 echo "$SPATH $SHAREDIR  nfs rw$OPTFSTAB 0 0" >>  /etc/fstab
 chmod  644  /etc/fstab
 mount -a -vvvv
}

fstabmnt
