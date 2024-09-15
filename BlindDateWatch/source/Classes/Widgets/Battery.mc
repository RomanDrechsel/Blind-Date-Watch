import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets {
    class Battery extends WidgetBase {
        function initialize(params as Dictionary) {
            WidgetBase.initialize(params);
        }

        function draw(dc as Dc) as Void {
            if (Helper.Fonts.Text == null) {
                return;
            }

            var battery = System.getSystemStats().battery;
            if (Helper.Fonts.Icons != null) {
                dc.setColor(Theme.ColorIcons, Graphics.COLOR_TRANSPARENT);
                dc.drawText(self.locX - 7, self.locY + (IsSmallDisplay ? 5 : 12), Helper.Fonts.Icons, "2", Graphics.TEXT_JUSTIFY_RIGHT);

                var width = IsSmallDisplay ? 22 : 34;
                var height = IsSmallDisplay ? 6 : 9;
                var x = self.locX - 12 - width;
                var y = self.locY + (IsSmallDisplay ? 16 : 25);

                var end = x + (width * battery) / 100;

                while (x <= end) {
                    var barwidth = IsSmallDisplay ? 4 : 5;
                    if (x + barwidth > end) {
                        barwidth = end - x;
                    }
                    dc.fillRectangle(x, y, barwidth, height);
                    x += barwidth + 2;
                }
            }

            if (Helper.Fonts.Text != null) {
                dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
                dc.drawText(self.locX, self.locY, Helper.Fonts.Text, battery.format("%1.1d") + "%", Graphics.TEXT_JUSTIFY_LEFT);
            }
        }
    }
}
