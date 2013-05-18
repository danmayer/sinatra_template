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
       project_name = ENV['project']
       puts "building project: #{project_name}"
       cmds = ["mkdir #{project_name}",
               "cp -R ./sinatra_template/ ./#{project_name}/"]
       cmds.map{ |cmd| run_cmd_in_dir('../',cmd) } 
       cmds = ["rm -rf .git",
               "git init",
               "rm -rf .rvmrc",
               "echo \"rvm use ruby-1.9.3-p392@#{project_name} --create\"  >> .rvmrc"]
       cmds.map{ |cmd| run_cmd_in_dir("../#{project_name}",cmd) }
     end
end

def run_cmd_in_dir(dir, cmd)
  Dir.chdir(dir) do
    puts "running #{cmd}"
    puts `#{cmd}`
  end
end
