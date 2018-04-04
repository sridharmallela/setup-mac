<a id="markdown-markdown-header-mac-os-setup" name="markdown-header-mac-os-setup"></a>
# Mac OS Setup

this repo is not for public use, any usage of this might subject to your own risk

<a id="markdown-markdown-header-table-of-contents" name="markdown-header-table-of-contents"></a>
## Table of Contents

<!-- TOC -->

- [Mac OS Setup](#markdown-header-mac-os-setup)
    - [Table of Contents](#markdown-header-table-of-contents)
    - [Setup All](#markdown-header-setup-all)
    - [Mac OS System Preferences](#markdown-header-mac-os-system-preferences)
        - [Setup Mac OS](#markdown-header-setup-mac-os)
        - [Edit keyboard type speed](#markdown-header-edit-keyboard-type-speed)
    - [Eclipse](#markdown-header-eclipse)
        - [Sync Preferences](#markdown-header-sync-preferences)
        - [Setup Preferences](#markdown-header-setup-preferences)
    - [Chrome](#markdown-header-chrome)
        - [Sync Extensions](#markdown-header-sync-extensions)
        - [Setup Extensions](#markdown-header-setup-extensions)
        - [Force Chrome to trust your certificate](#markdown-header-force-chrome-to-trust-your-certificate)
    - [References](#markdown-header-references)

<!-- /TOC -->

<a id="markdown-markdown-header-setup-all" name="markdown-header-setup-all"></a>
## Setup All

download the latest code from https://github.com/sridharmallela/mac-os-setup and copy contents onto git folder

```bash
    $ mkdir $HOME/git
    $ sh $HOME/git/mac-os-setup/setup.sh all
```

<a id="markdown-markdown-header-mac-os-system-preferences" name="markdown-header-mac-os-system-preferences"></a>
## Mac OS System Preferences

<a id="markdown-markdown-header-setup-mac-os" name="markdown-header-setup-mac-os"></a>
### Setup Mac OS

Here are some of custom settings,

* General > Sidebar icon size: Small
* General > Automatically hide and show the menu bar: On
* General > Default web browser: Google Chrome.app
* Dock > Size: smaller
* Dock > Magnification: smaller
* Dock > Automatically hide and show the Dock: On
* Display > Automatically adjust brightness: Off
* Energy Saver > Turn display off after: 2 min
* Keyboard > Delay Until Repeat: Short
* Keyboard > Use all F1, F2 etc. keys as standard keys: On
* Keyboard > Shortcuts > Input Sources > Select the previous input source: On
* Trackpad > Tap to click: On
* Sound > Show volume in menu bar: On

<a id="markdown-markdown-header-edit-keyboard-type-speed" name="markdown-header-edit-keyboard-type-speed"></a>
### Edit keyboard type speed

1. Go to `System Settings > Keyboard > Keyboard`
2. Drag the `_Key Repeat_` slider to the `right-most _Fast_`
3. Drag the `_Delay Until Repeat_` slider to the `right-most _Short_`

<a id="markdown-markdown-header-eclipse" name="markdown-header-eclipse"></a>
## Eclipse

<a id="markdown-markdown-header-sync-preferences" name="markdown-header-sync-preferences"></a>
### Sync Preferences

To export a preference file in eclipse,

1. Select `File > Export`
2. In the Export wizard select `General > Preferences` and click `Next`
3. Click `Export all` to add all of the preferences to the file
4. If you want to export only few preferences, choose them from the list
5. Click `Browse` and locate the preferences file as `$HOME/git/mac-os-setup/copyfiles/eclipse/preferences.epf`
6. Click `Finish`

<a id="markdown-markdown-header-setup-preferences" name="markdown-header-setup-preferences"></a>
### Setup Preferences

To import a preference file,

1. Select `File > Import`
2. In the Import wizard select `General > Preferences` and click `Next`
3. Click `Browse` and locate the Preferences file as `$HOME/git/mac-os-setup/copyfiles/eclipse/preferences.epf`
4. Click `Import all` to accept all of the preferences defined in the file
5. If you want to import only few preferences, choose them from the list
6. Click `Finish`

<a id="markdown-markdown-header-chrome" name="markdown-header-chrome"></a>
## Chrome

<a id="markdown-markdown-header-sync-extensions" name="markdown-header-sync-extensions"></a>
### Sync Extensions

1. Open `chrome://system/`
2. click on `expand` next to `extensions`
3. copy all extensions onto `$HOME/git/mac-os-setup/copyfiles/chrome/extensions.txt`

<a id="markdown-markdown-header-setup-extensions" name="markdown-header-setup-extensions"></a>
### Setup Extensions

1. Open the Chrome Web Store.
2. Find and select the extension from `$HOME/git/mac-os-setup/copyfiles/chrome/extensions.txt`.
3. Click Add to Chrome.
4. Some extensions will let you know if they need certain permissions or data. To approve, click Add extension.

<a id="markdown-markdown-header-force-chrome-to-trust-your-certificate" name="markdown-header-force-chrome-to-trust-your-certificate"></a>
### Force Chrome to trust your certificate

1. Open your Chrome browser and go to `https://localhost`. The URL bar you will notice that the lock is red. Double-click on it and a dialogue popup, select the `Connection` tab and click on the link `Certificate Information`. A new popup appears
2. Drag the image of the certificate (looks like an actual certificate with a yellow stamp) in your Desktop. The certificate is now on your desktop.
3. Double click on the certificate and the Keychain Access Mac App pops up. Enter your password to unlock it.
4. **IMPORTANT!** Be sure you add the certificate to the System keychain, not the login keychain! Click `Always Trust`, even though this doesn't seem to do anything.
5. After it has been added, double-click it. You may have to authenticate again.
6. Expand the `Trust` section.
7. `When using this certificate`, set to `Always Trust`
8. Close Keychain Access and restart Chrome, and your self-signed certificate should be recognized now by the browser.

<a id="markdown-markdown-header-references" name="markdown-header-references"></a>
## References

- https://devhints.io/bash
- https://help.apple.com/xcode/mac/current/#/dev8a2822e0b
- https://trac.cyberduck.io/wiki/help/en/howto/bookmarks
