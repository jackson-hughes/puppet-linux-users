# linuxusers manages user accounts from hiera
class linuxusers {
  lookup('users', Hash, 'hash').each | String $username, Hash $attrs | {
    user { $username:
      * => $attrs,
    }

    file { "/etc/sudoers.d/${username}_all":
      ensure  => present,
      content => "${username} ALL=(ALL) NOPASSWD: ALL"
    }
}

  lookup('sshkeys', Hash, 'hash').each | String $key, Hash $attrs | {
    ssh_authorized_key { $key:
      * => $attrs,
    }
  }
}
