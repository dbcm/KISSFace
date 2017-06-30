using Toybox.System as Sys;
using Toybox.ActivityMonitor as Act;
using Toybox.Graphics as Gfx;

module Goals {

/*
  intensity minutes - orange
  floors climbed - green
  steps - blue
  calories burned - red
*/


	// STEPS
	function getSteps() {
        return info.steps;
	}
        
    function getStepsGoal() {
        return info.stepGoal;
    }

	function getStepsColor() {
        return Gfx.COLOR_BLUE;
	}


	// INTENSITY MINUTES
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

    function getActiveColor() {
        return Gfx.COLOR_ORANGE;
	}

    
    // CALORIES BURNED
    function getCalories() {
        var info = Act.getInfo();
        
        var cals = info.calories;
        if (cals == 0) {
            cals = 1;
        }
        
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
            
            return cG;
        } 
        else {
            return 1;
        }
    }
    
	function getCaloriesColor() {
        return Gfx.COLOR_RED;
	}
    

	// FLOORS CLIMBEd
	function getFloors() {
		return info.floorsClimbed;
	}
	
	function getFloorsGoal() {
		return info.floorsClimbedGoal;
	}
	
	function getFloorsColor() {
         return Gfx.COLOR_GREEN;
	}	       

}