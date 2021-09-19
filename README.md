Nullreff's .config files
========================

These are the custom configuration files used to run my computer.
They're very specific to my own setup but feel free to draw inspiration or copy them to your own setup.
As much as I try to automate, not everything can be automatically setup across multiple operating systems and machines.
Therefore this readme contains all the documentation for how I configure my machines.

Installing
----------

Clone this into your `.config` folder and run `./setup` to install everything.
For a more advanced explanation read on...


Operating Systems
-----------------

Pretty much everything in this repo is built on top of Debian.
This is for a few key reasons:

1. Debian is ubiquitous across pretty much everything. I have yet to run into software, services or anything else that did not support Debian (or by extension Ubuntu). Having a configuration that can move from install to install and expect to work well for just about everything I do is important to me. There are plenty of other cool operating systems that I love for their philosophy and tech but none are as universally supported as Debian. If that changes and another distro gains more universal acceptance, I may be more inclined to swap.
2. Debian is flexible in that it offers a rock solid platform that doesn't break (stable) to a more up to date environment (testing) to a rolling release with the latest stuff (unstable). I can choose based on what my requirements are for stability and up to date software.
3. Debian has plenty of information available online. If something breaks you can bet that someone else has also had it break and probably already found a solution. This saves me time over being the first/only person to troubleshoot an issue on a newer or more obscure distro.
4. Debian is simple to understand and my setup on it is simple to understand. Rather than trying to adapt my setup to a complex package manager or making it super configurable I keep it one step above setting up the system manually. I have a set of shell scripts that repeat the steps I would take to manually configure the software and nothing more. If I need to configure the installation I change the shell script. If the script fails to run I have an exact set of steps that it ran and can quickly troubleshoot.

For my core devices, I currently use:
- Debian Unstable for my personal computers
- Debian Stable for my servers
- Calyx OS for my phones


### Debian

Install Debian from a usb stick with full disk encryption and no gui.

```
su -l
apt install sudo curl
usermod nullreff -aG sudo
su nullreff
curl https://nullreff.net/install | bash
```

