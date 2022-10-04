
if (ready)
{
	instance_activate_all();
	instance_destroy();
}

if (!ready and os_type != os_operagx)
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
