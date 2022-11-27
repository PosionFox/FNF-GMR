
if (event_data[? "event_type"] == "sequence event")
{
    switch (event_data[? "message"])
    {
        case "startLofight":
            visible = true;
			ready = true;
			layer_set_visible("Girl", true)
			objHUD.hudAlphaTarget = 1;
			objReady.start = true;
        break;
    }
}


