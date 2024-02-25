import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class WFView extends WatchUi.WatchFace 
{
    function initialize() 
    {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void 
    {
        self.setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Update the view
    function onUpdate(dc as Dc) as Void 
    {
        View.onUpdate(dc);
    }

    function onSettingsChanged()
    {
        var ids = [ "BG", "Date", "Rect1", "Rect2", "Rect3", "Rect4", "Clock", "Heartrate", "Steps", "Battery"];
        for (var i = 0; i < ids.size(); i++)
        {
            var drawable = View.findDrawableById(ids[i]);
            if (drawable != null)
            {
                drawable.Init();
            }
        }
    }
}
