This module does the following:
- ~~Fixes touchscreen bug, where the touchscreen disables after the
  screen is locked. This is done using a service script which watches
  for power button events. Fix originally conceived by febeslmeisl
  [here](https://github.com/phhusson/treble_experimentations/issues/2205#issuecomment-1079981168). This
  doesn't work around the screne turning off by e.g. the proximity
  sensor, but makes the phone usable enough.~~
- ~~Fixes SMS receiving by replacing pre-existing RIL libraries with
  ones from earlier releases of the ROM as per [this XDA
  thread](https://xdaforums.com/t/solved-gsi-related-can-not-receive-sms.4636173/). The
  libraries are taken from firmware downloaded from
  [SamFw](samfw.com).~~
- Adds
  [this](https://xdaforums.com/t/overlay-enable-night-light-auto-brightness-ambient-display-more-on-treble-rom.3741965/)
  overlay to /system/vendor/overlay (I have not analyzed the .apk in
  the link), which enables ambient light sensing, the Night Light
  feature, and ambient display. Perhaps this can be replaced by an
  overlay adapted for the XCover 5.

With these fixes the XCover 5 should be perfectly usable on custom
GSIs (tested by me on the Google AOSP Android 14 GSI).
