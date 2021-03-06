###############################################################################
###############################################################################
# This manifest is for host system configuration
# for team-network virtual labs
# Requires: parser = future
#   puppet apply --parser future -d -v team-network-lab.pp
# Requires modules:
#   puppetlabs/postgresql
#   puppetlabs/vcsrepo
#   thias-sysctl
#   puppetlabs-firewall
#   garethr/docker
#   camptocamp-kmod
#   saz-locales
#
###############################################################################
# Vagrant variables
$vagrant_ver = '1.9.3'
$vagrant_url = "https://releases.hashicorp.com/vagrant/${vagrant_ver}/vagrant_${vagrant_ver}_x86_64.deb"
$vagrant_num_instances = 5
# Docker variables
$docker_version = 'latest'
$docker_compose_version = '1.10.0'
# Gimme variables
$gimme_url = 'https://raw.githubusercontent.com/travis-ci/gimme/master/gimme'
$gimme_path = 'bin/gimme'
# Repo variables
$fuel_tests_repo = 'git://github.com/adidenko/fuel-tests.git'
$fuel_tests_repo_rev = 'master'
$fuel_ccp_installer_repo = 'git://github.com/openstack/fuel-ccp-installer.git'
$fuel_ccp_installer_repo_rev = 'master'
$fuel_qa_repo = 'git://github.com/openstack/fuel-qa.git'
# etc
$path_to_script_for_cron = '/usr/local/bin/run_puppet.sh'
$cron_run_puppet_logs = '/var/log/run_puppet.log'
$temp_path_for_vagrant_package = '/var/tmp'

