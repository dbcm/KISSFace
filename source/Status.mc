using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.Time.Gregorian as Gre;
using Toybox.Time;
using Toybox.Lang as Lang;
using Toybox.ActivityMonitor as Act;
using Toybox.Math as Mt;

module Status {

	function drawText(dc, cx, cy, loop) {
        
        var info = Act.getInfo();
        
        // status
        var msg =  "p00p";   
        var unit = "";
        var calc = 0;
        if (info.moveBarLevel == Act.MOVE_BAR_LEVEL_MAX) {
        //if (1) {
            msg = "¯\\_(o.o)_/¯";
            dc.setColor(Utils.getColorMode(), Gfx.COLOR_BLACK);
            dc.drawText(cx, 206, Gfx.FONT_SMALL, msg, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);
        }
        else {
            var bitmap = Ui.loadResource(Rez.Drawables.steps);
            if (loop == 2) {
                 calc = info.steps - info.stepGoal;
                 /*
                 if (calc > 999 || calc < 999) {
					unit = "km";
					calc = (calc.toFloat() / 1000).toFloat();
                 } 
                 else {
					unit = "m";
                 }
                 */
                 dc.setColor(Goals.getStepsColor(), Gfx.COLOR_TRANSPARENT);
                 bitmap = Ui.loadResource(Rez.Drawables.steps);
            } else if (loop == 1) {
                 calc = info.floorsClimbed - info.floorsClimbedGoal;
                 unit = "fl";
                 dc.setColor(Goals.getFloorsColor(), Gfx.COLOR_TRANSPARENT);
                 bitmap = Ui.loadResource(Rez.Drawables.floors);
            } else if (loop == 0) {
                 calc = Goals.getActive() - Goals.getActiveGoal();
                 unit = "min";
                 dc.setColor(Goals.getActiveColor(), Gfx.COLOR_TRANSPARENT);
                 bitmap = Ui.loadResource(Rez.Drawables.active);
            } else if (loop == 3) {
                calc = Goals.getCalories() - Goals.getCaloriesGoal();
                unit = "kCal";
                dc.setColor(Goals.getCaloriesColor(), Gfx.COLOR_TRANSPARENT);
                bitmap = Ui.loadResource(Rez.Drawables.move);
            }
            
            if (calc > 0) {
                msg = "+" + simple(calc);
            }
            else if (calc == 0) {
                msg = "±" + calc;
            }
            else {
            		msg = simple(calc);
            }
                      
			unit = false;  
            if (unit) {
            		msg += " " + unit;
            }
            
            dc.drawBitmap(cx-60, 197, bitmap);        
            dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
            dc.drawText(cx-17, 206, Gfx.FONT_SMALL, msg, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);
        }
           
	}

	function simple(msg) {
		var pos = msg.toString().find(".");
		if (pos) {
			return msg.toString().substring(0, pos + 2);
		}
		return msg;
	}

}