import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets 
{
    class Heartrate extends WidgetBase
    {
        function initialize(params as Dictionary) 
        {
            WidgetBase.initialize(params);
        }

        function draw(dc as Dc) as Void 
        {
            if (Fonts.Text == null)
            {
                return;
            }

            if (Fonts.Icons != null)
            {
                dc.setColor(Theme.ColorIcons, Graphics.COLOR_TRANSPARENT);
                dc.drawText(self.locX, self.locY, Fonts.Icons, "0", Graphics.TEXT_JUSTIFY_LEFT);
            }

            var rate = -1;
            var info = Toybox.Activity.getActivityInfo();
            if (info != null && info.currentHeartRate != null)
            {
                rate = info.currentHeartRate;
            }

            var heartrate = "-";
            if (rate > 0)
            {
                heartrate = rate.toString();
            }

            var xOffset = 35;
            var yOffset = -3;
            if (!IsSmallDisplay)
            {
                xOffset = 49;
                yOffset = -7;
            }

            dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
            dc.drawText(self.locX + xOffset, self.locY + yOffset, Fonts.Text, heartrate, Graphics.TEXT_JUSTIFY_LEFT);
        }
    }
}