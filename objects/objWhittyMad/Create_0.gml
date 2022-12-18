
sprites = {};
sprites.idle = sprWhittyCIdle;
sprites.up = sprWhittyCUp;
sprites.left = sprWhittyCLeft;
sprites.down = sprWhittyCDown;
sprites.right = sprWhittyCRight;


event_inherited();

texGroup = "tgWhittyMad";
seq = undefined;

startBallistic = function()
{
	visible = true;
	ready = true;
	layer_set_visible("Girl", true)
	objHUD.hudAlphaTarget = 1;
	objReady.start = true;
}

onLoad = function()
{
	objHUD.hudAlphaTarget = 0;
	objReady.start = false;
	ready = false;
	visible = false;
	layer_set_visible("Girl", false);
	seq = layer_sequence_create("Cutscene", x, y, seqBallisticIntro);
	layer_sequence_xscale(seq, 1.6);
	layer_sequence_yscale(seq, 1.6);
}

onPause = function()
{
	layer_sequence_pause(seq);
}
onUnpause = function()
{
	layer_sequence_play(seq);
}