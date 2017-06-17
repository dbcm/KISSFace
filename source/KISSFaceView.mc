using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class KISSFaceView extends Ui.WatchFace {

    hidden var cx;
    hidden var cy;
    hidden var loop = 1;
    hidden var active;

    function initialize() {
        WatchFace.initialize();
    }

    function onExitSleep() {
        active = true;
        Ui.requestUpdate();
    }

    function onEnterSleep() {
        active = false;
        Ui.requestUpdate();
    }

    // Load your resources here
    function onLayout(dc) {

        // G spot
        cx = dc.getWidth() / 2;
        cy = dc.getHeight() / 2;

        // reset screen
        //dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        //dc.clear();

    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {

        // cycle loop, for status
        loop++;
        loop = loop % 4;

        // reset screen
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();

        // show time
        Time.drawText(dc, cx, cy);

        // is the Phone connected
        if (PhoneConnected.isConnected()) {
            PhoneConnected.drawIcon(dc, cx-2, 75, Gfx.COLOR_BLUE);
        }

        // are alarms ON
        if (Alarms.areAlarms()) {
            Alarms.drawIcon(dc, cx + 50, 25);
        }

        // is DND ON
        if (DoNotDisturb.isDND()) {
            DoNotDisturb.drawIcon(dc, cx-65, 25);
        }

        // draw battery
        Battery.drawArc(dc, cx, cy);

        // write heart rate
        if (HeartRate.hrON()) {
             HeartRate.drawText(dc, cx, cy);
        }

        // show date
        Date.drawText(dc, cx, 35);

        // show status
        Status.drawText(dc, cx, cy, loop);

    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
