iconBopVsp += 0.02;
displayHpMin = lerp(displayHpMin, global.hpMinimum, 0.02);
if (iconBop > 0) iconBop -= iconBopVsp;
if (iconBop < 0) iconBop = 0;