###############################################################################
# User data
$users_hash = {
  'adidenko' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwKpK7YBECkad/ureUhratFOt9BG4WarY4Vp3E5sdtDk+w7AzrK4gXIsDc+CMHkuTpzNMXSvNXYLskpNt1ndCA455BdEr60pyA/HBsxeqio4J1dwlLRbynZRFhjSR+6OyyAf8QCIGCYQZdkQyrHdEKPQNLMa6Pg5bDI6LiPuf+W+JJfUXpychazkAH0FK8kz+vFmLhIiwzVSzH316jBTv8iAfXjyAcgIE5SwkRMBO6bEpNIL7nMhb24i5cKDRruUAfOrLRYIEzur9b9hXFnZo3OSCjn5JwVJzoHusMj1m60leU5vpSjb4JjXkGlVMDmakASmgwQAir/HKlb3Ca6pQ9 adidenko@adidenko-pc',
    ip_pool      => '10.110.0.0/16:24',
    vagrant_pool => '10.210.0.0/16',
  },
  'svasilenko' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbNUC2UJiVk0bHmbVBHd4L22M3Mc3HVPdZZja7gzzUJDI/MIGoTSX8/Q38olBHg6i/9ePzroMqQS70x/LvuEgfKMDUcEBhggq22zea/wohMmMPwiGTEJ3j0CfckXM2cfjRHweHu4U//4SiSgLHi3nnEhYJUvFkOq10qOtZd2iT76sbKpnIEcRVfDcIy01G/wZQLX0SiCk8hWh9ERBqnW2OjNhwG/a2SdoPN25T1HmHAhLJykcGXb7BmrMNe7XFcNsqleMsopTXcqtZBu+ysEbNywPQKUiJrwqOtzkncQwwuKlr53EaXwBY5UHQwoFSXXi28JjmvEZAzA+UBMrPDHrx',
    ip_pool      => '10.120.0.0/16:24',
    vagrant_pool => '10.220.0.0/16',
  },
  'apanchenko' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzEjBQ4zCsvS/lzB/HZrA9QkblwC4UT2wwV/gO410qSJDMzPUSYfCQNchJEgrxDeOwxBKW1XNt7y46eJ2fFM2Rt66U5WW/VChSbzSrdmnKoRNKeRo8+xWWckCfXAxM1HU0Sx5Rf5jJHO79PKINURnYTgtIC3+wm8AZXeXuYCt5eV8e7ByGwt0ldO/dH3pnAJ9D7v77TGp03odPcsGl4rvj5C1kXhK3UJ9sdum8fW3rFePK6o7SuU7c3IzSFf0rFI2Eydf+RQy/SyA5aLQS/kQFBTNzUhb8HNAj/06x9siB+XPXCkSOwpFdYat/F5Py9PsEIr1xLHN+4Nkm6rpn+5aX apanchenko@mirantis.com',
    ip_pool      => '10.130.0.0/16:24',
    vagrant_pool => '10.230.0.0/16',
  },
  'aroma' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOVomDosX6yuF46qh1HFBWCf8OiJY2nKKfbSNf5BItcHOErtjrOPd0NliPSW+Akr4fy5wln1nlIGfMjq+ZVY1Yv59hBB1Hbebik3K5d+BX9KIYHctjrclXLhtiXCFS/X2XRoMcZwOq1ozdo7S7aKSGl6fZVfaxjF1KMIc7RajmEop3eLYMkurqcxjdhBb2FplEpumHnBJtHhgnCDOI4DwVpczVhUDun5YRmCS7w1VcQ5LQphll5Pnj11G9xw84vwPIINr5NvqkKYudnWjF4elqnPMfr+A9m4ZeBgDZPO6QSMtYL3ZImANwaNtw1poZzxzVgVFmM9yCS/QJjqV3/br4mY6g00hmqqFdnZRi5MTMskvq7aBV11DCgJvrzX24RVmyYi6hFo5pqWqieaGDKSH0I7/kQXbuJnjyCTXdMwaqDiNOZkGoHNwucfNVJ6TugoJWhILpqkqc8hCz4i14v/zbKm7musoeIXUod3UxlVB34PdRhU4m0GznmfOdEWNwz1u29IeeQVunGwwzWnHENvlqMtpiWPXyPjNqO+4VKtzlioYIEgGS4gFGpq+RP0z9EDO9qU/nwUPVfp2izwd39XwKtuqlMLBxf6dYy2FJAd9q6Uzbv0aN5K9CRvsqFSVjzY9Vv0BS0VsZgP9/ie3i98zpPNO7JpqGRjkq64TL6RDyDw== aroma@mirantis.com',
    ip_pool      => '10.140.0.0/16:24',
    vagrant_pool => '10.240.0.0/16',
  },
  'akasatkin' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJFOEwYid83klmXcQs9QBDJwb1EG6Ly7DpJ32aH8gB8uguUPVO3rS/08GNav7+6GFLwlbWHVDe1MIFeNvyqh778B2piCzoajIT8aZFiutjbGtVPfkGkt94mibVutjO36eSEjEDW8GYQ2boisibha6B2mlz126y7nJN1VDSUr05Ro719i696vdN0fglu5DlT6qnOSei16EqkgQcMdyoxCfUOy9zBe3p1jGd2XKCOy3aGkhixEj6oaWSFRcA48SgqNSUO9A5NHTmWT/3j76Jsk92yw4e5OenWJbVx0BkU8q6U5fIncxkIQRYFUqB0X1TT9PnktDD4iJwNMXY7W2hYN2/ aleksey@aleksey-ThinkPad',
    ip_pool      => '10.160.0.0/16:24',
    vagrant_pool => '10.60.0.0/16',
  },
  'apopovych' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDALtQKLsFXAJrOe1FL/5T9Rn7nHuTrfNKVb/reqpnMaPUcmRLPPmT9OqR5DiwYCf78xk8vHh5ogR4Cg5mdpgJwVGkQYhCqjiNiMFmlKImQx0bMlj1vQJk+x7qQQFras5jRHV6Ui2yI3o5laxX7GzgYlt39qMBEtyZrzwHzxfT//NQcFOYnKWjgcH8Z7C+nR8rixaicJEQ7jEAQVyzeA+I94gErd1Uy9LUXO33L4jKStKeQN89vl0OF6rperji1B9qFRb2CW/+kMdLmDBeoKHbTVYikHG8c15E1oaw6EeepWx8AaeFHi9T2+xwOrJ4Pw1UCyi/5d9Qf0RE3FdoAUvnJ falkerson@quasar',
    ip_pool      => '10.180.0.0/16:24',
    vagrant_pool => '10.80.0.0/16',
  },
  'ssalagame' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDD2+mfcpRfoa+vwTeZEF51vhCwbVCYXxWWViIdrhph3uHiEaL3D3v564ECRfn0wqkLHUZNkZu91CTCZQ+h4vXA/owH3kJ9tRlW0c7V+lK5UayprF4bQ3ffk+fipqeqnv8ObqxiD0/9wkfVxWb9jnKNf45PKGp5GLzGgOvAntFZINR1XG3watnzlzmgmRQS9a6Jghr5Acn5FRRPlCXFv+VEg1Eadza34RiY36qVl79vq+9azTKS4nFQhrrid7LxcApCJlQnyYBdfDomcXMEE1ZmCiyoll5jwzTnP/DtR/YpAPcBXZcx/sbO8VnoHVMzA43DmqNLa+F2H9cegbqS6LYP ssalagame@mirantisits-MacBook-Pro-8.local',
    ip_pool      => '10.190.0.0/16:24',
    vagrant_pool => '10.90.0.0/16',
  },
  'aarzhanov' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDULnUS0LRq5K95vo0rFuxRxHt7vK/M/m4HVYNe0FcGnLESeFEb8Ip5NYl2P+77OQP/uPpOnDorFgBqANQXw8pHRihqRNXG7PylrOITHc/0RLiJvIEWt82Fw0Sz/6fY6b+/mVs01kD25MJy5lWNZEtxbbSaCmtst/9+ZIySYPnL2rNf3wTsW/IHDAziCqZr6nxfp0cIPy5KtNdT/AithsPvimdveSe25uEdZKxvfE/r3c6wock73ZIDLb9bzPaPQX5kZc9AAAuBfL2Vtzb9juFvPnwkK3mC/geGppP00wvmO12/WqEHRh92BMVpNOTgYpsvU37E9S5pjbTejTlcLPMR coolenigmaboy@aarzhanov',
    ip_pool      => '10.115.0.0/16:24',
    vagrant_pool => '10.215.0.0/16',
  },
}

