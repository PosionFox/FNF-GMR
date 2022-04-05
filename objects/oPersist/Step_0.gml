// used bopping code, readded
//if (global.enemy = 5) {
hudBopVsp += 0.1;
if (hudBopScale > 0) hudBopScale -= hudBopVsp;
if (hudBopScale < 0) hudBopScale = 0;

if (hudBopTimer >= 120) {
	hudBopVsp = 0;
	hudBopScale = 10;
	hudBopTimer = 0;
}
hudBopTimer += (global.bpm / 60) * global.deltaMultiplier;
//}

// calculate deltatime
actualDelta = DT;
global.deltaMultiplier = actualDelta/targetDelta;

// check if song ended
if (variable_global_exists("musicSync") and global.songIsPlaying)
{
	var curTime;
	var finalTime;
	if (global.audioSyncGroup)
	{
		curTime = audio_sync_group_get_track_pos(global.musicSync);
		finalTime = audio_sound_length(global.song);
	}
	else
	{
		curTime = audio_sound_get_track_position(global.songId);
		finalTime = audio_sound_length(global.songId);
	}
	//if (finalTime <= 0) // fix song skip early
	//{
	//	finalTime = 100;
	//}
	if (!audio_is_playing(global.songId))
	{
		timeUntilMoveOn++;
	}
	//if (curTime >= finalTime - 1.1) && (room = MainGame)
	//{
	//	timeUntilMoveOn++;
	//}
}

//if (timeUntilMoveOn >= 420) {
//	oBoyfriend.sprite_index = sBoyfriendCheer;
//	oBoyfriend.image_index = 1;
	
//	oCamera.rankingScreen = true;
//}

// when the song has ended
//if (timeUntilMoveOn >= 420) && !(global.dead) && (keyboard_check_pressed(vk_enter)) {
if (timeUntilMoveOn >= 210) && !(global.dead) {
	global.songIsPlaying = false;
	var roomTo = MainGame;
	
	if (global.audioSyncGroup)
	{
		audio_pause_sync_group(global.musicSync);
	}
	else
	{
		audio_pause_sound(global.songId);
		audio_pause_sound(global.voicesId);
	}
	
	// load the next songs chart
	loadSongChart(global.nextSong[global.songOn]);
	//load_chart(global.nextSong[global.songOn], global.currentDif);

	if (global.auto) global.curScore = 0;
	global.songScore[global.songOn] = global.curScore;
	
	// if the next song does not exist
	if (global.nextSong[global.songOn] = "n")
	{
		roomTo = StoryMenu;
		audio_play_sound(freakyMenu, 10, true);
		var totalScore = 0;
		for (var i = 0; i <= global.songOn; ++i)
		{
		    totalScore += global.songScore[i];
		}
		
		// save scores
		if !(global.freeplay) {
			if (global.currentDif = 0) global.weekScoreEasy[global.weekPlaying] = totalScore;
			if (global.currentDif = 1) global.weekScoreNormal[global.weekPlaying] = totalScore;
			if (global.currentDif = 2) global.weekScoreHard[global.weekPlaying] = totalScore;
			save_weekscore(global.weekPlaying, global.currentDif);
		} else {
			save_songscore(global.songName, global.currentDif, global.curScore);
		}
	}
	// move on to the next song
	global.songOn++;
	
	// fade out
	if (global.freeplay) roomTo = FreePlay;
	if !(roomTo = MainGame)
	{
		var o = instance_create_depth(0, 0, -10000, oFade);
		o.roomTo = roomTo;
	}
	else
	{
		if (instance_exists(oCamera))
		{
			oldCamX = oCamera.x;
			oldCamY = oCamera.y;
		} else { show_debug_message("camera does not exist!"); }
		room_goto(roomTo);	
	}
	audio_destroy_sync_group(global.musicSync);
	timeUntilMoveOn = 0;
}

// edit the volume variable
global.volume = clamp(global.volume, 0, 1);
audio_master_gain(global.volume);