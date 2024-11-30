[![Puppet Forge version](https://img.shields.io/puppetforge/v/okopop/motd)](https://forge.puppet.com/modules/okopop/motd)
[![Puppet Forge - PDK version](https://img.shields.io/puppetforge/pdk-version/okopop/motd)](https://forge.puppet.com/modules/okopop/motd)
[![Puppet Forge quality score](https://img.shields.io/puppetforge/qualityscore/okopop/motd)](https://forge.puppet.com/modules/okopop/motd)
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/okopop/puppet-motd/pdk.yml)](https://github.com/okopop/puppet-motd/actions/workflows/pdk.yml)

# motd

#### Table of Contents

1. [Overview](#overview)
1. [Module Description](#module-description)
1. [Setup - The basics of getting started](#setup)
1. [Usage - Configuration options](#usage)
1. [Example output](#example)
1. [Development - Guide for contributing to the module](#development)

## Overview

Show the most relevant server information in /etc/motd

## Module description

This module creates a /etc/motd file.
It shows the most relevant information about the server by default and you can add your own
messages as either Information or WARNING when needed.
The content displayed from this module in motd is a good foundation for all servers out there.

This module is templated based and does the following:

- Show a simple server summary.
- Add information message with hiera.
- Add warning message with hiera, when you want to get an important message out to the users that log in.
- Show when server was last rebooted. The value 'Last reboot' is very static and is a better option than showing uptime in days, which create unnecessary change noise every day.
The value could be used to get a hint when a server most likely was patched and rebooted, or if the server is forgotten because of high uptime and need some attention.

## Setup

Any of these will include motd to the catalog and create the /etc/motd file with default values from facts.

```puppet
include motd

```
or hiera

```yaml
---
classes:
  - motd
```

## Usage

Add your own messages with hiera to be displayed in /etc/motd

```yaml
motd::info: "Product X | Production | Team Y"
motd::warn: "This OS version is EOL since XX-YY-ZZ"
```

## Example

```
================== Motd by Puppet ==============================
Hostname.........: testhest.example.com
Platform.........: vmware, 2 CPU, 3.47 GiB RAM
Operating System.: Red Hat Enterprise Linux release 8.10 (Ootpa)
Puppet Agent.....: 7.18.0
Last reboot......: 2024-10-19 01:22
Information......: Product X | Production | Team Y
WARNING..........: This OS version is EOL since XX-YY-ZZ
================================================================
```

## Development

The ambition is to keep the motd file short and simple and not add values that change often.
I have not tested on all different distros myself but should work if you have normal fact values.

Feel free to contribute with ideas!
