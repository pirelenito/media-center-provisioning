bash 'apt_get_update' do
  user 'root'
  environment ({'HOME' => '/root'})
  cwd '/tmp'
  code 'sudo apt-get update'
end

package 'bash-completion'
package 'build-essential'

ifconfig node['ip'] do
  device "eth0"
end
