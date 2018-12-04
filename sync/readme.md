# Sync Instructions

```bash
    # this will run one time sync
    $ sh $HOME/git/setup-macbook/sync.sh all
```

## Chrome

- Open `chrome://system/`
- click on `expand` next to `extensions`
- copy all extensions onto `$HOME/git/setup-mac/copyfiles/chrome/extensions.txt`

## XCode (**Export developer accounts**)

- In `Accounts preferences`, click and hold the Action button (the gear icon) in the lower-left corner, and choose `Export Developer Accounts` from the pop-up menu.
- Enter a filename in the `Save As` field and enter a password in both the `Password` and `Verify` fields. The file is encrypted and password protected.
- Click `Save`. The file is saved to the location `$HOME/git/setup-mac/copyfiles/iOS/xcode-sridharas.developerprofile`. The file contains all developer account signing certificates and provisioning profiles that are on your Mac.
- In the dialog that appears, click `OK`.

## Eclipse (**Sync Preferences**)

To export a preference file in eclipse,

- Select `File > Export`
- In the Export wizard select `General > Preferences` and click `Next`
- Click `Export all` to add all of the preferences to the file
- If you want to export only few preferences, choose them from the list
- Click `Browse` and locate the preferences file as `$HOME/git/setup-mac/copyfiles/eclipse/preferences.epf`
- Click `Finish`
