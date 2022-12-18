
event_inherited();

if (seq != undefined)
{
	layer_sequence_speedscale(seq, 1 * DTM);
	if (layer_sequence_is_finished(seq))
	{
		layer_sequence_destroy(seq);
	}
	if (keyboard_check_pressed(vk_space) and layer_sequence_exists("Cutscene", seq))
	{
		startBallistic();
		layer_sequence_destroy(seq);
	}
}
