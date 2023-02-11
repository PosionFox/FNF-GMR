
event_inherited();

texGroup = "tgGold";
ready = false;
sprite_index = sprGoldHello;
image_speed = 0;

singFrameMulti = 2.5;


sprites = {};
sprites.idle = sprGoldIdle;
sprites.up = sprGoldUp;
sprites.left = sprGoldLeft;
sprites.down = sprGoldDown;
sprites.right = sprGoldRight;

spawnCelebi = function()
{
	var offsetX = random_range(-50, 50);
	var offsetY = random_range(-50, 50);
	var side = choose(1, -1);
	instance_create_depth(x + ((300 + offsetX) * side), (y - 300) + offsetY, depth, objGoldCelebi);
}
celebi1 = time_source_create(time_source_game, 34, time_source_units_seconds, spawnCelebi);
celebi2 = time_source_create(time_source_game, 76, time_source_units_seconds, spawnCelebi);
celebi3 = time_source_create(time_source_game, 118, time_source_units_seconds, spawnCelebi);


start = function()
{
	//alarm[0] = 60 * 5;
	var _h1 = call_later(0.5, time_source_units_seconds, function()
	{
		ready = true;
	});
	var _h2 = call_later(8, time_source_units_seconds, function()
	{
		if (instance_exists(objHUD))
		{
			objHUD.hudAlphaTarget = 0.9;
			objHUD.hudAlphaSpd = 0.008;
		}
		if (instance_exists(objPersist))
		{
			objPersist.hudAlphaTarget = 0.9;
			objPersist.hudAlphaSpd = 0.008;
		}
	});
	//call_later(5, time_source_units_seconds, spawnCelebi, true);
	time_source_start(celebi1);
	time_source_start(celebi2);
	time_source_start(celebi3);
}

onLoad = function()
{
	var intros = [
		sndImDead1,
		sndImDead2,
		sndImDead3,
		sndImDead4,
		sndImDead5,
		sndImDead6,
		sndImDead7,
	]
	var i = irandom(array_length(intros) - 1);
	audio_play_sound(intros[i], 10, false);
	objReady.muted = true;
	objHUD.hpEmptyColor = c_white;
	objArrowBtnParent.offset_tap_mult = 10;
}

onPause = function()
{
	time_source_pause(celebi1);
	time_source_pause(celebi2);
	time_source_pause(celebi3);
}

onUnpause = function()
{
	time_source_resume(celebi1);
	time_source_resume(celebi2);
	time_source_resume(celebi3);
}
