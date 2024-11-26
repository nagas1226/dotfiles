#!/bin/bash

# Ensure the script runs only on macOS
if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

# Dock settings
## Remove all apps from the Dock
defaults write com.apple.dock persistent-apps -array
## Set Dock size
defaults write com.apple.dock tilesize -int 36
## Disable recently used apps
defaults write com.apple.dock show-recents -bool false
## Minimize animation effect
defaults write com.apple.dock mineffect -string "scale"
## Disable automatic rearranging of spaces
defaults write com.apple.dock mru-spaces -bool false
## Automatically hide Dock
defaults write com.apple.dock autohide -bool true


# Show Bluetooth in menu bar
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true


# Screenshot settings
## Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
## Set screenshot save location
if [[ ! -d "$HOME/Pictures/Screenshots" ]]; then
    mkdir -p "$HOME/Pictures/Screenshots"
fi
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"
## Disable screenshot thumbnail previews
defaults write com.apple.screencapture show-thumbnail -bool false
## Set screenshot format to jpg
defaults write com.apple.screencapture type -string "jpg"


# Finder settings
## Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
## Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
## Show path bar
defaults write com.apple.finder ShowPathbar -bool true
## Disable quarantine warning for unverified apps
defaults write com.apple.LaunchServices LSQuarantine -bool false
## Disable warning before emptying Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
## Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
## Show tab bar
defaults write com.apple.finder ShowTabView -bool true


# Disable creation of .DS_Store files on network and USB drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


# Battery settings
## Show battery percentage in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"


# Trackpad settings
## Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
## Set trackpad speed
defaults write -g com.apple.trackpad.scaling 3
## Disable natural scrolling
defaults write -g com.apple.swipescrolldirection -bool false


# Mouse settings
## Set mouse speed
defaults write -g com.apple.mouse.scaling 3
## Set scroll wheel speed
defaults write -g com.apple.scrollwheel.scaling 5


# Keyboard settings
## Adjust key repeat settings
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
## Enable full keyboard access
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
## Remap Caps Lock to Control
keyboard_id=$(ioreg -c AppleEmbeddedKeyboard -r | grep -Eiw "VendorID|ProductID" | awk '{ print $4 }' | paste -s -d'-' -)-0
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboard_id} -array-add '
<dict>
  <key>HIDKeyboardModifierMappingDst</key>
  <integer>30064771300</integer>
  <key>HIDKeyboardModifierMappingSrc</key>
  <integer>30064771129</integer>
</dict>'

# Disable live conversion for Japanese input
defaults write com.apple.inputmethod.Kotoeri JIMPrefLiveConversionKey -bool false

# Disable Apple Press and Hold functionality (use key repeat instead of holding keys)
defaults write -g ApplePressAndHoldEnabled -bool false


# Date and time settings
## Display date and time in menu bar
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"

# Kill affected applications to apply settings
for app in "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" &> /dev/null
done

echo "macOS settings applied. You may need to log out or restart for some changes to take effect."
