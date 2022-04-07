/// @description Load song
var songName = get_string("(Loading) Song Name:", global.songName);
dif = get_integer("Difficulty (0 - easy, 1 - normal, 2 - hard):", dif);

if (songName != "") { global.songName = songName; } else { exit; }

//load_chart(global.songName, dif, true);
global.currentDif = dif;
loadSongChart(string(global.songName));

