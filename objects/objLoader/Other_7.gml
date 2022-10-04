
if (os_type == os_operagx)
{
	if (progress >= array_length(spritesToLoad) - 1)
	{
		ready = true;
	}
	else
	{
		progress++;
		sprite_index = spritesToLoad[progress];
	}
}

