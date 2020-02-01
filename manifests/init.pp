class linuxusers {
  user {'jhughes':
    name           => 'jhughes',
    groups         => 'wheel',
    state          => present,
    shell          => '/bin/bash',
    purge_ssh_keys => true,
  }

  file { '/etc/sudoers.d/jhughes_all':
    state  => present,
    source => 'puppet:///jhughes_sudoers.txt',
    owner  => 'root',
    group  => 'root',
    mode   => 0644,
  }

  ssh_authorized_key {'jhughes@orange':
    ensure => present,
    user   => 'jhughes',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDKmgan+aR+co+jQuEkeXBw8DurT8EALRyRwQ+Yvdj1Ugcx2YoazK4HTPbi23lKuuxQfdtituUkOMJccgFpT4pJrO9EsDM9CI7fuRuxvyqRNl0E7E4vcFLVeB8qoxVgq2/DXQ1BxPHtCtokCU+vyVYFFpu2e7+hGoDCHdn2lnaZB5Enqjmc+EM2yzuDro7HZFlnB/xjLoZsKKf9ev660OyQtcQ/3PGNfPkim7dPRd6LFEOS71X0kwgz86od/ZDapeJPVwlmDVk95GGq8yqKMw2V/uRsIGKbFUvYtSm/4zQZGelT+2S8mnWlUyaSq6ICnwuhET0sjnpXDNjdwjd+m3l3wbF+FxcROkPDCQTp5OUAxE9FPSPCz20z6RRktUwR/yjnHoJGMUBvUv+6viqYdYBwKEZ+pcYGJ/l5rFpRr22TwAwDRw3jnZveSwVW0h43Hx4Sx8FX5xlIqdep0I6wgALo26r9iJN3UgM/oeXGxfI4GKf7nQbO970ScSegsn3WORovOnkMjTwdDmhrKLS8Avu2746SiNDKIQnczI7JW7CxXShZXs1uOVdRXo7qDTKfZU5K9K3wN+ff82y+DC/lbNWwj7dr/zKRh8ppbmy17PRSlPyVlrSwKwHvBVjQ18ivL3wKwxceselVeUTifJuMO29v1T+2o6ZSTa5H+DPB9JlVsw==',
  }
}
