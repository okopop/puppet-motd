# frozen_string_literal: true

require 'spec_helper'

describe 'motd' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('motd') }
      it do
        is_expected.to contain_file('/etc/motd').with(
          'ensure' => 'present',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        )
      end
      context 'with default_facts.yml' do
        it { is_expected.to contain_file('/etc/motd').with_content(%r{Hostname.........: testhest.example.com}) }
        it { is_expected.to contain_file('/etc/motd').with_content(%r{Platform.........: vmware, 2 CPU, 3.64 GiB RAM}) }
        it { is_expected.to contain_file('/etc/motd').with_content(%r{Operating System.: }) }
        it { is_expected.to contain_file('/etc/motd').with_content(%r{Puppet Agent.....: 7.18.0}) }
        it { is_expected.to contain_file('/etc/motd').with_content(%r{Last reboot......: \d{4}-\d{2}-\d{2}\s\d{2}:\d{2}}) }
      end
      context 'with class parameter info set' do
        # The binding of Hiera data to class parameters is a function of the Puppet core, not of your classes, so you should
        # not consider it in scope for your testing. Once you recognize that, you should also recognize that any means of
        # assigning the wanted class parameter values will do the job. It doesn't have to be Hiera. https://stackoverflow.com/a/73655477
        let(:params) { { 'info' => 'Product X | Production | Team Y' } }

        it { is_expected.to contain_file('/etc/motd').with_content(%r{Information......: Product X | Production | Team Y}) }
      end
      context 'with class parameter warn set' do
        let(:params) { { 'warn' => 'This OS version is EOL since XX-YY-ZZ' } }

        it { is_expected.to contain_file('/etc/motd').with_content(%r{WARNING..........: This OS version is EOL since XX-YY-ZZ}) }
      end
    end
  end
end
