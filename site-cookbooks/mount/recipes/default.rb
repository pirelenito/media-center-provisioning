node['mounts'].each do |definition|
  directory definition['path'] do
    owner 'root'
    group 'root'
    mode '0775'
    recursive true
    action :create
  end

  mount definition['path'] do
    device definition['device']
    fstype definition['fstype']
    options 'rw,nosuid,nodev,uhelper=udisks2'
    action [:mount, :enable]
  end
end
