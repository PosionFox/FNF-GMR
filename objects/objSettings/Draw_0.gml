draw_set_font(global.font);
//draw_set_font(fntDefault);

var _len = array_length(currentMenu.options);
for (var i = 0; i < _len; i++)
{
	var _a = 0.5;
	var _c = c_white;
	if (i == menuIndex) { _a = 1; _c = c_yellow; }
	
	draw_text_color(10, 160 + (70 * i) - menuIndex * 70, currentMenu.options[i].name, c_white, c_white, _c, _c, _a);
	if (currentMenu.options[i].value != undefined)
	{
		draw_set_halign(fa_right);
		draw_text_color(1270, 160 + (70 * i) - menuIndex * 70, currentMenu.options[i].getValue(), c_white, c_white, _c, _c, _a);
		draw_set_halign(fa_left);
	}
}

draw_set_halign(fa_center);
draw_text_color(640, 20, currentMenu.name, c_white, c_white, c_fuchsia, c_fuchsia, 1);
draw_set_halign(fa_left);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_text_transformed(640, 720, string_lower(currentMenu.options[menuIndex].desc), 0.6, 0.6, 0);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_set_font(fntDefault);
