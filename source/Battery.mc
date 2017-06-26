using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

module Battery {

    function drawArc(dc, cx, cy) {
        dc.setPenWidth(3);
        dc.setColor(Gfx.COLOR_GREEN,Gfx.COLOR_TRANSPARENT);

        var battery = getBattery();

        if (battery <= 50) {
            dc.setPenWidth(5);
            dc.setColor(Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT);
        }
        if (battery <= 30) {
            dc.setPenWidth(10);
            dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
        }

        var angle_battery = battery * 360 / 100;
        if (angle_battery > 0) {
            dc.drawArc(cx, cy, cy, Gfx.ARC_CLOCKWISE, 90, (360 - angle_battery.toLong() + 90) % 360);
        }
    }

    function getBattery() {
        return Sys.getSystemStats().battery;
    }

}