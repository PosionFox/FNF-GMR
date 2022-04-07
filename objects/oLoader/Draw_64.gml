
var _w = display_get_gui_width();
var _h = display_get_gui_height();

draw_sprite_stretched(sLoading, 0, 0, 0, _w, _h);
draw_line_width_color(0, _h - 16, 0 + (progress / progressMax) * _w, _h - 16, 8, c_fuchsia, c_fuchsia);

