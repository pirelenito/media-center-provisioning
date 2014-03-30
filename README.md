# Media Center provisioning

Very simple collection of cookbooks to provision an Ubuntu box with [XBMC](http://xbmc.org/), Nvidia Drivers and NFS shares.

Usefull to store all your media and backups.

You will need [knife-solo](http://matschaffer.github.io/knife-solo/) to run the recipes.

## Machine setup

First allow [root access](https://help.ubuntu.com/community/RootSudo#root_account)

```sheel
sudo passwd root
```

And install the SSH server:

```shell
sudo apt-get install openssh-server
```

## Provisioning

*These commands are all runnig from the local machine (not the media center).*

Add the ssh pub keys to the media center machine using a tool like `ssh-copy-id`.

```shell
ssh-copy-id root@mediaCenterIp
```

Install chef in the machine:

```shell
knife solo prepare root@mediaCenterIp
```

Setup the environment by adding a new file like `environments\nitocenter.rb`:

```ruby
name 'nitocenter'

default_attributes 'ip' => '192.168.1.42',
                   'nfs_exports' => [
                      '/mnt/personal 192.168.1.0/255.255.255.0(rw,sync,no_root_squash,insecure,anonuid=1000,anongid=1000)',
                      '/mnt/stuff 192.168.1.0/255.255.255.0(rw,sync,no_root_squash,insecure,anonuid=1000,anongid=1000)'
                   ]
```

The environment file should contain the NFS shares and the ip address of the machine.

Cook the recipes informing the environment name (in the example: `nitocenter`) and the role (`media_center`):

```shell
knife solo cook root@mediaCenterIp -E nitocenter -r "role[media_center]"
```

Once completed, log in the machined and reboot it to get the new Nvidia drivers.

## Mounting NFS shares in a Mac

If you get errors trying to mount an NFS share on Mac, apparetly it needs the `insecure` option while defining the share (like the example in the environment above). [Source](http://forums.macrumors.com/showthread.php?t=317044).

## Work in progress

* The ip address is not beign set;
* Make XMBC startup on login;
* Disable auto-lock (the current solution don't work);
* Make all files created in the NFS share use the same user (it should be public in the network);
* Polish the NFS cookbook.

## References:

NFS setup:

* http://www.tldp.org/HOWTO/NFS-HOWTO/server.html
* http://tutorialforlinux.com/2014/02/25/ubuntu-14-04-trusty-how-to-share-files-over-network-with-nfs4-from-server-to-client/
* http://www.quietearth.us/articles/2006/09/28/Ubuntu-How-to-setup-an-nfs-server

Nvidia drivers:

* http://www.noobslab.com/2012/10/install-latest-nvidia-drivers-in-ubuntu.html

Install XMBC:

* http://wiki.xbmc.org/index.php?title=Installing_XBMC_for_Linux

Fix vsync issue in XMBC:

* https://bbs.archlinux.org/viewtopic.php?pid=1377674#p1377674

Disabling screen lock:

* http://forum.lxde.org/viewtopic.php?f=8&t=31300
