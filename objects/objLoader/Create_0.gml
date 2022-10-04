
depth = -10000

ready = false;

spritesToLoad = [];

var sprites = {};
if (instance_exists(objBoyfriend) and global.songData[$ "player1"] != undefined)
{
	sprites = character_get_sprites(global.songData.player1);
	array_push(spritesToLoad, sprites.idle);
	array_push(spritesToLoad, sprites.left);
	array_push(spritesToLoad, sprites.down);
	array_push(spritesToLoad, sprites.up);
	array_push(spritesToLoad, sprites.right);
}
if (instance_exists(objEnemy) and global.songData[$ "player2"] != undefined)
{
	sprites = character_get_sprites(global.songData.player2);
	array_push(spritesToLoad, sprites.idle);
	array_push(spritesToLoad, sprites.left);
	array_push(spritesToLoad, sprites.down);
	array_push(spritesToLoad, sprites.up);
	array_push(spritesToLoad, sprites.right);
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

