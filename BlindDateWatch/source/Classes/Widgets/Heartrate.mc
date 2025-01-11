import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets {
    class Heartrate extends WidgetBase {
        private var _centerContainer = false;
        private var _width as Number? = null;
        private const _padding as Number = 5;

        function initialize(params as Dictionary) {
            WidgetBase.initialize(params);
            self._centerContainer = params.hasKey("center") ? params.get("center") : false;
        }

        function draw(dc as Dc) as Void {
            if (Helper.Fonts.Text == null) {
                return;
            }

            var info = Toybox.Activity.getActivityInfo();
            var heartrate = info != null && info.currentHeartRate != null && info.currentHeartRate > 0 ? info.currentHeartRate.toString() : "-";

            if (self._width == null) {
                self.calcWidth(dc, heartrate);
            }

            var yOffset = IsSmallDisplay ? -3 : -7;
            var xOffset = 0;
            if (self._centerContainer) {
                xOffset = (self._width / 2) * -1;
            }

            if (Helper.Fonts.Icons != null) {
                dc.setColor(Theme.ColorIcons, Graphics.COLOR_TRANSPARENT);
                dc.drawText(self.locX + xOffset, self.locY, Helper.Fonts.Icons, "0", Graphics.TEXT_JUSTIFY_LEFT);
                xOffset += self._padding + dc.getTextWidthInPixels("0", Helper.Fonts.Icons);
            }

            dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
            dc.drawText(self.locX + xOffset, self.locY + yOffset, Helper.Fonts.Text, heartrate, Graphics.TEXT_JUSTIFY_LEFT);
        }

        function onHide() as Void {
            self._width = null;
        }

        function onSettingsChanged() as Void {
            self._width = null;
        }

        private function calcWidth(dc as Dc, heartrate as String) as Number {
            self._width = dc.getTextWidthInPixels(heartrate, Helper.Fonts.Text);
            if (Helper.Fonts.Icons != null) {
                self._width += self._padding + dc.getTextWidthInPixels("0", Helper.Fonts.Icons);
            }
        }
    }
}
