Nullreff's .config files
========================

These are the custom configuration files used to run my computer.
They're very specific to my own setup but feel free to draw inspiration or copy them to your own setup.
As much as I try to automate, not everything can be automatically setup across multiple operating systems and machines.
Therefore this readme contains all the documentation for how I configure my machines.

Installing
----------

Clone this into your `.config` folder and run `./setup` to install everything.

Software
--------

### Operating System

I currently use Debian Testing for my desktop, Android for my phone and Debian Stable for my servers.
For my hardware linux installs I try to run [an encrypted BTRFS volume](https://www.paritybit.ca/blog/debian-with-btrfs)
currently working on setting it up to work with a Yubikey.
For my desktop kernel I run [liquorix](http://liquorix.net/) and for servers just use the stock kernel.

#### Windows

Chocolaty Packages:
```
chromium
firefox
curl
git
nssm
rclone
naps2
bitwarden
bitwarden-cli
vlc
```

In order to run emacs on windows I launch it using X forwarding as described in [hubisan/emacs-wsl](https://github.com/hubisan/emacs-wsl)

### Files

I use [Rclone](https://rclone.org/) for keeping my files in sync across different devices.
For mobile I use [RCX](https://github.com/x0b/rcx) for file access.
My rclone.conf is encrypted and stored in Bitwarden to sync across multiple machines.

This includes stuff like SSH/FTP access to servers as well as cloud storage.
The advantage of this is decoupling storage from applications so that I'm not stuck to any single provider.
It also means I can encrypt all my files locally before uploading them so only I have access to them.

#### Windows

1. `choco install rclone nssm winfsp`
2. Download the Rclone config from Bitwarden and copy it to `C:\WINDOWS\system32\config\systemprofile\.config\rclone\rclone.conf`
3. `nssm install rclone_mount`
  * Path: `C:\ProgramData\chocolatey\bin\rclone.exe`
  * Arguments: `mount --vfs-cache-mode full --cache-dir D:\cache\rclone  --log-file D:\cache\rclone\remote.log --volname remote gdrive_encrypted:/ R:`
  * Log on: This account: `<enter current account credentails>`
  * Environment: `RCLONE_CONFIG_PASS=<password from bitwarden>` TODO: Store this in a more secure way

If you want to play around with it, launch the GUI with `rclone rcd --rc-web-gui` or start running `rclone` commands

#### Mobile Setup

1. [Install RCX](https://f-droid.org/en/packages/io.github.x0b.rcx/)
2. Download the Rclone config from Bitwarden and import it to the app
3. Open the remotes apps will access and serve them as webdav

### Browser

I use [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/) on desktop and Firefox Quantum on mobile.

#### Addons

* [BetterTTV](https://addons.mozilla.org/en-US/firefox/addon/betterttv/)
* [Bitwarden](https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/)
* [ClearURLs](https://addons.mozilla.org/en-US/firefox/addon/clearurls/)
* [Custom Bang Search](https://addons.mozilla.org/en-US/firefox/addon/custombangsearch/)
* [Custom New Tab Page](https://addons.mozilla.org/en-US/firefox/addon/custom-new-tab-page/)
* [Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/)
* [Fraidycat](https://addons.mozilla.org/en-US/firefox/addon/fraidycat/)
* [Greasemonky](https://addons.mozilla.org/en-US/firefox/addon/greasemonkey/)
* [HTTPS Everywhere](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/)
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
* In `about:config` change `reader.color_scheme` to `dark`

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
