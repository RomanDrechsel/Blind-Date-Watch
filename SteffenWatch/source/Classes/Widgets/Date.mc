import Toybox.Lang;
import Toybox.Graphics;
import Toybox.Time.Gregorian;
import Helper;

module Widgets 
{
    class Date extends WidgetBase
    {
        function initialize(params as Dictionary) 
        {
            WidgetBase.initialize(params);
        }

        function draw(dc as Dc) as Void 
        {
            if (Fonts.Date == null)
            {
                return;
            }

            var time = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
            var day = time.day.format("%02d");
            var month = time.month.format("%02d");
            var year = time.year.toString();

            var date = day + "." + month + "." + year;

            dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
            dc.drawText(self.locX, self.locY, Fonts.Date, date, Graphics.TEXT_JUSTIFY_CENTER);
        }
    }
}