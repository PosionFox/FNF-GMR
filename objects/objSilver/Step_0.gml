
event_inherited();

var accuracy = round(100 - ((objHUD.missCount / (objHUD.hitCount + objHUD.missCount)) * 100));
if (accuracy > 0 and accuracy < 90)
{
	objCamPointInterest.x = 1000;
	objCamPointInterest.y = 450;
	killTimer += DT;
	global.camZoom += DT / 6;
}
else
{
	objCamPointInterest.x = 1536;
	objCamPointInterest.y = 672;
	killTimer -= DT * 2;
	killTimer = max(killTimer, 0);
	global.camZoom -= DT;
	global.camZoom = max(0.8, global.camZoom);
}

if (killTimer >= 8 and global.hp > 0)
{
	global.hp = 0;
}
