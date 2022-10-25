
if (!instance_exists(objPersist)) exit;

if (objPersist.timeUntilMoveOn < objPersist.timeUntilMoveOnMax)
{
	// hud surface
	var camX = camera_get_view_x(view_camera[0]);
	var camY = camera_get_view_y(view_camera[0]);

	// draw the hud
	if !(surface_exists(global.hudSurface)) global.hudSurface = surface_create(1280, 720);
	//draw_surface_stretched(global.hudSurface, camX - 640 - (hudBopScale / 2), camY - 360 - (hudBopScale / 2), global.camWidth + hudBopScale,  global.camHeight + hudBopScale);
	surface_set_target(global.hudSurface);
	draw_clear_alpha(c_white,0);
	if (instance_exists(objArrowBtnParent))
	{
		with (objArrowBtnParent)
		{
			if (instance_exists(objDialogBox)) break;
			if !(global.dead) draw_self();
			//draw_line(x, y - 192, x, y + 192);
		}
	}
	if (instance_exists(objNote))
	{
		with (objNote)
		{
			if (y > 1280) continue;
			if !(global.dead)
			{
				draw_set_alpha(0.8 + (image_alpha - 1));
				draw_sprite_stretched(midNote, image_index, x - 18, y, 50 * image_xscale, sliderLength);	
				if (sliderLength = 0) draw_set_alpha(0);
				draw_sprite_stretched(lowNote, image_index, x - 18, y + (sliderLength) - 4, 50 * image_xscale, 65 * image_xscale);
				draw_set_alpha(1);
	
				if !(heldAlready) && !(notRealNote) draw_self();
			}
			//draw_text(x, y, y);
		}
	}
	if (instance_exists(objSickParticle))
	{
		with (objSickParticle)
		{
			if !(global.dead) draw_self();
		}
	}
	surface_reset_target();
	
	var camHeightDown = ((global.camHeight / global.camZoom) * global.downScroll) * (1 + hudBop);
	var camHeightNegative = global.camHeight / global.camZoom;
	if (global.downScroll) camHeightNegative = -global.camHeight;
	draw_surface_ext(global.hudSurface, camX - (hudBop * 640), (camY + camHeightDown) - (hudBop * 360), ((global.camWidth / global.camZoom) / 1280) * (1 + hudBop), ((camHeightNegative / global.camZoom) / 720) * (1 + hudBop), 0, c_white, hudAlpha);
	
}
