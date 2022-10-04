
if (sprite_index = sprTankmanUgh) sprite_index = sprites.idle;
if (sprite_index = sprTankmanHey) sprite_index = sprites.idle;

if (global.songData[$ "player2"] == "gold") and sprite_index == sprGoldHello
{
	sprite_index = sprites.idle;
}
