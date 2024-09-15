import Toybox.Lang;
import Toybox.Application;
import Themes.Settings;

module Themes {
    class ThemesLoader {
        static function loadTheme() as Void {
            var theme = Helper.Properties.Get("Theme", 0) as Number;
            switch (theme) {
                default:
                case 0:
                    Theme = new Settings.DarkBlue();
                    break;
                case 1:
                    Theme = new Settings.Fire();
                    break;
                case 2:
                    Theme = new Settings.BaW();
                    break;
                case 3:
                    Theme = new Settings.WaB();
                    break;
                case 4:
                    Theme = new Settings.Steffen();
                    break;
                case 666:
                    Theme = new Settings.BSoD();
                    break;
                case 999:
                    Theme = new Settings.Custom();
                    break;
            }
        }
    }
}

var Theme = new Themes.ThemeSettingsBase();
