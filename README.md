# Django

[![Puppet Forge](http://img.shields.io/puppetforge/v/jbussdieker/django.svg)](https://forge.puppetlabs.com/jbussdieker/django)
[![Build Status](https://travis-ci.org/jbussdieker/puppet-django.svg?branch=master)](https://travis-ci.org/jbussdieker/puppet-django)

## Usage

To install Django with the default parameters

```puppet
class { 'django': }
```

Installing a specific version

```puppet
class { 'django':
  ensure => '1.4',
}
```

Installing and configuring using Hiera

```yaml
classes:
 - django
django::ensure: 1.4
```

## Run All Beaker Tests

    bundle exec rake beaker_nodes | xargs -I NODE bundle exec rake beaker BEAKER_set=NODE
