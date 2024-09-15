import Toybox.Application;
import Toybox.Lang;

module Themes {
    module Settings {
        class DarkBlue extends ThemeSettingsBase {
            function initialize() {
                self.ColorBackground = 0x000000;
                self.ImageBackground = 1;
                self.ColorDate = 0x0071a2;
                self.ColorClockHour = 0x73b9e0;
                self.ColorClockMinutes = 0x0071a2;
                self.ColorClockColon = 0xffffff;
                self.ColorText = 0x73b9e0;
                self.ColorLines = 0x73b9e0;
                self.ColorIcons = 0x00ff00;
            }
        }
    }
}
