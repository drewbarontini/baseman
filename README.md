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
bundle install
```

Next, install Bower for JavaScript dependency management.

```shell
npm install -g bower
bower install
```

**Note**: By default, Bower Components install to the default `bower_components` directory at the root. You can change this, if you want, in the `.bowerrc` file, but make sure to update the `.gitignore` with your new directory.

Running the Application
-----------------------

You run the application by starting the Middleman server:

```shell
middleman s
```

Building the Static Files
-------------------------

To build the static files:

```shell
middleman build
```

Helpers
-------

Take a look at [Middleman Library](http://github.com/drewbarontini/middleman-library/) for some useful Middleman methods that you can include in `helpers/custom_helpers.rb`.

If you don't want the helpers in a separate file, you can just add the following block inside of `config.rb` for your helper methods:

```ruby
helpers do
  # Put your custom helpers here...
end
```

Deploying
---------

### To GitHub Pages

- Create a new file `Rakefile` at the root of your project, and paste the file from https://github.com/drewbarontini/baseman-deploy/blob/master/github.rake
- Replace the `REPO_URL` with your repositorie's URL. This assumes that you have a `gh-pages` branch that is serving up your site.
- You can now deploy by running `rake deploy` from your project's root.

### To FTP Server Using rsync

**Requirement:** You'll need to have SSH access to your server.

- Create a new file `Rakefile` at the root of your project, and paste the file from https://github.com/drewbarontini/baseman-deploy/blob/master/ftp.rake
- Replace the `SSH_LOGIN_PATH` with your own.
- You can now deploy by running `rake deploy` from your project's root.

**Note**: There is a [version for staging](https://github.com/drewbarontini/baseman-deploy/blob/master/ftp-staging.rake) as well.

### Middleman Deploy

Another option is the [middleman-deploy](https://github.com/tvaughan/middleman-deploy) extension, which provides more deployment methods for rsync, ftp, sftp or git. Be sure to check it out!

Credits
-------

Big hat tip to [Arron Mabrey](https://github.com/arronmabrey) for the
deploy scripts :)
