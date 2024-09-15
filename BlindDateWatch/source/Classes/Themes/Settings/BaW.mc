import Toybox.Application;
import Toybox.Lang;

module Themes {
    module Settings {
        class BaW extends ThemeSettingsBase {
            function initialize() {
                self.ColorBackground = 0x000000;
                self.ColorDate = 0xffffff;
                self.ColorClockHour = 0xffffff;
                self.ColorClockMinutes = 0xffffff;
                self.ColorClockColon = 0xffffff;
                self.ColorText = 0xffffff;
                self.ColorLines = 0xffffff;
                self.ColorIcons = 0xffffff;
            }
        }
    }
}
