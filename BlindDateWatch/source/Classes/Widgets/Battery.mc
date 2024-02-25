import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets 
{
    class Battery extends WidgetBase
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

            var battery = System.getSystemStats().battery;
            if (Fonts.Icons != null)
            {
                if (IsSmallDisplay)
                {
                    dc.setColor(Theme.ColorIcons, Graphics.COLOR_TRANSPARENT);
                    dc.drawText(self.locX -7, self.locY + 5, Fonts.Icons, "2", Graphics.TEXT_JUSTIFY_RIGHT);

                    var width = 22;
                    var height = 6;
                    var x = self.locX - 12 - width;
                    var y = self.locY + 16;

                    var end = x + (width * battery / 100);

                    while (x <= end)
                    {
                        var barwidth = 4;
                        if (x + barwidth > end)
                        {
                            barwidth = end - x;
                        }
                        dc.fillRectangle(x, y, barwidth, height);
                        x += barwidth + 2;
                    }
                }
                else
                {
                    dc.setColor(Theme.ColorIcons, Graphics.COLOR_TRANSPARENT);
                    dc.drawText(self.locX -7, self.locY + 12, Fonts.Icons, "2", Graphics.TEXT_JUSTIFY_RIGHT);

                    var width = 34;
                    var height = 9;
                    var x = self.locX - 12 - width;
                    var y = self.locY + 25;

                    var end = x + (width * battery / 100);

                    while (x <= end)
                    {
                        var barwidth = 5;
                        if (x + barwidth > end)
                        {
                            barwidth = end - x;
                        }
                        dc.fillRectangle(x, y, barwidth, height);
                        x += barwidth + 2;
                    }
                }
            }

            dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
            dc.drawText(self.locX, self.locY, Fonts.Text, battery.format("%1.1d") + "%", Graphics.TEXT_JUSTIFY_LEFT);            
        }
    }
}