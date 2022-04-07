// this script is used to save a chart created using the editor
// to a ini file which can be loaded when needed using load_chart();
function save_chart(dif){
	// change the saved difficullty at the end of the file
	var difName = "_Easy";
	if (dif = 1) difName = "_Normal";
	if (dif = 2) difName = "_Hard";
	
	// choose the directory to save in depending on if the game is being run in the ide, or as a released build
	var directory = global.songName + "\\" + global.songName + difName + ".ini";
	if (global.useProgramDir) directory = working_directory + "\\Songs\\" + directory;
	
	// save all the songs data
	ini_open(directory);
	if (global.songName = "") {exit; ini_close();} // if there is no song name, give up on saving
	ini_write_string("Song", "Name", global.songName);
	
	ini_write_string("Song", "Song File", audio_get_name(global.song));
	if (global.voices = "") ini_write_string("Song", "Vocal File", ""); // if there are no vocals, save it as nothing
	else ini_write_string("Song", "Vocal File", audio_get_name(global.voices));
	
	ini_write_real("Song", "Notespeed", global.noteSpeed);
	ini_write_real("Song", "BPM", global.bpm);
	ini_write_real("Song", "Camspeed", global.camSpeed);
	ini_write_real("Song", "Enemy", global.enemy);
	
	ini_write_string("Song", "Notes", ds_grid_write(global.chart));
	ini_close();
}

// this script is used to load a chart created using the editor
function load_chart(songNam, dif)
{
	// change the saved difficullty at the end of the file
	var difName = "_Easy";
	if (dif = 1) difName = "_Normal";
	if (dif = 2) difName = "_Hard";
	
	// choose the directory to load in depending on if the game is being run in the ide, or as a released build
	var directory = "\\Songs\\" + songNam + "\\" + songNam + difName + ".ini";
	if (global.specialSongs) directory = "\\Custom" + directory;
	directory = working_directory + directory;
	
	// load all of the songs data
	ini_open(directory);
	if (songNam = "") {exit; ini_close();} // if the song being loaded's name is "", then give up on loading the file
	global.songName = ini_read_string("Song", "Name", global.songName);
	global.song = asset_get_index(ini_read_string("Song", "Song File", "Dadbattle_Inst"));
	global.voices = ini_read_string("Song", "Vocal File", "Dadbattle_Voices");
	if (global.voices != "") global.voices = asset_get_index(global.voices);
	
	global.noteSpeed = ini_read_real("Song", "Notespeed", global.noteSpeed);
	global.bpm = ini_read_real("Song", "BPM", global.bpm);
	global.camSpeed = ini_read_real("Song", "Camspeed", global.camSpeed);
	global.enemy = ini_read_real("Song", "Enemy", global.enemy);
	
	ds_grid_read(global.chart, ini_read_string("Song", "Notes", ds_grid_create(8, 16)));
	ini_close();
}


function saveSongChart(_file) // wip
{
	// save all the songs data
	var dataStruct = {
		song : {}
	};
	
	with (dataStruct.song)
	{
		song = global.songName;
		player1 = "bf";
		player2 = "dad";
		validScore = true;
		sections = 16;
		needsVoices = true;
		bpm = global.bpm;
		speed = global.noteSpeed / 4;
		
		notes = global.chartNotes;
	}
	
	var _string = json_stringify(dataStruct);
	
	var _buff = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buff, buffer_string, _string);
	buffer_save(_buff, _file);
	buffer_delete(_buff);
	
	/*
	ini_open(directory);
	if (global.songName = "") {exit; ini_close();} // if there is no song name, give up on saving
	ini_write_string("Song", "Name", global.songName);
	
	ini_write_string("Song", "Song File", audio_get_name(global.song));
	if (global.voices = "") ini_write_string("Song", "Vocal File", ""); // if there are no vocals, save it as nothing
	else ini_write_string("Song", "Vocal File", audio_get_name(global.voices));
	
	ini_write_real("Song", "Notespeed", global.noteSpeed);
	ini_write_real("Song", "BPM", global.bpm);
	ini_write_real("Song", "Camspeed", global.camSpeed);
	ini_write_real("Song", "Enemy", global.enemy);
	
	ini_write_string("Song", "Notes", ds_grid_write(global.chart));
	ini_close();*/
}

function loadSongChart(_name)
{
	_name = string_replace_all(_name, "_", "-");
	_name = string_replace_all(_name, " ", "-");
	var difficulty = fetchDifficultyName(global.currentDif);
	var directory = "data/" + string(_name) + "/" + string(_name) + string(difficulty) + ".json";
	var _parsedName;
	
	var songStruct = loadSongData(directory);
	if (songStruct == -1) { exit; }
	
	//global.intactSongData = songStruct;
	
	_parsedName = string_replace_all(songStruct.song, "-", "_");
	_parsedName = string_replace_all(_parsedName, " ", "_");
	show_debug_message("parsed song name: " + _parsedName);
	
	global.songName = songStruct.song;
	global.song = asset_get_index(string(_parsedName) + "_Inst");
	global.voices = asset_get_index(string(_parsedName) + "_Voices");
	//if (global.voices != "") { global.voices = asset_get_index(global.voices); }
	
	global.noteSpeed = songStruct.speed * 4;
	global.bpm = songStruct.bpm;
	global.camSpeed = songStruct.camSpeed;
	global.enemy = fetchOpponentId(songStruct.player2);
	
	ds_grid_read(global.chart, songStruct.noteOutput);
	global.chartNotes = songStruct.notes;
	
}

function fetchOpponentId(_string)
{
	var _id = 1;
	
	switch (_string)
	{
		case "bf": _id = 0; break;
		case "bf-car": _id = 103; break;
		case "bf-christmas": _id = 103; break;
		case "bf-pixel": _id = 103; break;
		case "dad": _id = 1; break;
		case "gf": _id = 0; break;
		case "mom": _id = 5; break;
		case "mom-car": _id = 5; break;
		case "monster": _id = 3; break;
		case "monster-christmas": _id = 7; break;
		case "parents-christmas": _id = 6; break;
		case "pico": _id = 4; break;
		case "senpai": _id = 8; break;
		case "senpai-angry": _id = 9; break;
		case "spirit": _id = 10; break;
		case "spooky": _id = 2; break;
		case "tankman": _id = 11; break;
		case "whitty": _id = 100; break;
		case "whittyC": _id = 101; break;
		case "oxi": _id = 102; break;
	}
	
	return _id;
}

function fetchDifficultyName(_num)
{
	var _difficulty;
	
	switch (_num)
	{
		case 0: _difficulty = "-easy"; break;
		case 1: _difficulty = ""; break;
		case 2: _difficulty = "-hard"; break;
	}
	return string(_difficulty);
}
