# minitest-chef-handler
#
# More info at:
#   https://github.com/calavera/minitest-chef-handler#usage
#   https://github.com/btm/minitest-handler-cookbook
#   https://github.com/calavera/minitest-chef-handler/blob/v1.0.0/examples/spec_examples/files/default/tests/minitest/default_test.rb
require 'minitest/spec'
# include_recipe 'jenkins'

describe_recipe 'jenkins-box-for-travis::ensure-plugins' do

  describe 'packages' do
    it 'installed jenkins' do
      package('jenkins').must_be_installed
    end
  end

  describe 'services' do
    it 'runs as a daemon' do
      service('jenkins').must_be_running
    end
  end

  PLUGINS = node['jenkins-box-for-travis'.to_sym][:server][:plugins]
  JENKINS_HOME = node[:jenkins][:server][:home]

  def plugin_file(name)
    File.join(JENKINS_HOME, 'plugins', "#{name}.jpi")
  end

  describe 'plugins' do
    # = Testing plugin files exist =
    #
    # The simplest assertion is that a file exists following the Chef run:
    it 'creates the each plugin.jpi file' do
      PLUGINS.each do |name|
        file(plugin_file(name)).must_exist
      end
    end
  end

end

# PLUGINS = %W(git github rake rvm)
# JENKINS_HOME = '/home/jenkins'

# class TestJenkinsPluginsExist < MiniTest::Chef::TestCase
#   def plugin_file_exist?(name)
#     File.exist?(File.join(JENKINS_HOME, 'plugins', "#{name}.jpi"))
#   end

#   def test_jenkins_plugins_exist
#     PLUGINS.each do |name|
#       assert plugin_file_exist?(name)
#     end
#   end
# end
