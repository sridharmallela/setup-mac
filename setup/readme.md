# Setup Instructions

> download the latest code from [Laptop Setup](https://github.com/sridharmallela/setup-mac) and copy contents onto git folder

```bash
    # run all this scripts
    $ sh $HOME/git/setup-mac/setup.sh all
```

## Mac OS System Preferences

> The following is done after setup script is run successfully

First thing to do on any OS is update the system, for that **Apple Icon > Software Update...**.
Here are some of custom settings, that needs to setup manually,

- General
  - Use dark menu bar and Dock: ON
  - Sidebar icon size: Small
  - Automatically hide and show the menu bar: OFF
  - Default web browser: Google Chrome.app
  - Recent Items: None
  - Allow Handoff between this Mac and your iCloud devices: OFF
- Desktop & Screen Saver > Desktop
  - Select `copyfiles/pictures/tirupathi-balaji.jpg` and `Fit to Screen` with black background
- Desktop & Screen Saver > Screensaver
  - select `flipqo`
  - Start after 1 minute
  - Hot Corners.. > Start Screen Saver and Put Display to Sleep
- Dock
  - Size: smaller
  - Magnification: Max
  - Automatically hide and show the Dock: ON
  - Minimize windows into application icon: ON
  - Animate opening applications: OFF
  - Prefer tabs when opening documents: Manually
- Mission Control
  - Dashboard: OFF
  - Automatically rearrange Spaces based on most recent use: OFF
- Language & Region
  - First Day of week: Monday
- Security & Privacy > Privacy
  - Enable Location Services: OFF
- Spotlight > Search Results
  - OFF --> Bookmarks & History, Conversion, Definition, Events & Reminders, Fonts, Images
  - OFF --> Mail & Messages, Movies, Music, Spotlight Suggestions
- Spotlight > Privacy
  - Prevent spotlight from searching these locations: ~/soap-projects, pcadmin, Documents, git, One Drive, Pictures, Music, Movies
- Notifications
  - Turn off all stupid notifications and badges/banners/butchers
- Displays > Color
  - Show profiles for this display only: ON
- Energy Saver > Power Adapter
  - Turn display off after: 2 min
  - Prevent computer from sleeping automatically when the display is off: ON
  - Put hard disksto sleep when possible: OFF
  - Wake for Wi-Fi Network access: OFF
  - Enable Power Nap while plugged into a power adapter: OFF
- Keyboard > Keyboard
  - Delay Until Repeat: Short
  - Key Repeat: Fast
  - Use all F1, F2 etc. keys as standard keys: ON
- Trackpad > Point & Click
  - Look up & data detectors: OFF
  - Tap to click: ON
  - Secondary Click: Click or tap with two fingers
  - Click: Light
  - Tracking speed: Medium Fast
- Printers & Scanners > Tap2Print
  - Share this printer on the network: OFF
  - Default paper size: A4
- Sound
  - Sound Effects > Show volume in menu bar: ON
- App Store
  - Download newly available updates in the background: ON
- Network > Advanced > Proxies
  - Bypass proxy settings for these Hosts & Domains: localhost, 127.0.0.1
- Bluetooth
  - Show Bluetooth in menu bar: ON
  - Add all your devices (mouse, keyboard, headset)
- Date & Time > Clock
  - Flash time separators: ON
  - Show date: ON
- Others
  - Show `battery percentage` in menu bar
  - Ensure that guest account is off, and main account profile is set

> Disable root `operation not permitted` very risky
>
> ```bash
>   csrutil disable
>   reboot
> ```

**[⬆ back to top](#setup-instructions)**

## Postman

- Open postman
- `Wrench icon (top-right) -> Settings -> General -> REQUEST`
  - turn on `Trim keys and values in request body`
  - turn off `SSL certificate verification`
  - turn on `Always open requests in new tab`
  - select `Language detection` as `JSON`
  - set `Request timeout in ms` as `30000`
- `Wrench icon (top-right) -> Settings -> General -> USER INTERFACE`
  - set `Editor Font Size (px)` as `12`
  - turn off `Two-pane view`
  - turn on `Variable autocomplete`
- `Wrench icon (top-right) -> Settings -> General -> HEADERS`
  - turn on `Send no-cache header`
  - turn off `Send Postman Token header`
  - turn on `Retain headers when clicking on links`
  - turn on `Automatically follow redirects`
  - turn off `Send anonymous usage data to Postman`
- `Wrench icon (top-right) -> Settings -> Themes`
  - choose dark theme

**[⬆ back to top](#setup-instructions)**

## Brackets

- Install all extensions from `$HOME/git/setup-mac/copyfiles/brackets/extensions.md`

## Chrome

- Open the Chrome Web Store.
- Find and select the extension from `$HOME/git/setup-mac/copyfiles/chrome/extensions.md`.
- Click Add to Chrome.
- Some extensions will let you know if they need certain permissions or data. To approve, click Add extension.

## Dash

- Setup Sync to restore from Installed from cloud drive like dropbox.

**[⬆ back to top](#setup-instructions)**

## Spotify

- once logged in successfully, got to `Settings`
  - turn off `Show Friend Activity`, `Show unavailable songs in playlist`, `Downloads`, `My Music`
  - turn on `Private Session`, `Normalize Volume`, `Crossfade Songs` (3 secs), `Block all Cookies`

## Safari

- First, choose `Safari > Preferences > General` and deselect the option `Open “safe” files after downloading`.
- Develop > Allow Remote Automation

## Visual Studio Code

- Open VS Code and `Debug > Add Configuration... > Node JS`, copy config from `$HOME/git/setup-mac/copyfiles/vscode/launch.json`

**[⬆ back to top](#setup-instructions)**

## Eclipse

- Go to `Eclipse > Preferences > General`,
- Check `Show Heap Status`
- Increase `Workbench save internal` to 10
- `Eclipse > Preferences > General > Appearance > Theme` --> Dark (http://guari.github.io/eclipse-ui-theme/)
- Use external browser
- Update `Startup and Shutdown`
- Suspend all validators

### Extensions Installed

- Check out `$HOME/git/setup-mac/copyfiles/eclipse/extensions.md`

**[⬆ back to top](#setup-instructions)**

## Automatic Sync Setup

> Note: requires `$HOME/git/setup-mac/`

### Sync Automator

- `cmd + space` for `Automator`
- choose type of document as `Application`
- search for `Run Shell Script` and add this below script

```bash
    # create logs if not exists
    [[ ! -d $HOME/log ]] && \mkdir $HOME/log
    # sleep for 5 minutes on startup for pulse to be connected in case WFH
    sleep 300 && sh $HOME/git/setup-mac/sync.sh all >>$HOME/log/syncdata.log
```

- save as `~/Applicatons/SyncData.app`
- close `Automator`

### Change Icon

- download icon file from `$HOME/git/setup-mac/copyfiles/pictures/syncdata.ico`
- Select `SyncData.app` and press `cmd + i` to open Info panel.
- Open the `$HOME/git/setup-mac/copyfiles/pictures/syncdata.ico` to use as folder's icon in `Preview`.
- Press `cmd + a` (to select it) and then `cmd + c` (to copy it).
- Back in the info panel, click on the icon in the top left corner and press `cmd + v` to paste your customized icon image.
- close info panel and preview

### Login Item

- Go to `System Preferences > Users & Groups`
- Select login user and click on `Login Items`
- Click the lock icon and enter and admin password.
- Click the `+` button to select `SyncData.app` from your Applications folder.

**[⬆ back to top](#setup-instructions)**
