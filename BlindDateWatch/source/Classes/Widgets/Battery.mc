import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets {
    class Battery extends WidgetBase {
        private var _BatteryDaysText as String? = null;
        private var _BatteryDisplay = 1;

        function initialize(params as Dictionary) {
            WidgetBase.initialize(params);

            var settings = Helper.Properties.Get("Bat", -1) as Number;
            var max_settings = IsSmallDisplay ? 1 : 3;
            if (settings < 0 || settings > max_settings) {
                self._BatteryDisplay = 1;
            } else {
                self._BatteryDisplay = settings;
            }

            if (self._BatteryDisplay >= 2 && Rez.Strings has :ShortBatteryDays) {
                self._BatteryDaysText = Application.loadResource(Rez.Strings.ShortBatteryDays) as String;
            } else {
                self._BatteryDaysText = null;
            }
        }

        function draw(dc as Dc) as Void {
            var totalwidth = 0;
            var txt = null;
            var stats = System.getSystemStats();
            var iconWidth = 0;
            var padding = IsSmallDisplay ? 10 : 15;

            if (Helper.Fonts.Text != null && self._BatteryDisplay > 0) {
                if (self._BatteryDisplay == 1 || IsSmallDisplay) {
                    txt = stats.battery.toNumber() + "%";
                } else {
                    if (self._BatteryDaysText != null && stats has :batteryInDays) {
                        txt = stats.batteryInDays.toNumber() + self._BatteryDaysText;
                    }
                    if (self._BatteryDisplay == 3) {
                        if (txt != null) {
                            txt += " / ";
                        } else {
                            txt = "";
                        }
                        txt += stats.battery.toNumber() + "%";
                    }
                }
                totalwidth = dc.getTextWidthInPixels(txt, Helper.Fonts.Text);
            }

            if (Helper.Fonts.Icons != null) {
                iconWidth = dc.getTextWidthInPixels("2", Helper.Fonts.Icons);
                totalwidth += iconWidth + padding;
            }

            var startX = self.locX - (totalwidth / 2).toNumber();

            if (Helper.Fonts.Icons != null) {
                dc.setColor(Theme.ColorIcons, Graphics.COLOR_TRANSPARENT);
                dc.drawText(startX - -7, self.locY + (IsSmallDisplay ? 5 : 12), Helper.Fonts.Icons, "2", Graphics.TEXT_JUSTIFY_LEFT);

                var width = IsSmallDisplay ? 22 : 34;
                var height = IsSmallDisplay ? 6 : 9;
                var x = startX + (IsSmallDisplay ? 12 : 13);
                var y = self.locY + (IsSmallDisplay ? 16 : 25);

                var end = x + ((width * stats.battery) / 100).toNumber();

                while (x <= end) {
                    var barwidth = IsSmallDisplay ? 4 : 5;
                    if (x + barwidth > end) {
                        barwidth = end - x;
                    }
                    dc.fillRectangle(x, y, barwidth, height);
                    x += barwidth + 2;
                }

                startX += iconWidth + padding;
            }

            if (txt != null) {
                dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
                dc.drawText(startX, self.locY, Helper.Fonts.Text, txt, Graphics.TEXT_JUSTIFY_LEFT);
            }
        }
    }
}