For my personal linux installs I run an encrypted drive with a single partition because I like to compute dangerously.
For my desktop kernel I run [liquorix](http://liquorix.net/) and for servers just use the stock kernel.

### Calyx OS

Install with microG enabled since I still make use of some google services.
Trying to move everything over to fdroid but there's still some stuff from Aurora I use.

#### Apps

In Fdroid, opne 'Updates' and drag down to update repositories

Fdroid:
- Aurora Store
- LocationPrivacy
- MuPDF viewer
- OONI Probe
- Orbot
- Orgzly
- Scrambled Exif
- Tor Browser
- Weather
- Yubico Authenticator
- Telegram FOSS
- Signal
- Feeder
- RedReader
- NewPipe
- Fritter
- VLC
- Cone
- Calculator
- Organic Maps
- RCX
- Termux
- ProtonVPN
- Calyx VPN
- Riseup VPN
- Barcode Scanner
- Spotiflyer

Auraura Store:
- Discord (Aurara)
- ProtonMail (Aurara)
- Slack (Aurara)
- Economist (Aurara)
- OptionStrat (Aurara)
- TradingView (Aurara)
- IBKR (Aurara)
- Bitwarden (Aurara)

### Setup

#### Settings

- Apps & Notifications
    - Default apps
        - Change the default SMS app to 'Signal'
- Battery
    - Enable 'Battery percentage'
- Display
    - Enable 'Dark theme'
    - Enable 'Night Light' and set it to 'sunrise to sunset'
    - Enable 'Adaptive Brightness'
    - Configure wallpaper and lock screen images
- Sound
    - Enable 'Do Not Disturb'
    - Disable all under 'Other Sounds and Vibrations' except for 'Touch vibration'
- Location
    - Disable 'Use location'
    - Disable 'Wi-Fi and Bluetooth scanning'
    - Check and make sure only apps that should access location can
- Security
    - Change 'Screen lock' to password
    - Set up 'Fingerprint'

#### Screen

- Tiles
    - Wi-Fi
    - Mobile data
    - Bluetooth
    - VPN
    - Airplane mode
    - Flashlight
    - Location
    - Battery Saver
    - Hotspot
    - Do Not Disturb
    - Auto Rotate
    - Screen Record
    - Screen Cast
    - Night Light
- Home Screen
    - Weather widget (Single day)
    - Digital clock widget
    - Orgzly widget (Saved Search)
- App Groups
    - Messages
        - Dialer
        - Discord
        - ProtonMail
        - Signal
        - Slack
        - Telegram

    - Media
        - Economist
        - Feeder
        - Fritter
        - NewPipe
        - RedReader
        - Spotify
        - VLC

    - Assets
        - Calculator
        - Cone
        - IBKR (Aurara)
        - OptionStrat
        - TradingView

    - Tools
        - Bitwarden
        - Organic Maps
        - RCX
        - Termux
        - ProtonVPN
        - Calyx VPN
        - Riseup VPN
        - Tor Browser
    - DuckDuckGo Privacy Browser

### App Configuratio

-Weather
    - Set temperature to C



#### Windows

If I'm ever forced onto windows

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
microsoft-windows-terminal
```

In order to run emacs on windows I launch it using X forwarding as described in [hubisan/emacs-wsl](https://github.com/hubisan/emacs-wsl).
In the future when [wslg](https://github.com/microsoft/wslg) ships I'll switch to that.

### Files

I use [Rclone](https://rclone.org/) for keeping my files in sync across different devices.
For mobile I use [rcx](https://x0b.github.io/) for file access.
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

1. [Install rcx](https://f-droid.org/en/packages/io.github.x0b.rcx/)
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
* [JSONView](https://addons.mozilla.org/en-US/firefox/addon/jsonview/)
* [Privacy.com](https://addons.mozilla.org/en-US/firefox/addon/pay-by-privacy-com/)
* [SponsorBlock](https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/)
* [Tree Tabs](https://addons.mozilla.org/en-US/firefox/addon/tree-tabs/)
* [TTV ad-block](https://addons.mozilla.org/en-US/firefox/addon/ttv-adblock/)
* [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)

#### Customizations

* When it opens for the first time, select dark mode
* Hide the tabs at the top using CSS since I use Tree Tabs [https://superuser.com/a/1268734](https://superuser.com/a/1268734)
* Install the ivory-dark theme for Tree Tabs, it can be found under `files/ivory-dark.tt_theme` in this repo
* Under `Privacy & Security`, disable everything under `Logins and Passwords` and `Forms and Autofill` since Bitwarden handles it for me
* Set my home page to `https://nullreff.net/dashboard/` and change Custom New Tab Page to the same. In Custom New Tab, set `Theme` to `Dark` and check `Force links to open in the top frame (experemental)?`
* Add the rules from `files/youtube-recommended-block.txt` in this repo to uBlock origin
* Under `Search`, change default search engine to `DuckDuckGo`
* Under `Privacy & Security`, select `Enable HTTPS-Only Mode in all windows`
* In `about:config` change `reader.color_scheme` to `dark`
* Customize the toolbar to only show `Downloads`, `Fraidycat`, `Bitwarden`, `Privacy`, `Dark Reader`, `Greasemonkey`, `uBlock Origin`, `Tree Tabs`
* Open `Settings` in the Bitwarden dropdown and changes `Theme` to `dark`

If menus and drop downs aren't opening try [enabling and disabling the main display](https://bugzilla.mozilla.org/show_bug.cgi?id=1600584)
`$ swaymsg output eDP-1 disable; swaymsg output eDP-1 enable`

If Fraidycat isn't updating, try [restarting the browser completely](https://github.com/kickscondor/fraidycat/issues/92).

### Notes

I use [Org Mode](https://orgmode.org/) for writing pretty much everything down.
This is backed up and synced via [Rclone](https://rclone.org/) from all my devices.
I use [Orgzly](http://www.orgzly.com/) on my phone to connect with WebDav service provided by [rcx](https://x0b.github.io/).
My next step will probably be setting up [Calender Syncronization](https://orgmode.org/worg/org-tutorials/org-google-sync.html) so I can have one less place to look for stuff.

### Editors

For quick edits I use [vim](https://www.vim.org/) as my default text editor since it comes on everything and gets the job done.
If I'm on windows I'll typically use [VSCode](https://code.visualstudio.com/) for working on projects.
I'm currently in the process of getting better at using [Emacs](https://www.gnu.org/software/emacs/) for doing stuff in,
I run a mostly stock configuration of [Doom Emacs](https://github.com/hlissner/doom-emacs).

Any configuration files for them should be in this repo somewhere.

### Networking

If the network isn't working, run `ip link` to see what interfaces are available then run `ip link set <name> up` to enable it.
Once links are up, I use `nmtui` to configure networks and `protonvpn` as a VPN service.

