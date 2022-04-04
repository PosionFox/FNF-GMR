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


function saveSongChart(_file)
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
		sections = 0;
		needsVoices = true;
		bpm = global.bpm;
		speed = global.noteSpeed / 3.2;
		
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

function loadSongChart(_file)
{
	var songStruct = loadSongData(_file);
	
	global.songName = songStruct.name;
	global.song = asset_get_index(songStruct.instFile);
	global.voices = asset_get_index(songStruct.voiceFile);
	//if (global.voices != "") { global.voices = asset_get_index(global.voices); }
	
	global.noteSpeed = songStruct.noteSpeed * 3.2;
	global.bpm = songStruct.bpm;
	global.camSpeed = songStruct.camSpeed;
	global.enemy = songStruct.enemy;
	
	ds_grid_read(global.chart, songStruct.noteOutput);
	global.chartNotes = songStruct.notes;
	
	/*
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
	ini_close();*/
}

