# Samsung XCover 5 GSI Fixes

This module does the following:
- Works around touchscreen bug, where the touchscreen disables after
  the screen is locked. This is done using a service script which
  watches for power button events. Workaround originally conceived by
  febeslmeisl
  [here](https://github.com/phhusson/treble_experimentations/issues/2205#issuecomment-1079981168). This
  doesn't work around the screen turning off by e.g. the proximity
  sensor, but makes the phone usable enough.
- Adds
  [this](https://xdaforums.com/t/overlay-enable-night-light-auto-brightness-ambient-display-more-on-treble-rom.3741965/)
  overlay to /system/vendor/overlay (I have not analyzed the .apk in
  the link), which enables ambient light sensing, the Night Light
  feature, and ambient display. Perhaps this can be replaced by an
  overlay adapted for the XCover 5.

With these fixes the XCover 5 should be perfectly usable on custom
GSIs (tested by me on the Google AOSP Android 14 GSI).

TODO: Fix SMS receiving

## Usage
1. Clone this repo and create a ZIP file which houses its contents,
   without any parent directory.
2. Install the ZIP via Magisk.

## SMS notes
| RIL libraries                          | Result                                                               |
|----------------------------------------|----------------------------------------------------------------------|
| Stock binary 5                         | Untested                                                             |
| Stock binary 6                         | SIM card undetected, emergency calls only                            |
| Stock binary 7                         | SIM card undetected, emergency calls only                            |
| Samsung A54 latest                     | SIM card undetected, emergency calls only                            |
|----------------------------------------|----------------------------------------------------------------------|
| Partitions                             | Result                                                               |
|----------------------------------------|----------------------------------------------------------------------|
| Stock binary 7 vendor.img              | Bootloop                                                             |
| Stock binary 7 vendor.img and boot.img | Cannot flash                                                         |
|----------------------------------------|----------------------------------------------------------------------|
| Other                                  | Result                                                               |
|----------------------------------------|----------------------------------------------------------------------|
| FLOSS IMS                              | Tried on PHH GSI and on Google's AOSP, not functional, same as stock |
