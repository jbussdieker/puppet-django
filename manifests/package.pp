# == Class: django::package
#
# Simple class to install the django package
#
# === Examples
#
# Install default operating system Django.
#
#  include django
#
# === Authors
#
# Joshua B. Bussdieker <jbussdieker@gmail.com>
#
# === Copyright
#
# Copyright 2015 Joshua B. Bussdieker, unless otherwise noted.
#
class django::package {

  package { 'python-django':
    ensure => present,
  }

}
