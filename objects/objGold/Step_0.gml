
event_inherited();

singFrameMulti = 2.5;

var _t = audio_sound_get_track_position(global.songId);
if (global.audioSyncGroup) { _t = audio_sync_group_get_track_pos(global.musicSync); }
if (_t >= 148 and sprite_index == sprGoldIdle)
{
	ready = false;
	image_speed = -1 * global.deltaMultiplier;
	if (instance_exists(objHUD)) objHUD.hudAlphaTarget = 0;
	if (instance_exists(objPersist)) objPersist.hudAlphaTarget = 0;
	sprite_index = sprGoldHello;
	image_index = image_number - 1;
}
if (_t >= 148 and sprite_index == sprGoldHello)
{
	if (image_index <= 1)
	{
		visible = false;
	}
}
if (ready and _t >= 118)
{
	global.hpMinimum += 0.0025 * global.deltaMultiplier;
}
