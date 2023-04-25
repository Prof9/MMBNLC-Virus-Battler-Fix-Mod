MMBNLC Virus Battler fix mod
============================

This is a mod for Mega Man Battle Network Legacy Collection Vol. 2 which fixes the initial rewards for the Virus Battler in Mega Man Battle Network 6 when playing on English.

Normally, when playing on English language in MMBNLC, the Virus Battler will give the rewards from the English GBA version rather than the rewards from the Japanese version. This causes some chips to be permanently missable, notably the Django3 D chip.


Features
--------

* Virus Battle Machines now give the correct rewards from the Japanese version.

* If you already cleared a Virus Battle Machine and don't own the chip that it's supposed to reward you with, you can re-do the fights to obtain it.


Installing
----------

Windows PC and Steam Deck

1. Download and install chaudloader: https://github.com/RockmanEXEZone/chaudloader/releases Version 0.8.1 or newer is required.

2. Launch Steam in Desktop Mode. Right-click the game in Steam, then click Properties → Local Files → Browse to open the game's install folder. Then open the "exe" folder, where you'll find MMBN_LC2.exe.

3. Copy the FixVirusBattlerRewards_EXE6 folder to the "mods" folder.

4. Launch the game as normal.


Version History
---------------

Ver. 1.0.0 - 30 April 2023

* Initial version.


Building
--------

Building is supported on Windows 10 & 11. First install the following prerequisites:

* Download TextPet v1.0.0 or newer from https://github.com/Prof9/TextPet/releases and copy it into the "tools" folder.

Then, run one of the following commands:

* make - Builds the mod files compatible with chaudloader.
* make clean - Removes all temporary files and build outputs.
* make install - Installs the previously built mod files into the mods folder for chaudloader.
* make uninstall - Removes the installed mod files from the mods folder for chaudloader.
