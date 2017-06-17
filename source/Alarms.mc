using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;

module Alarms {

    var bitmap = Ui.loadResource(Rez.Drawables.alarms);

	function drawIcon(dc, x, y) {
        dc.drawBitmap(x, y, bitmap);
	}
    
    function areAlarms() {
        return Sys.getDeviceSettings().alarmCount > 0;
    }
    
}