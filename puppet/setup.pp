exec { 'install_docker':
  command => 'yum install -y yum-utils && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && yum install -y docker-ce docker-ce-cli containerd.io',
  unless  => 'rpm -q docker-ce',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin']
}

service { 'docker':
  ensure    => 'running',
  enable    => true,
  require   => Exec['install_docker'],
}

exec { 'install_docker_compose':
  command => 'curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose',
  unless  => 'test -f /usr/local/bin/docker-compose',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  require => Service['docker'],
}

exec { 'run_docker_compose':
  command => 'cd /vagrant && /usr/local/bin/docker-compose up -d',
  require => Exec['install_docker_compose'],
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}
