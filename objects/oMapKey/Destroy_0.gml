// reactivate all objects
instance_activate_all();
audio_play_sound(cancelMenu, 0, false);
with (oSettings)
{
	var _len = array_length(catKeybinds.options);
	for (var i = 0; i < _len; i++)
	{
		catKeybinds.options[i].updateKeymap();
	}
}
