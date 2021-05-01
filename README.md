Nullreff's .config files
========================

These are the custom configuration files used to run my computer.

Installing
----------

Clone this into your `.config` folder and run the ruby script `setup.rb`.
If you want to use xmonad, copy `bin/xmonad-autostart` and `bin/xmonad-session` to the right places (listed in the files themselves).

Software
--------

### Operating System

I currently use Debian Testing for my desktop, Android for my phone and Debian Stable for my servers.
For my hardware linux installs I try to run [an encrypted BTRFS volume](https://www.paritybit.ca/blog/debian-with-btrfs)
currently working on setting it up to work with a Yubikey.
For my desktop kernel I run [liquorix](http://liquorix.net/) and for servers just use the stock kernel.

### Browser

I use [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/) on desktop and Firefox Quantum on mobile.

#### Addons

* [BetterTTV](https://addons.mozilla.org/en-US/firefox/addon/betterttv/)
* [Bitwarden](https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/)
* [Custom New Tab Page](https://addons.mozilla.org/en-US/firefox/addon/custom-new-tab-page/)
* [Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/)
* [Greasemonky](https://addons.mozilla.org/en-US/firefox/addon/greasemonkey/)
* [JSONView](https://addons.mozilla.org/en-US/firefox/addon/jsonview/)
* [Privacy.com](https://addons.mozilla.org/en-US/firefox/addon/pay-by-privacy-com/)
* [ShadowFox](https://overdodactyl.github.io/ShadowFox/)
* [SponsorBlock](https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/)
* [Tree Tabs](https://addons.mozilla.org/en-US/firefox/addon/tree-tabs/)
* [TTV ad-block](https://addons.mozilla.org/en-US/firefox/addon/ttv-adblock/)
* [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)

#### Customizations

* Hide the tabs at the top using CSS since I use Tree Tabs [https://superuser.com/a/1268734](https://superuser.com/a/1268734)
* Install the ivory-dark theme for Tree Tabs, it can be found under `files/ivory-dark.tt_theme` in this repo
* Disable everything under "Logins and Passwords" and "Forms and Autofill" in firefox settings since Bitwarden handles it for me
* Set my home page to `https://nullreff.net/dashboard/` and change Custom New Tab Page to the same
* Add the rules from `files/youtube-recommended-block.txt` in this repo to uBlock origin
* Change default search engine to DuckDuckGo

### Notes

I use [Org Mode](https://orgmode.org/) for writing pretty much everything down.
This is automatically saved online by using a [Nextcloud WebDav connection](https://docs.nextcloud.com/server/20/user_manual/en/files/access_webdav.html#creating-webdav-mounts-on-the-linux-command-line).
Since it's online I use [Orgzly](http://www.orgzly.com/) on my phone to also connect with the WebDav server so I can keep everything in sync.
My next step will probably be setting up [Calender Syncronization](https://orgmode.org/worg/org-tutorials/org-google-sync.html) so I can have one less place to look for stuff.

### Editors

For quick edits I use [vim](https://www.vim.org/) as my default text editor since it comes on everything and gets the job done.
If I'm on windows I'll typically use [VSCode](https://code.visualstudio.com/) for working on projects.
I'm currently in the process of getting better at using [Emacs](https://www.gnu.org/software/emacs/) for doing stuff in,
I run a mostly stock configuration of [Doom Emacs](https://github.com/hlissner/doom-emacs).

Any configuration files for them should be in this repo somewhere.

### TODO

This is kind of out of date, want to update to something more like https://github.com/Axarva/dotfiles-2.0
In addition to what comes with Debian, I use the following programs:

* [htop](https://htop.dev/)
* [xmonad](http://xmonad.org/)
* [xmobar](http://projects.haskell.org/xmobar/)
* [trayer](http://www.ohloh.net/p/trayer)
* [fish](http://fishshell.com/)
* [vim](http://www.vim.org/)
* [ls++](https://github.com/trapd00r/ls--)
* [smxi](https://smxi.org/)

Notes
-----

Stuff I've found over the years that may or may not be relevant

### DisplayLink

~~~bash
echo "blacklist udlfb" | sudo tee /etc/modprobe.d/blacklist-framebuffer.conf
~~~

http://displaylink.org/forum/showthread.php?t=64043
