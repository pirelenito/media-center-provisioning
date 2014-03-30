name 'media_center'
description 'Media Center'

run_list 'recipe[base]',
         'recipe[mount]',
         'recipe[nvidia]',
         'recipe[nfs_server]',
         'recipe[xbmc]'
