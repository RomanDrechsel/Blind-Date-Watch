import Toybox.Application;
import Toybox.Lang;

module Themes {
    module Settings {
        class Steffen extends ThemeSettingsBase {
            function initialize() {
                self.ColorBackground = 0xffffff;
                self.ColorDate = 0x000000;
                self.ColorClockHour = 0x000000;
                self.ColorClockMinutes = 0x008000;
                self.ColorClockColon = 0x000000;
                self.ColorText = 0x000000;
                self.ColorLines = 0x000000;
                self.ColorIcons = 0x008000;
            }
        }
    }
}
