image_speed = 0;

spr = sprite_index;
sprHit = asset_get_index(sprite_get_name(spr) + "Hit");
key = vk_down;
altKey = global.downKeybind;
dir = Notes.down;

botTimer = 0;

afterCreate = false;

if (global.downScroll) image_yscale = -image_yscale;

notesHitList = ds_list_create();

if (global.songData[$ "player2"] == "gold" and enemy = true)
{
	y += 1000;
}
