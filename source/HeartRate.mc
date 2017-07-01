using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;

module HeartRate {

	function drawText(dc, cx, cy) {
        var heart_rate = 666;
        
        var hrIter = Act.getHeartRateHistory(null, true);
        if(hrIter != null){
            var hr = hrIter.next();
            heart_rate = (hr.heartRate != Act.INVALID_HR_SAMPLE && hr.heartRate > 0) ? hr.heartRate : 0;
        }

        //heart_rate = 198;

        if (heart_rate >= 100) {
             dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
        }
        else if (heart_rate >= 80) {
             dc.setColor(Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT);
        }
        else if (heart_rate >= 60) {
             dc.setColor(Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
        }
        else {
             dc.setColor(Utils.getColorMode(), Gfx.COLOR_TRANSPARENT);
        }

        var hStr = heart_rate.toString();

        var fH = dc.getFontHeight(Gfx.FONT_SYSTEM_MEDIUM);
        var coordY = cy;
        if (hStr.length() > 2) {
            coordY = cy - fH + 10;
        }
        for( var i = 0; i < hStr.length(); i++ ) {
            var char = hStr.substring(i, i + 1);
            dc.drawText(cx, coordY, Gfx.FONT_SYSTEM_MEDIUM, char, Gfx.TEXT_JUSTIFY_CENTER);
            coordY += fH - 5;
        }
	}
    
    function hrON() {
        return Act has :HeartRateIterator;
    }
    
}