define shell_user(
  $user_hash,
  $user = $name,
){
  user { $user:
    ensure => present,
    shell  => '/bin/bash',
    groups => ['libvirtd', 'docker'],
    home   => "/home/${user}",
  } ->
  file { "/home/${user}":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0750',
  } ->
  file { "/home/${user}/.ssh":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0700',
  } ->
  file { "/home/${user}/.ssh/authorized_keys":
    ensure  => file,
    owner   => $user,
    group   => $user,
    mode    => '0644',
    content => $user_hash[$user]['pubkey'],
  } ->
  file { "/home/${user}/bin":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0775',
  } ->
  exec { "download_gimme_for_${user}":
    command     => "wget -O /home/${user}/${gimme_path} ${gimme_url}",
    unless      => "test -f /home/${user}/${gimme_path}",
    environment => "HOME=/home/${user}",
    cwd         => "/home/${user}",
  } ->
  file { "/home/${user}/${gimme_path}":
    ensure  => present,
    replace => 'no',
    owner   => $user,
    group   => $user,
    mode    => '0775',
  } ->
  file { [ "/home/${user}/gopath", "/home/${user}/gopath/src",
    "/home/${user}/gopath/src/github.com",
    "/home/${user}/gopath/src/github.com/Mirantis" ]:
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0775',
  } ->
  file { "/home/${user}/fuel-ccp-workspace":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755',
  } ->
  vcsrepo { "/home/${user}/fuel-tests":
    ensure   => present,
    # if use "ensure => latest",
    # this overwrites any local changes to the repository.
    provider => git,
    source   => $fuel_tests_repo,
    revision => $fuel_tests_repo_rev,
    user     => $user,
  } ->
  vcsrepo { "/home/${user}/fuel-ccp-installer":
    ensure   => present,
    # if use "ensure => latest",
    # this overwrites any local changes to the repository.
    provider => git,
    source   => $fuel_ccp_installer_repo,
    revision => $fuel_ccp_installer_repo_rev,
    user     => $user,
  }

  $master_ip  = inline_template('<%= @user_hash[@user]["ip_pool"].gsub("0/16:24", "2") %>')
  $public_vip = inline_template('<%= @user_hash[@user]["ip_pool"].gsub("0.0/16:24", "3.3") %>')
  $octets     = split($user_hash[$user]['ip_pool'], '[.]')
  firewall { "300 ${user}_fuelweb_nat":
    table  => 'nat',
    proto  => 'tcp',
    chain  => 'PREROUTING',
    jump   => 'DNAT',
    dport  => "8${octets[1]}",
    todest => "${master_ip}:8443",
  }
  firewall { "300 ${user}_fuelweb_allow":
    proto       => 'tcp',
    destination => $master_ip,
    dport       => '8443',
    action      => 'accept',
    chain       => 'FORWARD',
  }
  firewall { "400 ${user}_fuelssh_nat":
    table  => 'nat',
    proto  => 'tcp',
    chain  => 'PREROUTING',
    jump   => 'DNAT',
    dport  => "2${octets[1]}",
    todest => "${master_ip}:22",
  }
  firewall { "400 ${user}_fuelssh_allow":
    proto       => 'tcp',
    destination => $master_ip,
    dport       => '22',
    action      => 'accept',
    chain       => 'FORWARD',
  }
  firewall { "500 ${user}_horizon_nat":
    table  => 'nat',
    proto  => 'tcp',
    chain  => 'PREROUTING',
    jump   => 'DNAT',
    dport  => "9${octets[1]}",
    todest => "${public_vip}:80",
  }
  firewall { "500 ${user}_horizon_allow":
    proto       => 'tcp',
    destination => $public_vip,
    dport       => '80',
    action      => 'accept',
    chain       => 'FORWARD',
  }

  # Vagrant plugin
  exec { "${user}-vagrant-libvirt-plugin":
    command     => 'vagrant plugin install vagrant-libvirt',
    unless      => 'vagrant plugin list | grep -q vagrant-libvirt',
    tag         => ['vagrant'],
    user        => $user,
    group       => $user,
    timeout     => 300,
    environment => "HOME=/home/${user}",
    cwd         => "/home/${user}",
  }

  # Vagrant lab firewall
  $node2_ip = inline_template('<%= @user_hash[@user]["vagrant_pool"].gsub("0/16", "12") %>')
  $v_octets = split($user_hash[$user]['vagrant_pool'], '[.]')
#  firewall { "500 ${user}_k8s_dashboard_nat":
#    table  => 'nat',
#    proto  => 'tcp',
#    chain  => 'PREROUTING',
#    jump   => 'DNAT',
#    dport  => "9${v_octets[1]}",
#    todest => "${node2_ip}:9090",
#  }
#  firewall { "500 ${user}_k8s_dashboard_masquerade":
#    table       => 'nat',
#    chain       => 'POSTROUTING',
#    jump        => 'MASQUERADE',
#    proto       => 'all',
#    destination => "${node2_ip}",
#    source      => "! ${v_octets[0]}.${v_octets[1]}.0.0/24",
#  }
#  firewall { "500  ${user}_k8s_dashboard_allow":
#    proto       => 'tcp',
#    destination => "${node2_ip}",
#    dport       => '9090',
#    action      => 'accept',
#    chain       => 'FORWARD',
#  }

  # Vagrant skeleton
  $user_subnet = inline_template('<%= @user_hash[@user]["vagrant_pool"].gsub(".0.0/16.*", "") %>')

  file { "/home/${user}/vagrant":
    ensure => directory,
    owner  => $user,
    group  => $user,
  } ->
  file { "/home/${user}/vagrant/Vagrantfile.example":
    ensure  => file,
    owner   => $user,
    group   => $user,
    content => inline_template('# Controlled by puppet
# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["VAGRANT_DEFAULT_PROVIDER"] = "libvirt"

$num_instances = <%= @vagrant_num_instances %>
$vm_memory = 2048
$vm_cpus = 2

$user = "<%= @user %>"
$public_subnet = "<%= @user_subnet %>.0"
$private_subnet = "<%= @user_subnet %>.1"
$mgmt_cidr = "<%= @user_subnet %>.2.0/24"

$instance_name_prefix = "#{$user}-k8s"
# Boxes with libvirt provider support:
#$box = "yk0/ubuntu-xenial" #900M
#$box = "centos/7"
$box = "nrclark/xenial64-minimal-libvirt"

Vagrant.configure("2") do |config|
  (1..$num_instances).each do |i|
    config.ssh.insert_key = false
    vm_name = "%s-%02d" % [$instance_name_prefix, i]
    config.vm.define vm_name do |test_vm|
      test_vm.vm.box = $box
      test_vm.vm.hostname = vm_name
      test_vm.vm.provider :libvirt do |domain|
        domain.uri = "qemu+unix:///system"
        domain.memory = $vm_memory
        domain.cpus = $vm_cpus
        domain.driver = "kvm"
        domain.host = "localhost"
        domain.connect_via_ssh = false
        domain.username = $user
        domain.storage_pool_name = "default"
        domain.nic_model_type = "e1000"
        domain.management_network_name = "#{$instance_name_prefix}-mgmt-net"
        domain.management_network_address = $mgmt_cidr
      end

      test_vm.vm.network :private_network,
        :ip => "#{$private_subnet}.#{i+10}",
        :model_type => "e1000",
        :libvirt__network_name => "#{$instance_name_prefix}-private",
        :libvirt__dhcp_enabled => false,
        :libvirt__forward_mode => "none"

    end
  end
end
')
  }
}

###############################################################################
# Install docker, docker-compose
Class['docker'] -> Shell_user<||>

class { '::docker::compose':
  ensure  => present,
  version => $docker_compose_version,
}

class { '::docker':
#  docker_users => $users,
  version => $docker_version,
}

$users = map($users_hash) |$x| { $x[0] }

shell_user { $users:
  user_hash => $users_hash,
  require   => Package['libvirt-bin'],
}

###############################################################################
# Configure locales
class { '::locales':
  default_locale => 'en_US.UTF-8',
  locales        => ['en_US.UTF-8 UTF-8', 'ru_RU.UTF-8 UTF-8' ],
  lc_all         => 'en_US.UTF-8',
}

###############################################################################
# Install software
Class['locales'] -> Package<| tag == 'software' |>
Package<| tag == 'software' |> -> Exec<| tag == 'software' |>

$packages = [
  'git',
  'postgresql',
  'postgresql-server-dev-all',
  'libyaml-dev',
  'libffi-dev',
  'python-dev',
  'python-libvirt',
  'python-pip',
  'qemu-kvm',
  'qemu-utils',
  'libvirt-bin',
  'libvirt-dev',
  'ubuntu-vm-builder',
  'bridge-utils',
  'python-virtualenv',
  'libpq-dev',
  'libgmp-dev',
  'createrepo',
  'rpm',
  'dpkg-dev',
  'iptables-persistent'
]

package { $packages:
  ensure => installed,
  tag    => ['software'],
}

###############################################################################
# Configure libvirt
# !!!!exec magick!!!!
Exec<||>{
  path      => ['/bin/', '/usr/bin', '/sbin', '/usr/sbin', '/usr/local/bin'],
  logoutput => true,
}

Class['locales'] -> Exec<| tag == 'libvirt' |>
Package<| tag == 'software' |> -> Exec<| tag == 'libvirt' |>

exec { 'virsh-pool-create':
  command => 'virsh pool-define-as --type=dir --name=default --target=/var/lib/libvirt/images',
  unless  => 'virsh pool-list --all | grep default',
  tag     => ['libvirt'],
} ->
exec { 'virsh-pool-autostart':
  command => 'virsh pool-autostart default',
  unless  => 'virsh pool-list --all | grep default | grep yes',
  tag     => ['libvirt'],
} ->
exec { 'virsh-pool-start':
  command => 'virsh pool-start default',
  unless  => 'virsh pool-list | grep default | grep active',
  tag     => ['libvirt'],
}

###############################################################################
# Configure virtualenv, devops, fuel-qa requirements, etc
Class['locales'] -> Class['postgresql::server']
Class['locales'] -> Virtual_env<||>

$venvs = [
  '/opt/fuel-devops-venv-master',
  '/opt/fuel-devops-venv-newton',
  '/opt/fuel-devops-venv-mitaka'
]

$fuel_qa_hash = {
  'fuel-qa-master' => {
    rev  => 'master',
    venv => 'fuel-devops-venv-master',
  },
  'fuel-qa-newton' => {
    rev  => 'stable/newton',
    venv => 'fuel-devops-venv-newton',
  },
  'fuel-qa-mitaka' => {
    rev  => 'stable/mitaka',
    venv => 'fuel-devops-venv-mitaka',
  },
}

$fuel_qa = map($fuel_qa_hash) |$x| { $x[0] }

define virtual_env(
  $venv = $name,
){
  exec { "create-virtual-env_${venv}":
    command => "virtualenv --no-site-packages ${venv}",
    creates => $venv,
  } ->
  exec { "setup-fuel-devops-for_${venv}":
    command => "bash -c 'source ${venv}/bin/activate ; pip install git+https://github.com/openstack/fuel-devops.git@3.0.3#egg=project[postgre] --upgrade ; dos-manage.py migrate'",
    creates => "${venv}/lib/python2.7/site-packages/devops",
  } ->
  exec { "setup-fuel-plugin-builder-for_${venv}":
    command => "bash -c 'source ${venv}/bin/activate ; pip install fuel-plugin-builder'",
    creates => "${venv}/lib/python2.7/site-packages/fuel_plugin_builder",
  }
}

define fuelqa(
  $fuelqa_hash,
  $fuel_qa = $name,
){
  $python_venv = $fuelqa_hash[$fuel_qa]['venv']
  $git_rev     = $fuelqa_hash[$fuel_qa]['rev']
  vcsrepo { "/opt/${fuel_qa}":
    ensure   => present,
    # if use "ensure => latest",
    # this overwrites any local changes to the repository.
    provider => git,
    source   => $fuel_qa_repo,
    revision => $git_rev,
  } ->
  file { "/opt/${fuel_qa}":
    ensure => directory,
    mode   => '0777',
  } ->
  file { "/opt/${fuel_qa}/nosetests.xml":
    ensure => file,
    mode   => '0666',
  } ->
  exec { "setup-${fuel_qa}":
    cwd     => "/opt/${fuel_qa}",
    command => "bash -c 'source /opt/${python_venv}/bin/activate ; pip install -r ./fuelweb_test/requirements.txt --upgrade'",
    creates => "/opt/${python_venv}/lib/python2.7/site-packages/openstack",
  }
#  tidy { "delete-requirements-in-${fuel_qa}":
#    path    => "/opt/${fuel_qa}/fuelweb_test",
#    recurse => 1,
#    matches => [ 'requirements*.txt' ],
#    rmdirs  => false,
#  }
}

#exec { 'update-pg-config':
#  command => "sed -ir 's/peer/trust/' $pg_conf",
#  onlyif  => "grep -v ^# $pg_conf | grep peer"
#} ~>
#service { 'postgresql':
#  ensure => running,
#}

class { '::postgresql::server': }

postgresql::server::db { 'nailgun':
  user     => 'nailgun',
  password => postgresql_password('nailgun', 'nailgun'),
}

postgresql::server::db { 'fuel_devops':
  user     => 'fuel_devops',
  password => postgresql_password('fuel_devops', 'fuel_devops'),
} ->
virtual_env { $venvs: } ->
exec { 'setup-django-db':
  command => 'bash -c "source /opt/fuel-devops-venv-master/bin/activate ; django-admin.py syncdb --settings=devops.settings ; django-admin.py migrate devops --settings=devops.settings"',
  unless  => 'bash -c "source /opt/fuel-devops-venv-master/bin/activate ; dos.py list"',
} ->
fuelqa { $fuel_qa:
  fuelqa_hash => $fuel_qa_hash,
}


kmod::load { 'br_netfilter': } ->
sysctl { 'net.bridge.bridge-nf-call-iptables': value => '0' }

###############################################################################
# Create directories for logs, iso and profile file. 
file { '/var/log/nailgun':
  ensure => directory,
  mode   => '0777',
}

file { '/opt/fuel-iso':
  ensure => directory,
  mode   => '0777',
}

file { '/etc/profile.d/team-network.sh':
  ensure  => file,
  mode    => '0755',
  content => inline_template('# created by puppet

declare -A ip_pools
ip_pools=( \
<% @users_hash.each do |user, user_hash| -%>
["<%= user %>"]="<%= user_hash["ip_pool"] %>" \
<% end -%>
)

declare -A vagrant_pools
vagrant_pools=( \
<% @users_hash.each do |user, user_hash| -%>
["<%= user %>"]="<%= user_hash["vagrant_pool"] %>" \
<% end -%>
)

declare -A fmaster
fmaster=( \
<% @users_hash.each do |user, user_hash|
  master_port = user_hash["ip_pool"].split(/\./)[1] -%>
["<%= user %>"]="<%= @fqdn %>:8<%= master_port %>" \
<% end -%>
)
export POOL_DEFAULT="${ip_pools[$(whoami)]}"
export VAGRANT_POOL="${vagrant_pools[$(whoami)]}"
export MY_MASTER="${fmaster[$(whoami)]}"
export GOPATH="${HOME}"/gopath
export PATH="${HOME}"/bin:"${HOME}"/gopath/bin:"${PATH}"
function helpme {
echo -e "\e[34m########################################################################\e[0m    "
echo -e "\e[34m#                        # TEAM-NETWORK INFO #                         #\e[0m    "
echo -e "\e[34m########################################################################\e[0m    "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mFuel-devops path:\e[0m                                              "
echo -e "\e[34m#\e[0m    /opt/fuel-devops-venv-master ( for Fuel 11 and CCP installer )         "
echo -e "\e[34m#\e[0m    /opt/fuel-devops-venv-newton ( for Fuel 10 )                           "
echo -e "\e[34m#\e[0m    /opt/fuel-devops-venv-mitaka ( for Fuel 9.x )                          " 
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mFuel-qa path:\e[0m                                                  "
echo -e "\e[34m#\e[0m    /opt/fuel-qa-master ( for Fuel 11 )                                    "
echo -e "\e[34m#\e[0m    /opt/fuel-qa-newton ( for Fuel 10 )                                    "
echo -e "\e[34m#\e[0m    /opt/fuel-qa-mitaka ( for Fuel 9.x )                                   "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mTest scripts path:\e[0m                                             " 
echo -e "\e[34m#\e[0m    "${HOME}"/fuel-tests                                                   "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mDirectory for ISO sharing:\e[0m                                     "
echo -e "\e[34m#\e[0m    /opt/fuel-iso                                                          "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#                        # COMMANDS: #\e[0m                                      "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mRun tests:\e[0m                                                     "
echo -e "\e[34m#\e[0m    * Activate the necessary fuel-devops venv and list envs:               "
echo -e "\e[34m#\e[0m       \e[37m . /opt/fuel-devops-venv-XXXXXX/bin/activate \e[0m            "
echo -e "\e[34m#\e[0m       \e[37m dos.py list \e[0m                                            "
echo -e "\e[34m#\e[0m    * Edit some variables, if needed and run tests:                        "
echo -e "\e[34m#\e[0m       \e[37m vim ~/fuel-tests/testsrc \e[0m                               "
echo -e "\e[34m#\e[0m       \e[37m bash ~/fuel-tests/systest.sh -h \e[0m                        "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  Your \e[4mFUEL WEB URL\e[0m is:\e[33m https://"${MY_MASTER}"/\e[0m       "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  Your \e[4mIP_POOL\e[0m for SYSTEM-TESTS is:\e[33m "${POOL_DEFAULT}"\e[0m "
echo -e "\e[34m#\e[0m  You can make sure it\'s set by running this command:                     "
echo -e "\e[34m#\e[0m   \e[37m echo \$POOL_DEFAULT \e[0m                                        "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mAll info about vargant env:\e[0m                                    "
echo -e "\e[34m#\e[0m    \e[32m https://github.com/adidenko/vagrant-k8s \e[0m                   "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  Your \e[4mVAGRANT POOL\e[0m is:\e[33m "${VAGRANT_POOL}"\e[0m             "
echo -e "\e[34m#\e[0m  You can make sure it\'s set by running this command:                     "
echo -e "\e[34m#\e[0m   \e[37m echo \$VAGRANT_POOL \e[0m                                        "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mSetup Go:\e[0m                                                      "
echo -e "\e[34m#\e[0m    * Example (specify your Go version):                                   "
echo -e "\e[34m#\e[0m       \e[37m GIMME_OUTPUT=\$(gimme 1.7.5) && eval "\$GIMME_OUTPUT" \e[0m  "
echo -e "\e[34m#\e[0m    * Check gimme version, go version, go env:                             "
echo -e "\e[34m#\e[0m       \e[37m gimme version \e[0m                                          "
echo -e "\e[34m#\e[0m       \e[37m go version \e[0m                                             "
echo -e "\e[34m#\e[0m       \e[37m go env \e[0m                                                 "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m########################################################################\e[0m    "
echo -e "\e[34m#                        # TEAM-NETWORK INFO #                         #\e[0m    "
echo -e "\e[34m########################################################################\e[0m    "
}
helpme
')
}

###############################################################################
# Script and cron to run
### Implemented in puppet_apply.sh ###
#file { '/usr/local/bin/run_puppet.sh':
#  ensure  => file,
#  mode    => '0755',
#  content => '#!/bin/bash
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
#date
#iptables --version
#while `iptables -L --line-numbers -nv | grep _allow | head -n1 | awk \'{print $1}\' | xargs iptables -D FORWARD $i ` ; do echo REMOVED; done
#puppet apply --parser future -d -v /home/adidenko/team-network-lab.pp &> /var/log/puppet.log
#',
#}
### Implemented in puppet_apply.sh ###

cron { 'run_puppet':
  command => "${path_to_script_for_cron} &>${cron_run_puppet_logs}",
  user    => 'root',
  minute  => '*/20',
}

###############################################################################
# Vagrant
Exec<| tag == 'libvirt' |> -> Exec<| tag == 'vagrant' |>
Package<| tag == 'vagrant' |> -> Exec<| tag == 'vagrant' |>

$vagrant_packages = [
  'bundler',
  'libxml2-dev',
  'libxslt-dev',
  'zlib1g-dev',
  'ruby-dev',
  'ruby-libvirt'
]

package { $vagrant_packages:
  ensure => installed,
  tag    => ['vagrant'],
}

exec { 'download_vagrant':
  command => "wget -O ${temp_path_for_vagrant_package}/vagrant_${vagrant_ver}_x86_64.deb ${vagrant_url}",
  unless  => "test -f ${temp_path_for_vagrant_package}/vagrant_${vagrant_ver}_x86_64.deb",
}

package { 'vagrant':
  ensure   => latest,
  provider => 'dpkg',
  source   => "${temp_path_for_vagrant_package}/vagrant_${vagrant_ver}_x86_64.deb",
  tag      => ['vagrant'],
  require  => Exec['download_vagrant'],
}

#$vagrant_gems = [
#  'nokogiri'
#]
#package { $vagrant_gems:
#  ensure   => installed,
#  provider => "gem",
#  tag      => ['vagrant'],
#}

###############################################################################
###############################################################################
