

switch (state)
{
	case "hello":
		image_speed = 1 * global.deltaMultiplier;
		if (image_index >= image_number - 1)
		{
			state = "idle";
			var _c1 = call_later(10, time_source_units_frames, function()
			{
				instance_create_depth(x, y, depth - 1, objCelebiNote);
			});
			var _c2 = call_later(20, time_source_units_frames, function()
			{
				instance_create_depth(x, y, depth - 1, objCelebiNote);
			});
			var _c3 = call_later(30, time_source_units_frames, function()
			{
				instance_create_depth(x, y, depth - 1, objCelebiNote);
			});
		}
	break;
	case "idle":
		image_speed = 0;
		idleTimer += DT;
		if (idleTimer >= 1)
		{
			state = "bye";
		}
	break;
	case "bye":
		image_speed = -1 * global.deltaMultiplier;
		if (round(image_index) <= 0)
		{
			instance_destroy();
		}
	break;
}
