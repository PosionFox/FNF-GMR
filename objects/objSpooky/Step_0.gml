
// Inherit the parent event
event_inherited();

if (global.songData[$ "player2"] == "monster")
{
	instance_create_depth(x, y, depth, objMonster);
	instance_destroy(self);
}
