# motd
A very basic motd, keep it simple.

Template based /etc/motd which shows the most crucial info about the server.

- Basic server recap at login
- Add server specific information with hiera
- 'Last reboot' is a more static value than showing number of days uptime, which create unnecessary change noise everyday.
The value could be used to get a hint when a server most likely got updated and rebooted, or if the server is forgotten because for high uptime and need some attention.

## Hiera

```yaml
---
classes:
  - motd

motd::ensure: present (default)
motd::ensure: absent
motd::info: "this server does xyz"
```

## Example

```
==================== Motd by Puppet ====================
Hostname...........: testhest.example.com
Platform...........: vmware, 2 CPU, 3.47 GiB RAM
Operatingsystem....: RedHat 8.10
Puppet Agent.......: 7.18.0
Last reboot........: 2024-10-19 01:22
Information........: this server does xyz
========================================================
```
