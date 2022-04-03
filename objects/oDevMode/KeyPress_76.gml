if (room != Title) {
	if (room != SongImport) {
		global.roomBefore = room;
		
		var o = instance_create_depth(x, y, -10000, oFade);
		o.roomTo = SongImport;
	} else {
		var o = instance_create_depth(x, y, -10000, oFade);
		o.roomTo = MainMenu;
	}
}