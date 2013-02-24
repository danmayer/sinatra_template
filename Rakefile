require "rubygems"
require 'rake'
require 'rake/testtask'

task :default => :test

desc "run tests"
task :test do
  # just run tests, nothing fancy
  Dir["test/**/*.rb"].sort.each { |test|  load test }
end

desc "Build a new project from template"
task :clone do
     if ENV['project'].nil?
       puts "requires project variable example: bundle exec rake clone project='project_name'"
     else
       puts "building project: #{ENV['project']}"
     end
end