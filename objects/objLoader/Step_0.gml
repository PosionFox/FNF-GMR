
if (ready)
{
	instance_activate_all();
	if (instance_exists(objEnemy))
	{
		//objEnemy.readyUp();
		objEnemy.onLoad();
	}
	
	instance_destroy();
}

sprite_index = currentSprite;

if (!ready and quickLoad)
{
	var _results = 0;
	for (var i = 0; i < array_length(spritesToLoad); i++)
	{
		_results += sprite_prefetch(spritesToLoad[i]);
		show_debug_message("pref result: " + string(_results));
		progress++;
	}
	if (_results == 0)
	{
		ready = true;
	}
}

progressDisplay = lerp(progressDisplay, progress, 0.1);
