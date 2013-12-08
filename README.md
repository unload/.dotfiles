> We do what we want because we can.

# dotfiles

Fuck yeah! Dotfiles!

# Installation

*Note: This will install all the gems needed by [Metasploit](https://github.com/rapid7/metasploit-framework/) too.*

Caveat: if you're installing this to a non-new environment, be sure to run a backup and make sure it works.

    git clone git@github.com:unload/.dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    rake backup
    cd ~/.dotfiles-backup/[TAB TAB]

If your files are not backed up, please either manually backup or edit the script. This script is _*destructive*_.

Run `bootstrapper.sh` and it will complain about missing dependencies or favorite programs.

The quick `apt-get`:

`sudo apt-get install ruby git vim vim-doc vim-common vim-gui-common rake rubygems ruby-bundler curl`

This will get everything installed and ready for the configuration.

After the default ruby is installed, install rvm to manage different versions:

```
\curl -#L https://get.rvm.io | bash -s stable --autolibs=3 --ruby
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
```

After installing rvm, in gnome-terminal you will need to go to your profile preferences, select the *Title and Command* tab and check *Run command as a login shell*

If you're not interested in all of the ruby gems, do a `mv Gemfile Gemfile.bak` before this block:

```
source ~/.bash_profile
rvm install 1.9.3 && rvm use 1.9.3
gem install bundler
./bootstrap.sh
source ~/.bashrc
```

_Dance_
