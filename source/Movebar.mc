using Toybox.Graphics as Gfx;
using Toybox.ActivityMonitor as Act;

module Movebar {

	function drawBar(dc, cx, cy) {
        var info = Act.getInfo();

       // var movePercent = info.moveBarLevel / Act.MOVE_BAR_LEVEL_MAX * 100;
        
        var lev = info.moveBarLevel;
        
        var msgL = "";
        var msgR = "";
        for (var i = 0; i < info.moveBarLevel; i++) {
        		msgR += " _";
        }
        for (var i = info.moveBarLevel; i < info.MOVE_BAR_LEVEL_MAX; i++) {
        		msgL += " _";
        }

/*
		msgR = " _"; 
		msgL = " _";
		lev = 5;
*/

		msgL = msgL + " ";
		msgR = msgR + " ";
		
		switch(lev) {
			case 5:
		        dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
				printPos(dc, cx, cy, " _ _ _ _ _ ", Gfx.TEXT_JUSTIFY_CENTER);
				break;
			case 4:
		        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
				printPos(dc, cx, cy, msgL, Gfx.TEXT_JUSTIFY_LEFT);
		        dc.setColor(Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT);
				printPos(dc, cx, cy, msgR, Gfx.TEXT_JUSTIFY_RIGHT);
				break;
			case 3:
		        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
				printPos(dc, cx, cy, msgL, Gfx.TEXT_JUSTIFY_LEFT);
		        dc.setColor(Gfx.COLOR_PINK, Gfx.COLOR_TRANSPARENT);
				printPos(dc, cx, cy, msgR, Gfx.TEXT_JUSTIFY_RIGHT);
				break;
			case 2:
		        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
				printPos(dc, cx, cy, msgL, Gfx.TEXT_JUSTIFY_LEFT);
		        dc.setColor(Gfx.COLOR_PURPLE, Gfx.COLOR_TRANSPARENT);
				printPos(dc, cx, cy, msgR, Gfx.TEXT_JUSTIFY_RIGHT);
				break;
			case 1:
		        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
				printPos(dc, cx, cy, msgL, Gfx.TEXT_JUSTIFY_LEFT);
		        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
				printPos(dc, cx, cy, msgR, Gfx.TEXT_JUSTIFY_RIGHT);
				break;
			case 0:
		        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
				printPos(dc, cx, cy, " _ _ _ _ _ ", Gfx.TEXT_JUSTIFY_CENTER);
				break;
		}

	}

	function printPos(dc, cx, cy, msg, pos) {
        dc.drawText(cx, cy+57, Gfx.FONT_LARGE, msg, Gfx.TEXT_JUSTIFY_VCENTER | pos);
	}
}