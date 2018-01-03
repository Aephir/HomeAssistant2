# HomeAssistant2
My second version of homeassistant.

Home assistant configuration files and more. This home assistant is running on a Raspberry Pi 3 using a 32 GB SD card, Raspbian Stretch Lite, installed in a python3.6.4 virtual environment. I drew quite a bit of inspiration from [COOSTAN](https://github.com/CCOSTAN/Home-AssistantConfig), so look there if any of this is interesting. If I give my endorsement or negative comments to anything, they are things I like/dislike. I have no affiliation to any of them or their potential competitors, and my positive or negative comments are based exclusively on my personal preference.

**Software on the Rapberry Pi:**
* [Raspbian Stretch Lite](https://downloads.raspberrypi.org/raspbian_lite_latest) as the OS.
* [Python3.6.4](https://www.python.org/downloads/source/) Upgraded to newest (at the time of install) python3 version.
* [sSMPT](https://wiki.debian.org/sSMTP) for sending emails from the Raspberry Pi.
* [Samba](https://www.samba.org/samba/what_is_samba.html) for easy modification of config files.
* [DuckDNS](http://www.duckdns.org/) for external access to homeassistant.
* [Let's Encrypt](https://letsencrypt.org/) for certificates.
* [Mosquitto](https://mosquitto.org/2013/01/mosquitto-debian-repository/) for device tracking (mainly through Life360) and future applications.
* [Home Assistant](https://home-assistant.io/) for all my home control and automation needs.

**Useful scripts set up with crontab**
* [rsync](https://packages.debian.org/stretch/rsync) script run in crontab for keeing a partial backup on SD card. Not entire image, it's much fater, and takes up less space.
* [Life360](https://www.life360.com/) for device tracking. I've found that owntracks just doesn't cut it (too slow/irregular update of location, so can't use it to automate based on entering/exiting areas), and so far Life360 is the best device tracker I've found. I am using the script provided by [Brazen1445](https://community.home-assistant.io/t/life-360-support/1690/15). The version I use is povided in this repository.
* script to send email with new IP when IP changes.

**Hardware**
* [Raspberry Pi 3](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) running home assistant.
* [Aeotec Z-Stick Gen5](https://aeotec.com/z-wave-usb-stick) Z-wave USB controller.
* [DHT22](https://www.adafruit.com/product/385) for indoor temperature and moisture sensor.
* [Philips Hue Lights](https://www2.meethue.com/en-us), a mix of various colored and white bulbs, and a single lighstrip.
* [Belkin WeMo Insight Switches](http://www.belkin.com/us/p/P-F7C029/), two insight switches, though these are "legacy" in my setup, future smart switches will be z-wave. One connects my Rancilio Silvia Espresso machine, so it can turn on and be warmed up by the time I need it (read: get out of bed, or arrive home). The other is a master switch for the office (including the desktop PC).
* [Fibaro Wall Plug](https://www.fibaro.com/en/products/wall-plug/) z-wave power outlet switch. Master switch for the media center (TV, Stereo, PS4, etc.). I have had a very good experience with Fibaro, and plan to include more plugs and/or other Fibaro devices.
* [Raspberry Pi 3](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) running [Kodi](https://kodi.tv/) (switch a bit between raspbian + kodi and [LibreELEC](https://libreelec.tv/), connected to TV (CEC commands can be sent to this Pi via SSH to control TV). This has the [HiFiBerry DAC+ Pro](https://www.hifiberry.com/shop/boards/hifiberry-dac-pro/) for high fidelity audio output.
* [Raspberry Pi 2](https://www.raspberrypi.org/products/raspberry-pi-2-model-b/) Running [Mopidy](https://www.mopidy.com/). Mostly controlled independently of Home Assistant, though (using primarily the very nice [Iris](https://github.com/jaedb/Iris) interface by jaedb). Connected to proper effect amplifier (NAD c275bee). This has the [Allo BOSS Maser DAC](https://www.modmypi.com/raspberry-pi/audio-dacampdigi/dacs-digital-to-analogue-coverters-1044/allo-boss-raspberry-pi-master-dac/?secumt=I3RhYi1yZXZpZXc=#review-title) for high fidelity audio output.
* [SONOS Play 5](https://www.sonos.com/en/shop/play5.html) for low fidelity playback and TTS from home assistant.
* [iKettle](https://smarter.am/support-ikettle-1-0/). Yeah, even I will admit this one is a bit overkill, unless you use a kettle at least daily. Otherwise (1) the water goes stale before you use it or (2) you have to go and fill/change the water, and then you might as well press the button. Still a nice kettle, even without the connectivity, but probably wouldn't buy again.
* [Smart TV](http://www.samsung.com/dk/support/model/UE46ES8005UXXE) (though integration is not that useful at the moment, the old fashioned remote or smartphone app is used much more).

**Notable Home Assistant components**
* [Floorplan](https://github.com/pkozul/ha-floorplan), a great project by pkozul to visualize your home with interactive gadgets.
* [Custom UI](https://github.com/andrey-git/home-assistant-custom-ui) from Andrey, another great project to customize your home assistant frontend.

![Screenshot Floorplan](https://i.imgur.com/GNq7DWK.jpg)
Floorplan - Under construction

![Screenshot Custom_UI](https://i.imgur.com/06ke3B2.jpg)
Frontend using "custom UI".

**Notable automations**
* Integrate presense sensing for each family member into "anyone home" input_boolean. Used to automate various things.
* Turn on lights if anyone arrives home later than 1 hour before sunset.
* Turn on living room lights 1 hour before sunset if someone home (plan to either implement light sensors or sun angle instead in future).
* turn off lights, espresso machine, send shutdown command through SSH to two other Raspberry Pis (KODI and Mopidy) before cutting the master power to those 15 seconds later.
* Guest mode - An input_boolean toggle that disables all the general prensence-based automations (so the lights don't go out once you leave, if a guest is staying).

**Planned future software:**
* [Mariadb](https://mariadb.org/) for database, set the database on external USB stick to avoid excessive read/write on SD card. Had this on old home assistant setup on Raspbian Jessie, but having issues setting up on new setup.
* [Homebridge](https://github.com/nfarina/homebridge) I'm not routinely using iOS deveices, so this is low priority.
* [MySensors](https://github.com/mysensors/MySensors) to integrate NRF24L01 trensceivers.

**Planned future hardware (purchased, not yet successfully implemented)**
* Arduino (several, for a few different purposes).
* NRF24L01 RF transceiver (several, for a few different purposes).
* [WyzeCam](https://www.wyzecam.com/) - currently not possible (afaik) to integrate, but I contacted them, and they said they would look into it. So let's see.
* HCSR501 PIR sensors
* [Matrix Voice](https://www.indiegogo.com/projects/matrix-voice-open-source-voice-platform-for-all) backed on IndieGoGo, should arrive in early 2018. Will then set up either a [snips](https://snips.ai/) or [google assistant](https://assistant.google.com/)/[Alexa](https://www.amazon.com/Amazon-Echo-And-Alexa-Devices/b?ie=UTF8&node=9818047011).
* Soil moisture sensors. First just to notify when plants need watering, but in the long run I'm planning an automated watering system. Likely not until after moving, though.
* Additional DHT11/22 inside wine fridges to monitor temperature (shouldn't be an issue) and humidity (this might need occational adjustment).

**Planned future misc.**
* Integrate various [Tasker](http://tasker.dinglisch.net/) automations. Have tasker send info to home assistant, then have home assistant do the work.
