Testing github upload from dell
# LAGGY CLICKS WHEN EXPERIMENT RUNS
Especially on Dell. Think this has to do with the sound files... if there is a clear noise (click or vocalization), there seems to be no lag. It may be that the recording needs to be "triggered".
No longer laggy. Cleared McAffee and other apps that were sucking the life force out of this computer. Also having the wifi off is helpful but not necessary
IMPORTANTLY changed voiceTrigger in the main experiment.m script to be set to 0, which just starts recording immediately (I think) rather than waiting for an amplitude threshold to be exceeded. Captures beginning of sounds much better now. Also changed some other audio settings, all seems to be working well.

# Images
## NO LONGER INCLUDING IMAGES. Will show participants a full size print out picture instead.
Had to modify RunSession.m on line 121 to read :imdata=imread([ settings.path_images  playList{i}(k).picture]);
because did not specify settings.path

Images must be in expDir/2_images
Must be listed as pictureName.ext (e.g., beach.jpg) in column labeled "picture" in exp spreadsheet (used to be called "image" but current version looks for "picture")

PROBLEM DEC 16:
- image does not display at correct time, despite being in correct row. Not sure why yet! But not functional
- Probably will also just show real picture to participants, so this might all be a futile effort anyways. But would be nice to get it working

ONGOING TO DOS: 
- fix image problem
- adjust text placement (wait til running on computer to be used)
- decide on what to do about SITs: same sits for each person/condition?
	- randomizing SITS further would be BIG undertaking but perhaps a good miniproject