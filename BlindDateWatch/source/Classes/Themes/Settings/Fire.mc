import Toybox.Application;
import Toybox.Lang;

module Themes {
    module Settings {
        class Fire extends ThemeSettingsBase {
            function initialize() {
                self.ColorBackground = 0x590202;
                self.ImageBackground = 2;
                self.ColorDate = 0xc8ffff;
                self.ColorClockHour = 0x49e3ff;
                self.ColorClockMinutes = 0x0690c2;
                self.ColorClockColon = 0xffffff;
                self.ColorText = 0x87f0ff;
                self.ColorLines = 0xffffff;
                self.ColorIcons = 0xf33a21;
            }
        }
    }
}
