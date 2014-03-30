name 'media_center'
description 'Media Center'

run_list 'recipe[base]',
         'recipe[nvidia]',
         'recipe[nfs_server]',
         'recipe[xbmc]'
