require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format', 'documentation']
end

task :console do
  require 'pry'
  require 'adroller'

  def reload!
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/rxsd\// }
    files.each { |file| load file }
  end

  ARGV.clear
  Pry.start
end

task :default => :spec
