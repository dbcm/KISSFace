using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.Time.Gregorian as Gre;
using Toybox.Time;
using Toybox.Lang as Lang;
using Toybox.ActivityMonitor as Act;
using Toybox.Math as Mt;

module Time {

    var text_width_digit;
    var text_height_digit;
    
	function drawText(dc, cx, cy) {
                
        text_width_digit = dc.getTextWidthInPixels("8", Utils.getFont());
        text_height_digit = dc.getFontHeight(Utils.getFont());

        var moment = Time.now();
        var date = Gre.info(moment, Time.FORMAT_LONG);
        
        var hourString = date.hour.format("%02d");
        var minuteString = date.min.format("%02d");
        
        var info = Act.getInfo();
        
        // Goals percentage
        var stepsPercent = info.steps.toFloat() / info.stepGoal * 100;
        var floorsPercent = info.floorsClimbed.toFloat() / info.floorsClimbedGoal * 100;
        var activePercent = Goals.getActive().toFloat() / Goals.getActiveGoal().toFloat() * 100;
        var caloriesPercent = Goals.getCalories().toFloat() / Goals.getCaloriesGoal().toFloat() * 100;
        
        // 1st digit
        var text = hourString.substring(0, 1);
        drawDigit(dc, 16, cy-text_height_digit/2, text, activePercent, Goals.getActiveColor());

        // 2nd digit
        text = hourString.substring(1, 2);
        drawDigit(dc, 13+text_width_digit, cy-text_height_digit/2, text, floorsPercent, Goals.getFloorsColor());

        // 3rd digit
        text = minuteString.substring(0, 1);
        drawDigit(dc, 20+text_width_digit*2+8, cy-text_height_digit/2, text, stepsPercent, Goals.getStepsColor());

        // 4th digit
        text = minuteString.substring(1, 2);
        drawDigit(dc, 20+text_width_digit*3+5, cy-text_height_digit/2, text, caloriesPercent, Goals.getCaloriesColor());
	}
        
    function getHeight(value, goal) {
        var r =  (value * goal / 100);

        if (r > goal) {
            r = goal;
        }

        return r;
    }

    function drawDigit(dc, x, y, text, value, color) {
        var limit = getHeight(value, text_height_digit);

        var font = Utils.getFont();

        text_width_digit = dc.getTextWidthInPixels("8", font);
        text_height_digit = dc.getFontHeight(font);
        
        var water_line = y+text_height_digit-limit;

		var color = Utils.getColorMode();
		dc.setColor(color, color);

        dc.fillRectangle(x, y, text_width_digit-5, text_height_digit);

        dc.setColor(color, color);
        
        var diff = text_height_digit - limit;
        if (diff > 10) {
            dc.fillPolygon(
                [
                    [x, water_line],
                    [x+5, water_line-genRandom(10)],
                    [x+10, water_line-genRandom(3)],
                    [x+15, water_line-genRandom(5)],
                    [x+20, water_line-genRandom(3)],
                    [x+25, water_line-genRandom(10)],
                    [x+30, water_line-genRandom(3)],
                    [x+35, water_line-genRandom(10)],
                    [x+40, water_line],
                    [text_width_digit-5, water_line]
                ]
            );
        }
        dc.fillRectangle(x, y+text_height_digit-limit, text_width_digit-5, limit);
        
        dc.setColor(Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK);
        dc.drawText(x, y*2+21, font, text, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_LEFT);


    }

    function genRandom(max) {
        Mt.srand(Sys.getTimer());
        var r = Mt.rand() % max;
        return r;
    }
        
}