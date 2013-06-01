require "rubygems"
require 'rake'
require 'rake/testtask'

task :default => :clone_web

desc "Build a new web app project from template"
task :clone_web do
     if ENV['project'].nil?
       puts "requires project variable example: bundle exec rake clone_web project='project_name'"
     else
       project_name = ENV['project']
       puts "building project: #{project_name}"
       cmds = ["mkdir #{project_name}",
               "cp -R ./sinatra_template/web/ ./#{project_name}/",
               "cp ./sinatra_template/README.md ./#{project_name}/"
              ]
       cmds.map{ |cmd| run_cmd_in_dir('../',cmd) } 
       cmds = ["rm -rf .git",
               "git init",
               "rm -rf .rvmrc",
               "rm -rf tmp/*",
               "echo \"rvm use ruby-1.9.3-p392 --create\"  >> .rvmrc",
               "find ./ -type f -exec sed -i '' 's/SINATRA_TEMPLATE/#{project_name}/g' {} \\;"]
       cmds.map{ |cmd| run_cmd_in_dir("../#{project_name}",cmd) }
     end
end

desc "Build a new api project from template"
task :clone_api do
     if ENV['project'].nil?
       puts "requires project variable example: bundle exec rake clone_api project='project_name'"
     else
       project_name = ENV['project']
       puts "building project: #{project_name}"
       cmds = ["mkdir #{project_name}",
               "cp -R ./sinatra_template/api/ ./#{project_name}/",
               "cp ./sinatra_template/README.md ./#{project_name}/"
              ]
       cmds.map{ |cmd| run_cmd_in_dir('../',cmd) } 
       cmds = ["rm -rf .git",
               "git init",
               "rm -rf .rvmrc",
"rm -rf tmp/*",
               "echo \"rvm use ruby-1.9.3-p392 --create\"  >> .rvmrc",
               "find ./ -type f -exec sed -i '' 's/SINATRA_TEMPLATE/#{project_name}/g' {} \\;"]

       cmds.map{ |cmd| run_cmd_in_dir("../#{project_name}",cmd) }
     end
end

def run_cmd_in_dir(dir, cmd)
  Dir.chdir(dir) do
    puts "running #{cmd}"
    puts `#{cmd}`
  end
end
