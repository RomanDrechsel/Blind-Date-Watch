import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets {
    class Steps extends WidgetBase {
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

            if (self._width == null) {
                self.calcWidth(dc, steps_str);
            }
            var yOffset = IsSmallDisplay ? -3 : -7;
            var xOffset = 0;
            if (self._centerContainer) {
                xOffset = (self._width / 2) * -1;
            }

            if (Helper.Fonts.Icons != null) {
                dc.setColor(Theme.ColorIcons, Graphics.COLOR_TRANSPARENT);
                dc.drawText(self.locX + xOffset, self.locY, Helper.Fonts.Icons, "1", Graphics.TEXT_JUSTIFY_LEFT);
                xOffset += self._padding + dc.getTextWidthInPixels("1", Helper.Fonts.Icons);
            }

            dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
            dc.drawText(self.locX + xOffset, self.locY + yOffset, Helper.Fonts.Text, steps_str, Graphics.TEXT_JUSTIFY_LEFT);
        }

        function onHide() as Void {
            self._width = null;
        }

        function onSettingsChanged() as Void {
            self._width = null;
        }

        private function calcWidth(dc as Dc, steps as String) as Number {
            self._width = dc.getTextWidthInPixels(steps, Helper.Fonts.Text);
            if (Helper.Fonts.Icons != null) {
                self._width += self._padding + dc.getTextWidthInPixels("1", Helper.Fonts.Icons);
            }
        }
    }
}
