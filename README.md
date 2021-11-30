# wpnew

This program was created to help speed up the process of retrieving and installing the wordpress files.

This program uses `wget` to retrieve the latest version of WordPress from `https://www.wordpress.org/latest`, extracts the files and moves them to the default Apache server directory for Ubuntu `/var/www/html`.

## Installation & Usage

### Installation
wpnew is a CLI utility written in Bash.

wpnew is very simple to get and install.  Although installation isn't necessary.

To install wpnew run the installer that comes with thie repository.

1. `cd /path/to/repository`
2. `sudo ./installer.sh -i`
3. `wpnew -h` to test that installation was successful.

### Usage

For now usage is limitted to a single option `-n`, and `-h` for help of course.

#### To run for a general wordpress install:
1. Make sure you have Apache installed.
2. Make sure when you isntalled apache it created /var/www/html.
3. Run `sudo wpnew -n` using `./` from the repo directory  if you did not install.

That's it! You should have a general wodpress install ready to be set up in /var/www/html!