
if (event_data[? "event_type"] == "sequence event")
{
    switch (event_data[? "message"])
    {
        case "startLofight":
            startLofight();
        break;
    }
}


