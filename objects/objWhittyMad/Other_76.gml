
if (event_data[? "event_type"] == "sequence event")
{
    switch (event_data[? "message"])
    {
        case "startBallistic":
            startBallistic();
        break;
    }
}

