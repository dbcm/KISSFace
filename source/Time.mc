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
        var stepsPercent = info.steps.toFloat() / info.stepGoal * 100;
        //stepsPercent = 33;
        var floorsPercent = info.floorsClimbed.toFloat() / info.floorsClimbedGoal * 100;
        //floorsPercent = 26;
        var activePercent = info.activeMinutesWeek.total.toFloat() / info.activeMinutesWeekGoal * 100;
        //activePercent = 99;
        var movePercent = info.moveBarLevel / Act.MOVE_BAR_LEVEL_MAX * 100;
        //movePercent = 10;
        var caloriesPercent = Goals.getCalories() / Goals.getCaloriesGoal() * 100;
        
        var text = hourString.substring(0, 1);
        //text = 8;
        drawDigit(dc, 16, cy-text_height_digit/2, text, stepsPercent, Gfx.COLOR_ORANGE);
        //dc.drawText(42, cy, Utils.getFont(), text, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);
        
        text = hourString.substring(1, 2);
        //text = 8;
        drawDigit(dc, 13+text_width_digit, cy-text_height_digit/2, text, floorsPercent, Gfx.COLOR_BLUE);
        //dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        //dc.drawText(42+text_width_digit-5, cy, Utils.getFont(), text, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);

        text = minuteString.substring(0, 1);
        //text = 2;
        drawDigit(dc, 20+text_width_digit*2+8, cy-text_height_digit/2, text, activePercent, Gfx.COLOR_RED);
        //dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        //dc.drawText(40+text_width_digit*2+12, cy, Utils.getFont(), text, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);

        text = minuteString.substring(1, 2);
        //text = 2;
        drawDigit(dc, 20+text_width_digit*3+5, cy-text_height_digit/2, text, caloriesPercent, Gfx.COLOR_GREEN);
        //dc.setColor(Gfx.COLOR_PINK, Gfx.COLOR_TRANSPARENT);
        //dc.drawText(40+text_width_digit*3+8, cy, Utils.getFont(), text, Gfx.TEXT_JUSTIFY_VCENTER | Gfx.TEXT_JUSTIFY_CENTER);

        //drawDigit(dc, cy+10, text, floorsPercent, sx+diff, start_y+((off_a+off_b)/2), twd-diff, text_height_digit-off_b-off_a, Gfx.COLOR_BLUE);
	}
        
    function getHeight(value, goal) {
        var r =  (value * goal / 100);

        //Sys.println("value: "+value+" goal: "+goal+" result: "+r);

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

        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_WHITE);
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
        //Sys.println("RANDOM: "+r);
        return r;
    }
        
}