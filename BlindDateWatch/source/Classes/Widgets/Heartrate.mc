import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets {
    class Heartrate extends WidgetBase {
        function initialize(params as Dictionary) {
            WidgetBase.initialize(params);
        }

        function draw(dc as Dc) as Void {
            if (Helper.Fonts.Text == null) {
                return;
            }

            if (Helper.Fonts.Icons != null) {
                dc.setColor(Theme.ColorIcons, Graphics.COLOR_TRANSPARENT);
                dc.drawText(self.locX, self.locY, Helper.Fonts.Icons, "0", Graphics.TEXT_JUSTIFY_LEFT);
            }

            var info = Toybox.Activity.getActivityInfo();
            var heartrate = info != null && info.currentHeartRate != null && info.currentHeartRate > 0 ? info.currentHeartRate.toString() : "-";
            var xOffset = IsSmallDisplay ? 35 : 49;
            var yOffset = IsSmallDisplay ? -3 : -7;

            dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
            dc.drawText(self.locX + xOffset, self.locY + yOffset, Helper.Fonts.Text, heartrate, Graphics.TEXT_JUSTIFY_LEFT);
        }
    }
}
