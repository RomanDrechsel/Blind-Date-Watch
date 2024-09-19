import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class WFView extends WatchUi.WatchFace {
    // Load your resources here
    function onLayout(dc as Dc) as Void {
        self.setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onSettingsChanged() {
        var ids = ["BG", "Date", "Rect1", "Rect2", "Rect3", "Rect4", "Clock", "Heartrate", "Steps", "Battery"];
        for (var i = 0; i < ids.size(); i++) {
            var drawable = View.findDrawableById(ids[i]);
            if (drawable != null && drawable has :Init) {
                drawable.Init();
            }
        }
    }
}
