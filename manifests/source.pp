# == Class: django::source
#
# Install Django from source.
#
# === Parameters
#
# [*path*]
#   Location to place source that will be used to run `setup.py install`
# [*source*]
#   Git source repository. Defaults to mainline.
# [*revision*]
#   Any valid git branch, tag or hash. This will be checked out before running
# `setup.py install`
#
# === Examples
#
# Install Django from the latest source code.
#
#  class { 'django::source': }
#
# Install a specific version of Django.
#
#  class { 'django::source': }
#    revision => '1.4',
#  }
#
# Install Django from a forked source using the feature1 branch.
#
#  class { 'django': }
#    revision => 'feature1',
#    source   => 'https://github.com/jbussdieker/django.git',
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
class django::source(
  $path = '/usr/local/src/django',
  $source = 'https://github.com/django/django.git',
  $revision = 'master'
) {

  vcsrepo { 'django':
    ensure   => present,
    path     => $path,
    revision => $revision,
    source   => $source,
    provider => git,
    notify   => Exec['django_install'],
  }

  exec { 'django_install':
    cwd         => $path,
    command     => '/usr/bin/python setup.py install',
    refreshonly => true,
  }

}
