import Toybox.Application;
import Toybox.Lang;

module Themes {
    module Settings {
        class Custom extends ThemeSettingsBase {
            public function initialize() {
                self.ColorBackground = self.GetColorFromProperties("ColorBG", "#000000");
                self.ImageBackground = Helper.Properties.Get("ImageBG", 0) as Number;
                self.ColorDate = self.GetColorFromProperties("ColorDate", "#0071a2");
                self.ColorClockHour = self.GetColorFromProperties("ColorHour", "#73b9e0");
                self.ColorClockMinutes = self.GetColorFromProperties("ColorMinutes", "#0071a2");
                self.ColorClockColon = self.GetColorFromProperties("ColorColon", "#ffffff");
                self.ColorText = self.GetColorFromProperties("ColorText", "#73b9e0");
                self.ColorLines = self.GetColorFromProperties("ColorLines", "#73b9e0");
                self.ColorIcons = self.GetColorFromProperties("ColorIcons", "#00ff00");
            }

            private static function GetColorFromProperties(key as String, fallback as String) as Number {
                var customcolor = Helper.Properties.Get(key, fallback) as String;
                var color = Helper.StringUtil.stringReplace(customcolor, "#", "").toNumberWithBase(16);

                if (color == null) {
                    color = Helper.StringUtil.stringReplace(fallback, "#", "").toNumberWithBase(16);
                }

                return color;
            }
        }
    }
}
