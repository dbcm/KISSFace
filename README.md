# KISSFace
Garmin Connect IQ Watch Face, you can install through [Garmin app store](https://apps.garmin.com/en-US/apps/8f2dc82b-072e-4175-98e7-fb642aa87d4c)

This is my first tryout with Monkey C and Connect IQ Watch Face, WIP.

![KISSFace example][shot1] ![KISSFace example][shot2]

![KISSFace active][shot3] ![KISSFace sleep][shot4] ![KISSFace DND][shot5]


# Features
## time digits
- 1st digit : ORANGE : Intensity minutes goal
- 2nd digit : GREEN : floors climbed goal
- 3rd digit : BLUE : Steps goal
- 4th digit : RED : Calories burned goal

## others
- heart rate between 2nd and 3rd digits
    - WHITE (< 60) 
    - YELLOW (>60) 
    - ORANGE (>80) 
    - RED (>100)
- status bar with how far you are to goals (show one per minute) 
    - **¯\\_(o.o)_/¯** if you have reached the move bar limit
- phone connection icon (blue bluetooth)
- do not disturb icon
- alarm set icon
- batery %
    - \> 50% : GREEN
    - < 50% : ORANGE
    - < 30% : thick RED
- visual movebar (under the clock)
- white text goes dark if device is in **Sleep** mode or **Do Not Disturb** state

# Resources / Source of inspiration:

- [Connect IQ SDK](https://developer.garmin.com/downloads/connect-iq/monkey-c/doc/)
- [Custom Fonts tricks](https://developer.garmin.com/index.php/blog/post/connect-iq-pro-tip-custom-fonts-tricks)
- [Connect IQ Forums](https://forums.garmin.com/forumdisplay.php?479-Connect-IQ)
- [Connect-IQ-WatchFace](https://github.com/ravenfeld/Connect-IQ-WatchFace) by [ravenfeld](https://github.com/ravenfeld/) on [github](https://github.com)
- [WatchFace NoFrills](https://apps.garmin.com/en-US/apps/03030574-3c6e-484a-9bd8-ce2ca0249651)
- [WatchFace Liquids](https://apps.garmin.com/en-US/apps/afc87394-f854-4ee4-838a-598d81414fde)


# soon™


[shot1]: shots/shot1.png
[shot2]: shots/shot2.png
[shot3]: shots/shot3.png
[shot4]: shots/shot4.png
[shot5]: shots/shot5.png
