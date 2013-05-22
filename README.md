Sinatra Template
===

This is a Sinatra template starter project it now contains two templates web and api. The web is optimized to have a front end view, while that api is setup for a quick api only setup with no UI.

We includes bootstrap, Jquery, and some base CSS/JS.

This is just basically a personal template and won't be trying to support a bunch of configurable use cases, but feel free to use it if you find it helpful

## To clone a project

__webapp__

    rake clone_web project=web_example
__api__

    rake clone_api project=api_example

## To Run Examples Locally

__webapp__

    cd web
    bundle exec rackup -p 3000

__api__

    cd api
    bundle exec rackup -p 3000

## TODO

  * Provide better instructions on what to rename and redo
  * Instructions for getting running with Heroku
  * Opposed to generating a sinatra app have the ability to generate a static site
  * Generator should go through and rename things in the initial templates / ReadMe file like the title / header etc
  * add figaro to manage environment, add application.yml to gitignore
  * optimize the api template currently just a copy of web… Should be optimized for building api endpoints along with gem clients in there client directory
  

#### Generated by Sinatra Template

This project was originally generated by [sinatra template](https://github.com/danmayer/sinatra_template)
