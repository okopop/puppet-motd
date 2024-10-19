# motd
Template based /etc/motd which shows only the most crucial info about the server.
The ambition is to keep this module simple but relevant and not add values that change often.
I have not tested on all different distros myself but should work if you have normal facter values and the uptime --since command.

- Basic server overview at login
- Add custom server information with hiera
- 'Last reboot' is a more static value than showing number of days uptime, which create unnecessary change noise everyday.
The value could be used to get a hint when a server most likely got updated and rebooted, or if the server is forgotten because of high uptime and need some attention.

## Hiera example

```yaml
---
classes:
  - motd

motd::info: "Product X | Production | Team Y"
```

## Motd example

```
================== Motd by Puppet ==============================
Hostname.........: testhest.example.com
Platform.........: vmware, 2 CPU, 3.47 GiB RAM
Operatingsystem..: Red Hat Enterprise Linux release 8.10 (Ootpa)
Puppet Agent.....: 7.18.0
Last reboot......: 2024-10-19 01:22
Information......: Product X | Production | Team Y
================================================================
```
