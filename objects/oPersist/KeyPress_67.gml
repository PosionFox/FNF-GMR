/// @description 

if (room != Title) && (room != Debug) {
	if (room != CharacterSelect) {
		global.roomBefore = room;
		
		var o = instance_create_depth(x, y, -10000, oFade);
		o.roomTo = CharacterSelect;
	} else {
		var o = instance_create_depth(x, y, -10000, oFade);
		o.roomTo = global.roomBefore;
	}
}