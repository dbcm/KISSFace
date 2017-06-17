using Toybox.System as Sys;
using Toybox.ActivityMonitor as Act;

module Goals {

	function getSteps() {
        return info.steps;
	}
        
    function getStepsGoal() {
        return info.stepGoal;
    }

    function getActive() {
        var info = Act.getInfo();

        return info.activeMinutesDay.total;
    }
    
    function getActiveGoal() {
        var info = Act.getInfo();

        var r = info.activeMinutesWeekGoal / 7;
        if (r < 1) {
            r = 1;
        }
        
        //Sys.println("Act: " + r);
        return r;
    }
    
    function getCalories() {
        var info = Act.getInfo();
        
        var cals = info.calories;
        if (cals == 0) {
            cals = 1;
        }
        
        //Sys.println("Cals:" + cals);
        return cals;
    }
    
    function getCaloriesGoal() {
        var calGoal = 0;
        var history = Act.getHistory();
        
        if (null != history && history.size() > 0) {
            for( var i = 0; i < history.size(); i++ ) {
                var hist = history[i];
                //Sys.println(hist);
                calGoal += hist.calories;
            }
            
            var cG = calGoal / history.size();
            
            if (cG == 0) {
                cG = 1;
            }
            
            //Sys.println(calGoal / history.size());
            return cG;
        } 
        else {
            //Sys.println("OOOps");
            return 1;
        }
    }

}