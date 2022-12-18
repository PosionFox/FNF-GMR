
sprites = {};
sprites.idle = sprSilverIdle;
sprites.up = sprSilverUp;
sprites.left = sprSilverLeft;
sprites.down = sprSilverDown;
sprites.right = sprSilverRight;



event_inherited();

texGroup = "tgSilver";
singFrameMulti = 2.5;
killTimer = 0;


onLoad = function()
{
	objHUD.hpEmptyColor = c_dkgray;
	objBoyfriend.deathSound = sndTransitionSplatter;
	objBoyfriend.gameoverMusic = sndFeraligatrWakes;
}