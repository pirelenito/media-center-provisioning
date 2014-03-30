name 'nitocenter'

default_attributes 'ip' => '192.168.1.42',
                   'mounts' => [
                      { path: '/mnt/personal', device: '/dev/sdb1', fstype: 'ext4' },
                      { path: '/mnt/stuff', device: '/dev/sdc1', fstype: 'ext4' }
                   ],
                   'nfs_exports' => [
                      '/mnt/personal 192.168.1.0/255.255.255.0(rw,sync,no_root_squash,insecure,anonuid=1000,anongid=1000)',
                      '/mnt/stuff 192.168.1.0/255.255.255.0(rw,sync,no_root_squash,insecure,anonuid=1000,anongid=1000)'
                   ]
