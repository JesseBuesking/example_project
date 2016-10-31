#
#-*- ruby -*-
#

require "rubygems"
require "hoe"
require "rake/extensiontask"

# Hoe.plugin :compiler
# Hoe.plugin :gem_prelude_sucks
# Hoe.plugin :inline
# Hoe.plugin :minitest
# Hoe.plugin :racc
# Hoe.plugin :rcov
# Hoe.plugin :rdoc

Hoe.spec 'example_project' do
  developer('Jesse Buesking', 'jessebuesking@example.com')
  self.readme_file = 'README.txt'
  self.history_file = 'History.txt'
  self.extra_dev_deps << ['rake-compile', '>= 0']
  self.spec_extras = { :extensions => ["ext/example_project/extconf.rb"] }

  Rake::ExtensionTask.new('example_project', spec) do |ext|
    ext.lib_dir = File.join('lib', 'example_project')
  end

  license "MIT" # this should match the license in the README
end

# vim: syntax=ruby

Rake::Task[:test].prerequisites << :compile
