# Images
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