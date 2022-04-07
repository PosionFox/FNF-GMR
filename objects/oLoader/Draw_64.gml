
var _w = display_get_gui_width();
var _h = display_get_gui_height();

draw_sprite_stretched(sLoading, 0, 0, 0, _w, _h);
draw_line_width_color(_w / 2, _h - 16, (_w / 2) + (progressDisplay / progressMax) * (_w / 2), _h - 16, 8, c_fuchsia, c_fuchsia);
draw_line_width_color(_w / 2, _h - 16, (_w / 2) - (progressDisplay / progressMax) * (_w / 2), _h - 16, 8, c_fuchsia, c_fuchsia);

