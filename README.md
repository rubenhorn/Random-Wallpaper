# Random Wallpaper
Set a random black and white image from [Unsplash](https://unsplash.com/) (using [picsum.photos](https://picsum.photos/)) as your wallpaper that changes every day.  

## Platforms
* Windows (using Powershell)
* Android (using Automate)

## Setup
### Windows
1. Update [execution policy](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.1) if necessary by running `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` in Powershell. (This might require you to create a new script with the contents of the downloaded script, but is the  most secure option.)
2. Press Win+R, type `shell:startup` and press Enter to open the Startup folder.
3. Move the file `autostart.bat` to this folder and change the path to `random-wallpaper.ps1` in this script to the full path of the Powershell script.

### Android
Note that this flow is optimized for devices with a portrait resolution of 1440x2560 pixels.
1. Install the [Automate](https://llamalab.com/automate/) app
2. Import `random-wallpaper.flo` from inside the app and start the flow