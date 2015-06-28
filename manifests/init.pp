# == Class: django
#
# Main class to install django from package (default with fallback to source)
# or from source.
#
# === Parameters
#
# [*ensure*]
#   Defaults to present which will use `django::package` to install the 
# default operating system version any other value will be treated as a version
# string. Operating systems that do not have django package will fallback to
# using source.
#
# === Examples
#
# Install Django without regard for version.
#
#  class { 'django': }
#
# Install specific version of Django
#
#  class { 'django': }
#    ensure => '1.4',
#  }
#
# === Authors
#
# Joshua B. Bussdieker <jbussdieker@gmail.com>
#
# === Copyright
#
# Copyright 2015 Joshua B. Bussdieker, unless otherwise noted.
#
class django(
  $ensure = 'master',
) {

  anchor { 'django::begin': }

  if $::operatingsystem == 'Ubuntu' {
    if $::operatingsystemmajrelease == '14.04' or $::operatingsystemmajrelease == '13.10' or $::operatingsystemmajrelease == '12.04' {
      $has_package = true
    } else {
      $has_package = false
    }
  } elsif $::operatingsystem == 'Debian' {
    if $::operatingsystemmajrelease == '6' or $::operatingsystemmajrelease == '7' {
      $has_package = true
    } else {
      $has_package = false
    }
  } else {
    $has_package = false
  }

  if $ensure == present {

    if $has_package == true {
      class { 'django::package':
        before  => Anchor['django::end'],
        require => Anchor['django::begin'],
      }

    } else {
      class { 'django::source':
        revision => 'master',
        before   => Anchor['django::end'],
        require  => Anchor['django::begin'],
      }
    }

  } elsif $ensure == absent {

    fail('ensure absent not supported')

  } else {

    class { 'django::source':
      revision => $ensure,
      before   => Anchor['django::end'],
      require  => Anchor['django::begin'],
    }

  }

  anchor { 'django::end': }

}
