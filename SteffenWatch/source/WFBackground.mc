import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class WFBackground extends WatchUi.Drawable 
{
    function initialize(params) {
        Drawable.initialize(params);
    }

    function draw(dc as Dc) as Void 
    {
        dc.setAntiAlias(true);
        dc.setColor(Graphics.COLOR_TRANSPARENT, Theme.ColorBackground);
        dc.clear();
    }
}
