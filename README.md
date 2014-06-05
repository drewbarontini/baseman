Baseman
=======

This is a base [Middleman](http://middlemanapp.com/) application. This
sets all of the defaults that I'll generally set when building a new
application on Middleman. Be sure to read all of the documentation to
become familiar with Middleman before using this base setup.

Setup
-----

```shell
gem install bundler
```

Then run:

```shell
bundle install
```

Running the Application
-----------------------

You run the application by starting the Middleman server:

```shell
middleman s
```

If you're using Rbenv with binstubs:

```shell
./bin/middleman s
```

Building the Static Files
-------------------------

To build the static files:

```shell
middleman build
```

Or, if you're using Rbenv:

```shell
./bin/middleman build
```

Deploying
---------

### To GitHub Pages

Create a new file `Rakefile` at the root of your project, and paste
in the following:

```ruby
desc "Generate flat files with Middleman"
task :generate do
  puts "## Generating site with Middleman"
  system "./bin/middleman build --clean"
  cd "build" do
    system "git init"
    system "git remote add origin REPO_URL"
  end
end

desc "Push the build to the gh-pages branch on GitHub"
task :push do
  puts "## Deploying build to GitHub Pages"
  cd "build" do
    system "git add ."
    system "git add -u"
    system "git commit -m \"Site updated at #{Time.now.utc}\""
    system "git push origin master:gh-pages --force"
  end
end

desc "Generate flat files and deploy to GitHub Pages"
task :deploy => [:generate, :push] do
end
```

Replace the `REPO_URL` with your repositorie's URL. This assumes that
you have a `gh-pages` branch that is serving up your site.

You can now deploy by running `rake deploy` from your project's root.

### To FTP Server Using rsync

**Requirement:** You'll need to have SSH access to your server.

Create a new file `Rakefile` at the root of your project, and paste
in the following:

```ruby
namespace :deploy do
  task :generate do
    puts "## Generating site with Middleman"
    system "./bin/middleman build --clean"
  end

  task :production => [:generate] do
    system "rsync -avz --delete -e ssh ./build/ SSH_LOGIN_PATH"
  end

  task :staging => [:generate] do
    system "rsync -avz --delete -e ssh ./build/ SSH_LOGIN_PATH"
  end
end
```

Replace the `SSH_LOGIN_PATH` with your own.


You can now deploy to your staging server by running `rake deploy:staging`
from your project's root. Use `rake deploy:production` to deploy to your
production server.

### Middleman Deploy

Another option is the [middleman-deploy](https://github.com/tvaughan/middleman-deploy) extension, which provides more deployment methods for rsync, ftp, sftp or git. Be sure to check it out!

Credits
-------

Big hat tip to [Arron Mabrey](https://github.com/arronmabrey) for the
deploy scripts :)
