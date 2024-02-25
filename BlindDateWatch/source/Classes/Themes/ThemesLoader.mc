import Toybox.Lang;
import Toybox.Application;
import Themes.Settings;

module Themes
{
    class ThemesLoader
    {
        static function loadTheme() as Void
        {
            Theme = null;
            var theme = Application.Properties.getValue("Theme") as Number;
            switch (theme)
            {
                default:
                case 0:
                    Theme = new DarkBlue();
                    break;
                case 1:
                    Theme = new Fire();
                    break;
                case 2:
                    Theme = new BaW();
                    break;
                case 3:
                    Theme = new WaB();
                    break;
                case 4:
                    Theme = new Steffen();
                    break;
                case 666:
                    Theme = new BSoD();
                    break;
                case 999:
                    Theme = new Custom();
                    break;
            }

            if (Theme == null)
            {
                Theme = new ThemeSettingsBase();
            }
        }
    }
}

var Theme = new Themes.ThemeSettingsBase();