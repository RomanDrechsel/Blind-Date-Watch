import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets {
    class Steps extends WidgetBase {
        function initialize(params as Dictionary) {
            WidgetBase.initialize(params);
        }

        function draw(dc as Dc) as Void {
            if (Helper.Fonts.Text == null) {
                return;
            }

            if (Helper.Fonts.Icons != null) {
                dc.setColor(Theme.ColorIcons, Graphics.COLOR_TRANSPARENT);
                dc.drawText(self.locX, self.locY, Helper.Fonts.Icons, "1", Graphics.TEXT_JUSTIFY_LEFT);
            }

            var info = Toybox.ActivityMonitor.getInfo();
            var steps = info.steps != null ? info.steps : -1;
            var steps_str = "-";

            if (steps > 99999) {
                steps_str = Math.round(steps.toFloat() / 1000.0).toNumber() + "K";
            } else if (steps > 9999) {
                steps_str = (steps.toFloat() / 1000.0).format("%2.1f") + "K";
            } else if (steps >= 0) {
                steps_str = steps.toString();
            }

            var xOffset = IsSmallDisplay ? 28 : 36;
            var yOffset = IsSmallDisplay ? -3 : -7;

            dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
            dc.drawText(self.locX + xOffset, self.locY + yOffset, Helper.Fonts.Text, steps_str, Graphics.TEXT_JUSTIFY_LEFT);
        }
    }
}
