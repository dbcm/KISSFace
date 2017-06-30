using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;

module DoNotDisturb {

    var bitmap = Ui.loadResource(Rez.Drawables.dnd);

	function drawIcon(dc, x, y) {
        dc.drawBitmap(x, y, bitmap);
	}
    
    function isDND() {
        return Sys.getDeviceSettings().doNotDisturb;
    }
    
    function isSleepy() {
		var info = Act.getInfo();
      
		return info.isSleepMode;
    }
    
}