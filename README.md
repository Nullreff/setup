Nullreff's .config files
========================

These are the custom configuration files used to run my computer.
They primarally are intended to be used on [CrunchBang Linux](http://crunchbang.org/) but should work on any OS.

Installing
----------

Clone this into your `.config` folder and run the ruby script `setup.rb`.
If you want to use xmonad, copy `bin/xmonad-autostart` and `bin/xmonad-session` to the right places (listed in the files themselves).

Software
--------

In addition to what comes with CrunchBang, I use the following programs:

* [xmonad](http://xmonad.org/)
* [xmobar](http://projects.haskell.org/xmobar/)
* [trayer](http://www.ohloh.net/p/trayer)
* [fish](http://fishshell.com/)
* [vim](http://www.vim.org/)
* [ls++](https://github.com/trapd00r/ls--)
* [smxi](http://crunchbang.org/forums/viewtopic.php?id=22740)
* [liquorix](http://liquorix.net/)
* [systemd](https://wiki.debian.org/systemd)

DisplayLink
-----------

~~~bash
echo "blacklist udlfb" | sudo tee /etc/modprobe.d/blacklist-framebuffer.conf
~~~

http://displaylink.org/forum/showthread.php?t=64043

