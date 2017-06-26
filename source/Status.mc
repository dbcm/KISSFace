using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.Time.Gregorian as Gre;
using Toybox.Time;
using Toybox.Lang as Lang;
using Toybox.ActivityMonitor as Act;

module Status {

	function drawText(dc, cx, cy, loop) {
        
        var info = Act.getInfo();
        
        // status
        var msg =  "p00p";        
        if (info.moveBarLevel == Act.MOVE_BAR_LEVEL_MAX) {
            msg = "¯\\_(o.o)_/¯";
            dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
            dc.drawText(cx, 206, Gfx.FONT_SMALL, msg, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);
        }
        else {
            var bitmap = Ui.loadResource(Rez.Drawables.steps);
            if (loop == 0) {
                 msg = info.steps - info.stepGoal;
                 dc.setColor(Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT);
                 bitmap = Ui.loadResource(Rez.Drawables.steps);
            } else if (loop == 1) {
                 msg = info.floorsClimbed - info.floorsClimbedGoal;
                 dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
                 bitmap = Ui.loadResource(Rez.Drawables.floors);
            } else if (loop == 2) {
                 msg = Goals.getActive() - Goals.getActiveGoal();
                 dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
                 bitmap = Ui.loadResource(Rez.Drawables.active);
            } else if (loop == 3) {
                msg = Goals.getCalories() - Goals.getCaloriesGoal();
                dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT);
                bitmap = Ui.loadResource(Rez.Drawables.move);
            }
            
            if (msg > 0) {
                msg = "+" + msg;
            }
            if (msg == 0) {
                msg = "±" + msg;
            }
            
            dc.drawBitmap(cx-50, 197, bitmap);        
            dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
            dc.drawText(cx-15, 206, Gfx.FONT_SMALL, msg, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);
        }
        
        
	}

}