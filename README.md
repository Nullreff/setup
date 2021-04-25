Nullreff's .config files
========================

These are the custom configuration files used to run my computer.
They primarally are intended to be used on [Debian](https://www.debian.org/) but should work on any OS.

Installing
----------

Clone this into your `.config` folder and run the ruby script `setup.rb`.
If you want to use xmonad, copy `bin/xmonad-autostart` and `bin/xmonad-session` to the right places (listed in the files themselves).

Software
--------

This is kind of out of date, want to update to something more like https://github.com/Axarva/dotfiles-2.0
In addition to what comes with Debian, I use the following programs:

* [htop](https://htop.dev/)
* [xmonad](http://xmonad.org/)
* [xmobar](http://projects.haskell.org/xmobar/)
* [trayer](http://www.ohloh.net/p/trayer)
* [fish](http://fishshell.com/)
* [vim](http://www.vim.org/)
* [ls++](https://github.com/trapd00r/ls--)
* [smxi](http://crunchbang.org/forums/viewtopic.php?id=22740)
* [liquorix](http://liquorix.net/)

DisplayLink
-----------

~~~bash
echo "blacklist udlfb" | sudo tee /etc/modprobe.d/blacklist-framebuffer.conf
~~~

http://displaylink.org/forum/showthread.php?t=64043

Firefox
-------


### Addons

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

### Customizations

* Hide the tabs at the top since I use Tree Tabs [https://superuser.com/a/1268734](https://superuser.com/a/1268734)
* Install the ivory-dark theme for Tree Tabs, it can be found under `files/ivory-dark.tt_theme`
* Disable everything under "Logins and Passwords" and "Forms and Autofill" since Bitwarden handles it for me
* Set my home page to `https://nullreff.net/dashboard/` and change Custom New Tab Page to the same
* Add the rules from `files/youtube-recommended-block.txt` to uBlock origin
* Change default search engine to DuckDuckGo

