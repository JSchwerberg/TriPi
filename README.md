**TriPi Updater**

Visit https://tripi.junaos.com to download the bootable image that this updater is for. Burn, Insert, Go!

Updater script for those running TriPi 4.0 image or newer.

As of v4.0, this readme file that comes with your TriPi updater script will include information on the update it is coming with.
This can include changelog info for that specific update, new features, and/or warnings in regard to anything that may break.

#

Some of the files that are included when running the TriPi-Updater won't actually be installed during the update.

They are included as part of the souce code package in case anyone needs to manually revert them. However, I will not have them be auto-installed unless I have made modifications to them that warrant it. 

This is because installing them unnecessarily will revert some settings you may have modified (like retroarch.cfg keybinds) back to TriPi defaults.

I will edit the TriPi-Updater to make sure it warns you if a file will be edited or replaced in such a way that may require you to reconfigure something.

#

#

**Changes in this release**

-Update 11/09/2015

-Added hotfix for those using a wireless Xbox360 controller and were not able to use it in-game for any retroarch-based emulators. 

Run the TriPi updater that you should already have in your "Ports" menu. After the reboot, an option to run the hotfix will show up in the ports menu. You should only have to run this once, unless an update to TriPi is released that states you will need to run it again (very unlikely, but worth mentioning just in case).

-If you already have a TriPi-based setup (RetroPie + Kodi 15.1 installed on top of Raspbian Wheezy), or used previous versions of TriPi that were on my github, you can clone this repo and run update.sh (as sudo, of course). From then on, you will have a "TriPi-Updater" option under "Ports" in ES.

-You may run this updater anyways if you modified TriPi-related files in version 4.0 and want to attempt to restore them.

-If you modified files unrelated to TriPi, this will not fix them and you will probably need to find answers elsewhere.

Check back later for future releases.

#

#

**Release type**

Hotfix - Although the hotfix option will show up for everyone who takes this update, you have to actually RUN the hotfix for it to modify anything. If you're like me and want to have the absolute latest and greatest, you can run the TriPi updater so you can grab it. Though if you were not experiencing the above issues, or are not using a wireless controller, DO NOT run the hotfix after updating or you will most likely ruin something.

#

#

###################

Note that not all updates will warrant a version change, especially if the code is untested or lightly tested.

###################

Enjoy!
