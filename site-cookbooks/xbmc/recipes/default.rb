bash 'xbmc-repository' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    add-apt-repository ppa:team-xbmc/ppa
    apt-get update
  EOH
end


# disables screen lock
template '/usr/share/applications/lubuntu-screenlock.desktop' do
  source 'lubuntu-screenlock.desktop'
end


# fixes screen tearing while playback
template '/etc/lightdm/lightdm.conf' do
  source 'lightdm.conf'
end


package 'python-software-properties pkg-config'
package 'software-properties-common'
package 'xbmc'
