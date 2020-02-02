class linuxusers {
  lookup('users', Hash, 'hash').each | String $username, Hash $attrs | {
    user { $username:
      * => $attrs,
    }
}

  file { '/etc/sudoers.d/jhughes_all':
    ensure  => present,
    source  => 'puppet:///modules/linuxusers/jhughes_sudoers.txt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  lookup('sshkeys', Hash, 'hash').each | String $key, Hash $attrs | {
    ssh_authorized_key { $key:
      * => $attrs,
    }
  }
}
