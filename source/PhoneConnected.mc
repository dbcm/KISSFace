using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

module PhoneConnected {

	function drawIcon(dc, x, y, color){
		var size = 6;
		var width = 2 ;

		dc.setPenWidth(2);
		dc.setColor(color, Gfx.COLOR_TRANSPARENT);

        // from https://github.com/ravenfeld/Connect-IQ-WatchFace.git
        // TODO: use a bitmap (!?)
    	dc.fillPolygon([[x-size,y-size], [x-size+width,y-size-width],[x+size+width,y+size-width],[x+size,y+size]]);
		dc.fillPolygon([[x+size,y+size],[x+size-width,y+size-width],[x-width+1,y+size*2-width],[x,y+size*2]]);
		dc.fillPolygon([[x+2,y+size*2-2],[x+2-width-1,y+size*2+width-2],[x+2-width-1,y-size*2-width+2],[x+2,y-size*2+2]]);
		dc.fillPolygon([[x,y-size*2],[x-width+1,y-size*2+width],[x+size-width,y-size+width],[x+size,y-size]]);
		dc.fillPolygon([[x+size,y-size],[x+size+width,y-size+width],[x-size+width,y+size+width],[x-size,y+size]]);
	}
    
    function isConnected() {
        return Sys.getDeviceSettings().phoneConnected;
    }
    
}