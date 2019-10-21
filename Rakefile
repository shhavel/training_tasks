begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = 'lessons/*_spec.rb'
  end
  task default: :spec
rescue LoadError
end
