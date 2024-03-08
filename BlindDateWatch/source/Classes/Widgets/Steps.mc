import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets
{
    class Steps extends WidgetBase
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
                dc.drawText(self.locX, self.locY, Fonts.Icons, "1", Graphics.TEXT_JUSTIFY_LEFT);
            }

            var info = Toybox.ActivityMonitor.getInfo();
            var steps = info.steps.toString();

            if (info.steps > 9999)
            {
                steps = (info.steps.toFloat() / 1000.0).format("%2.1f") + "K";
            }

            var xOffset = 28;
            var yOffset = -3;
            if (!IsSmallDisplay)
            {
                xOffset = 36;
                yOffset = -7;
            }

            dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
            dc.drawText(self.locX + xOffset, self.locY + yOffset, Fonts.Text, steps, Graphics.TEXT_JUSTIFY_LEFT);
        }
    }
}
