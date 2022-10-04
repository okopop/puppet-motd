Facter.add(:motd_last_reboot) do
  setcode do
    lastboot = Facter::Core::Execution.execute('/usr/bin/uptime --since')
    lastboot.slice(0..-4) # to 4th char from the end
  end
end
