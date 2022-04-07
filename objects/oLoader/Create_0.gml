
depth = -10000

ready = false;

spritesToLoad = [];

if (instance_exists(oBoyfriend))
{
	array_push(spritesToLoad, oBoyfriend.sprIdle);
	array_push(spritesToLoad, oBoyfriend.sprLeft);
	array_push(spritesToLoad, oBoyfriend.sprDown);
	array_push(spritesToLoad, oBoyfriend.sprUp);
	array_push(spritesToLoad, oBoyfriend.sprRight);
}
if (instance_exists(oEnemy))
{
	array_push(spritesToLoad, oEnemy.sprIdle);
	array_push(spritesToLoad, oEnemy.sprLeft);
	array_push(spritesToLoad, oEnemy.sprDown);
	array_push(spritesToLoad, oEnemy.sprUp);
	array_push(spritesToLoad, oEnemy.sprRight);
}

progress = 0;
progressMax = array_length(spritesToLoad) - 1;
progressDisplay = 0;

if (os_type == os_operagx)
{
	if (array_equals(global.previousLoadedSprites, spritesToLoad))
	{
		instance_destroy();
		exit;
	}
	
	sprite_index = spritesToLoad[progress];
	image_index = 0;
	image_speed = 1;
	
	var _len = array_length(spritesToLoad);
	array_copy(global.previousLoadedSprites, 0, spritesToLoad, 0, _len);
}

instance_deactivate_all(true);

