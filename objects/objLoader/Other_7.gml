
if (!ready and !quickLoad)
{
	if (progress >= progressMax)
	{
		ready = true;
	}
	else
	{
		progress++;
		currentSprite = spritesToLoad[progress];
	}
}
