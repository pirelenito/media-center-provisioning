bash 'nvidia-repository' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    add-apt-repository ppa:ubuntu-x-swat/x-updates
  EOH
end


package 'nvidia-current'

