# HomeAssistant2

## OBS! This is deprecated. I have moved to new hardware, in anticipation of my new house. See https://github.com/Aephir/Home_Assistant, which I will slowly update. Many of the components and automations are of course the same.

My second version of homeassistant. There is still much unfinished, and many loose ends.

Home assistant configuration files and more. This home assistant is running on a Raspberry Pi 3B+ using a 32 GB SD card, Raspbian Stretch Lite, installed in a python3.6.4 virtual environment. I drew quite a bit of inspiration from [COOSTAN](https://github.com/CCOSTAN/Home-AssistantConfig), so look there if any of this is interesting. If I give my endorsement or negative comments to anything, they are merely things I personally like/dislike. I have no affiliation to any of them or their potential competitors, and my positive or negative comments are based exclusively on my personal preference.

**Hardware**
* [Raspberry Pi 3B+](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) running home assistant and more.
* [Aeotec Z-Stick Gen5](https://aeotec.com/z-wave-usb-stick) Z-wave USB controller.
* [DHT22](https://www.adafruit.com/product/385) for indoor temperature and moisture sensor.
* [Philips Hue Lights](https://www2.meethue.com/en-us), a mix of various colored and white bulbs, and a single lighstrip running on the old bridge (v1).
* [IKEA TRÅDFRI](https://www.ikea.com/us/en/catalog/categories/departments/lighting/36812/) bulbs, connected to the hue bridge.
* [Belkin WeMo Insight Switches](http://www.belkin.com/us/p/P-F7C029/), two insight switches, though these are "legacy" in my setup, future smart switches will be z-wave. One connects my Rancilio Silvia Espresso machine, so it can turn on and be warmed up by the time I need it (read: get out of bed, or arrive home). The other is a master switch for the office (including the desktop PC).
* [Fibaro Wall Plug](https://www.fibaro.com/en/products/wall-plug/) z-wave power outlet switch. Master switch for the media center (TV, Stereo, PS4, etc.). I have had a very good experience with Fibaro, and plan to include more plugs and/or other Fibaro devices.
* [NeoCoolCam](http://www.szneo.com/en/products/index.php?id=41) to cut power to my desktop PC (it'll find a better use in a few months after we move)
* [Raspberry Pi 3B](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) running [Kodi](https://kodi.tv/) (switch a bit between raspbian + kodi and [LibreELEC](https://libreelec.tv/), connected to TV (CEC commands can be sent to this Pi via SSH to control TV). This has the [HiFiBerry DAC+ Pro](https://www.hifiberry.com/shop/boards/hifiberry-dac-pro/) for high fidelity audio output.
* [Raspberry Pi 2B](https://www.raspberrypi.org/products/raspberry-pi-2-model-b/) Running [Mopidy](https://www.mopidy.com/). It is set up via MPD, though mostly controlled independently of Home Assistant, though (using primarily the very nice [Iris](https://github.com/jaedb/Iris) interface by jaedb). Connected to proper effect amplifier (NAD c275bee). This has the [Allo BOSS Maser DAC](https://www.modmypi.com/raspberry-pi/audio-dacampdigi/dacs-digital-to-analogue-coverters-1044/allo-boss-raspberry-pi-master-dac/?secumt=I3RhYi1yZXZpZXc=#review-title) for high fidelity audio output.
* [SONOS Play 5](https://www.sonos.com/en/shop/play5.html) for low fidelity playback and TTS from home assistant.
* [iKettle](https://smarter.am/support-ikettle-1-0/). Yeah, even I will admit this one is a bit overkill, unless you use a kettle at least daily. Otherwise (1) the water goes stale before you use it or (2) you have to go and fill/change the water, and then you might as well press the button manually while you're there. Still a nice kettle, even without the connectivity, but probably wouldn't buy a connected kettle again.
* [Smart TV](http://www.samsung.com/dk/support/model/UE46ES8005UXXE) (though integration is not that useful at the moment, the old fashioned remote or smartphone app is used much more).
* [Xiaomi Gateway](https://xiaomi-mi.com/mi-smart-home/xiaomi-mi-gateway-2/)
* [Xiaomi Motion Sensor](https://xiaomi-mi.com/sockets-and-sensors/xiaomi-mi-occupancy-sensor/), that also measures illuminance. Just set up for testing for now, but will likely be used for something "real" once I move.
* [Xiaomi]()
pretty neat, I'll likely get a few more.
* [Xiaomi Temperature/Humidity/Barometric Pressure Sensor](https://xiaomi-mi.com/sockets-and-sensors/aqara-temperature-and-humidity-sensor/). This is pretty neat, I'll likely get a few more.
* [Xiaomi Door/Window Sensor](https://xiaomi-mi.com/sockets-and-sensors/xiaomi-mi-door-window-sensors/)
* [Neo CoolCam Door/Window Sensor](http://www.szneo.com/en/products/index.php?id=42) a z-wave door/window sensor.
* [Huahuacaocao Flower Care Smart Monitor](https://xiaomi-mi.com/sockets-and-sensors/xiaomi-huahuacaocao-flower-care-smart-monitor/). This seems very good! I've had it running for maybe 4 days when the battery dropped to 99%, so it looks like I'll get about a year before changing the battery.

**Software on the Rapberry Pi:**
* [Raspbian Stretch Lite](https://downloads.raspberrypi.org/raspbian_lite_latest) as the OS.
* [Python3.6.4](https://www.python.org/downloads/source/) Upgraded to newest (at the time of install) python3 version before installing Home Assistant.
* [sSMPT](https://wiki.debian.org/sSMTP) for sending emails from the Raspberry Pi.
* [Samba](https://www.samba.org/samba/what_is_samba.html) for easy modification of config files.
* [DuckDNS](http://www.duckdns.org/) for external access to Home Assistant.
* [Let's Encrypt](https://letsencrypt.org/) for certificates.
* [NGINX](https://www.nginx.com/) used to expose only Home Assistant (via SSL) to the big bad web. Everything else is run locally.
* [Mosquitto](https://mosquitto.org/2013/01/mosquitto-debian-repository/) for device tracking (mainly through Life360) and future applications.
* [MySensors](https://www.mysensors.org/), though the Arduino end isn't quite working yet.
* [Home Assistant](https://home-assistant.io/) for all my home control and automation needs.

**Useful scripts set up with crontab**
* [rsync](https://packages.debian.org/stretch/rsync) script run in crontab for keeping a partial backup on SD card. Not entire image, it's much faster, and takes up less space.
* [Life360](https://www.life360.com/) for device tracking. I've found that owntracks just doesn't cut it (too slow/irregular update of location, so can't use it to automate based on entering/exiting areas), and so far Life360 is the best device tracker I've found. I am using the script provided by [Brazen1445](https://community.home-assistant.io/t/life-360-support/1690/15). The version I use is provided in this repository.
* script to send email with new IP when IP changes. UPDATE: I now use the Google location sharing for my phone, but still use this scipt for the iPhone users in the house.

**Notable Home Assistant components**
* [Floorplan](https://github.com/pkozul/ha-floorplan), a great project by pkozul to visualize your home with interactive gadgets.
* [Custom UI](https://github.com/andrey-git/home-assistant-custom-ui) from Andrey, another great project to customize your home assistant frontend.

![Screenshot Floorplan](https://github.com/Aephir/Images/blob/master/floorplan_20180523.png)
Floorplan - Large lightbulbs control room lighting while the smaller black or yellow circles control individual bulbs. Info on the left side (and a bit spread out between), toggles/scripts/scenes on the right side. The outer doors have door sensors, if closed they are "invisible", if opened, they show a big fat red quarter-circle so you're not in doubt. Some stuff, such as phone battery level indicators and temperatures, changes color based on values.

![Screenshot Custom_UI](https://github.com/Aephir/Images/blob/master/frontend_20180503.png)
Frontend using "custom UI".

**Notable automations**
* Integrate presence sensing for each family member into "anyone home" input_boolean. Used to automate various things.
* Turn on lights if anyone arrives home later than 1 hour before sunset.
* Turn on living room lights 1 hour before sunset if someone home (plan to either implement light sensors or sun angle instead in future).
* turn off lights, espresso machine, send shutdown command through SSH to two other Raspberry Pis (KODI and Mopidy) before cutting the master power to those 15 seconds later.
* Guest mode - An input_boolean toggle that disables all the general presence-based automations (so the lights don't go out once you leave, if a guest is staying).

**Planned future software:**
* [Mariadb](https://mariadb.org/) for database, set the database on external USB stick to avoid excessive read/write on SD card. Had this on old home assistant setup on Raspbian Jessie, but having issues setting up on new setup.
* [MySensors](https://github.com/mysensors/MySensors) to integrate NRF24L01 transceivers.
* [Docker](https://www.docker.com/)... Dang, do I need to get on this. I've just had a few bad experiences with it, so... well... I'll get to it eventually.

**Planned future hardware (purchased, not yet successfully implemented)**
* Arduino (several, for a few different purposes).
* NRF24L01 RF transceiver (several, for a few different purposes).
* [WyzeCam](https://www.wyzecam.com/) - currently not possible (afaik) to integrate, but I contacted them, and they said they would look into it. So let's see.
* HCSR501 PIR sensors
* [Matrix Voice](https://www.indiegogo.com/projects/matrix-voice-open-source-voice-platform-for-all) backed on IndieGoGo, should arrive in early 2018. Will then set up either a [snips](https://snips.ai/) or [google assistant](https://assistant.google.com/)/[Alexa](https://www.amazon.com/Amazon-Echo-And-Alexa-Devices/b?ie=UTF8&node=9818047011). UPDATE. I have used it, and can successfully set up Google Assistant, but I'm having issues setting up snips (I tried in Docker, maybe I'll give it a go without Docker).
* [Xiaomi Light Switch](https://xiaomi-mi.com/sockets-and-sensors/xiaomi-aqara-smart-light-control-set/) Not yet implemented, for new home.
* [Sonoff switch with power consumption measurement](https://www.itead.cc/sonoff-pow.html) for my shed/workshop once I move.
* [Sonoff Wall Touch Switch](https://www.itead.cc/sonoff-t1.html) for the new house. I have a few different ones I want to test.

**Planned future misc.**
* Integrate various [Tasker](http://tasker.dinglisch.net/) automations. Have Tasker send info to home assistant, then have home assistant do the work.
* Move to NUC or similar, start using Docker. This is a larger project (well, at least it didn't work that well the first few times I tried), but I need to do this eventually. Then I want to use some of the Raspberry Pis for e.g. running Home Assistant on a sub-net, only controlling things in the greenhouse, and reporting back to the "master".
