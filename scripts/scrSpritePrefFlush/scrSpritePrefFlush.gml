
function prefetchPlayerSprites()
{
	if (os_type != os_operagx and instance_exists(oBoyfriend))
	{
		var _sprites = [oBoyfriend.sprIdle, oBoyfriend.sprLeft, oBoyfriend.sprDown, oBoyfriend.sprUp, oBoyfriend.sprRight];
	
		var _r = sprite_prefetch_multi(_sprites);
		if (_r == 0) { show_debug_message("preloaded player sprites"); }
	}
}

function prefetchOpponentSprites()
{
	if (os_type != os_operagx and instance_exists(oEnemy))
	{
		var _sprites = [oEnemy.sprIdle, oEnemy.sprLeft, oEnemy.sprDown, oEnemy.sprUp, oEnemy.sprRight];
	
		var _r = sprite_prefetch_multi(_sprites);
		if (_r == 0) { show_debug_message("preloaded opponent sprites"); }
	}
}

function flushPlayerSprites()
{
	if (os_type != os_operagx and instance_exists(oBoyfriend))
	{
		var _player = [oBoyfriend.sprIdle, oBoyfriend.sprLeft, oBoyfriend.sprDown, oBoyfriend.sprUp, oBoyfriend.sprRight];
		
		sprite_flush_multi(_player);
	}
}

function flushOpponentSprites()
{
	if (os_type != os_operagx and instance_exists(oEnemy))
	{
		var _opponent = [oEnemy.sprIdle, oEnemy.sprLeft, oEnemy.sprDown, oEnemy.sprUp, oEnemy.sprRight];
		
		sprite_flush_multi(_opponent);
	}
}

