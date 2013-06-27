SINATRA_TEMPLATE
===

This is a Sinatra template starter project it now contains two templates web and api. The web is optimized to have a front end view, while that api is setup for a quick api only setup with no UI.

* Web template includes bootstrap, JQuery, rack flash, http basic auth, and some base CSS/JS.
* Api template includes https only, gem, and some other helpers for getting going

This is just basically a personal template and won't be trying to support a bunch of configurable use cases, but feel free to use it if you find it helpful

## To clone a project

__webapp__

    rake clone_web project=web_example
    
__api__

    rake clone_api project=api_example

## To Run Examples Locally

__webapp__

    cd web
    foreman start
    #or
    bundle exec rackup -p 3000

__api__

    cd api
    bundle exec rackup -p 3000

## TODO

  * Provide better instructions on what to rename and redo
  * Instructions for getting running with Heroku
  * Opposed to generating a Sinatra app have the ability to generate a static site with rake file to upload to S3
  * Generator should go through and rename things in the initial templates / ReadMe file like the title / header etc
  * add figaro to manage environment, add application.yml to gitignore
  * rename all pieces / files of client gem to more appropriate name

## Contributing

1. Fork it.
2. Create a branch (git checkout -b my_markup)
3. Commit your changes (git commit -am "Added something awesome, it does X which solves problem Y")
4. Push to the branch (git push origin my_markup)
5. If you haven't already read about good [Pull Request practices](http://codeinthehole.com/writing/pull-requests-and-other-good-practices-for-teams-using-github/) or have never submitted one before read about submitting [your first pull request](http://jumpstartlab.com/news/archives/2013/04/15/your-first-pull-request)
6. Open a [Pull Request](https://help.github.com/articles/using-pull-requests)
7. Awesome thanks I will try to get back to you soon.

## MIT License

See the file license.txt for copying permission.


#### Generated by Sinatra Template

This project was originally generated by [sinatra template](https://github.com/danmayer/sinatra_template)