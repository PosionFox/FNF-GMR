curSelected = 0;
optionAmount = 6;

fullscreenOption = false;
smoothingOption = false;
discord = false;
if (instance_exists(oDiscord)) discord = true;

currentInput = 0;
if (global.kadeInput) currentInput = 1;
currentInputString[0] = "default";
currentInputString[1] = "kade";