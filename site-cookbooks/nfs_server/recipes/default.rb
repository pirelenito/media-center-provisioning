package 'rpcbind'
package 'nfs-kernel-server'
package 'nfs-common'


template '/etc/exports' do
  source 'exports.erb'
  mode 00644
end


template '/etc/default/rpcbind' do
  source 'rpcbind'
  mode 00644
end


template '/etc/default/nfs-common' do
  source 'nfs-common'
  mode 00644
end


template '/etc/idmapd.conf' do
  source 'idmapd.conf'
  mode 00644
end


template '/etc/hosts.allow' do
  source 'hosts.allow'
  mode 00644
end


bash 'export-fs' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    exportfs -ra
  EOH
end


service 'nfs-kernel-server' do
  action :restart
end


service 'rpcbind' do
  action :start
end
