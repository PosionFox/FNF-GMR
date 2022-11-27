
sprites = {};
sprites.idle = sprSilverIdle;
sprites.up = sprSilverUp;
sprites.left = sprSilverLeft;
sprites.down = sprSilverDown;
sprites.right = sprSilverRight;



event_inherited();

singFrameMulti = 2.5;


onLoad = function()
{
	objHUD.hpEmptyColor = c_dkgray;
}