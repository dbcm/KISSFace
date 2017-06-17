using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

module Utils {

    var myFont = null;

    function getFont() {
        if (myFont == null) {
            myFont = Ui.loadResource(Rez.Fonts.id_font_myFont);
        } else {
            //Sys.println("looks like font was already on mem");
        }
        return myFont; 
    }
    
}