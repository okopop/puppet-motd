Facter.add(:motd_last_reboot) do
  # N.B. seconds can flip back and forth and create unwanted changes, skip them
  setcode do
    # This becomes empty when uptime command does not have "--since" implemented
    lastboot = Facter::Core::Execution.execute('/usr/bin/uptime --since')
    if !lastboot.empty?
      lastboot.slice(0..-4) # to 4th char from the end
    else
      # This is a solid fallback when uptime command does not work as expected
      Facter::Core::Execution.execute('date -d "@$(($(date +%s) - $(awk \'{print int($1)}\' /proc/uptime)))" +"%Y-%m-%d %H:%M"')
    end
  end
end
