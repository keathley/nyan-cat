require 'rake/testtask'
require 'bundler'

task :default => [:test]

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['spec/*_spec.rb']
  t.verbose = true
end

Bundler::GemHelper.install_tasks