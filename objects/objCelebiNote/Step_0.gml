
x = xstart + lengthdir_x(len, dir);
y = ystart + lengthdir_y(len, dir);
len += spd * global.deltaMultiplier;
dir += spd * global.deltaMultiplier;
spd = lerp(spd, 2, 0.05);
image_alpha = min(1, life);

life -= DT;
if (life <= 0)
{
	instance_destroy();
}
