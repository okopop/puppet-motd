# @summary motd kiss
#
# @example
#   include motd
#
# @param ensure
#   Should the file exist or not
# @param info
#   Set information message from hiera
#
class motd (
  Optional[String] $info                     = undef,
  Variant[Enum['present', 'absent']] $ensure = 'present',
) {
  file { '/etc/motd':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('motd/motd.epp'),
  }
}
