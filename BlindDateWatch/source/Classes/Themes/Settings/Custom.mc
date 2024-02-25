import Toybox.Application;
import Toybox.Lang;

module Themes
{ 
    module Settings
    {
        class Custom extends ThemeSettingsBase
        {
            public static var ColorBackground = 0x000000;
            public static var ImageBackground = 0;
            public static var ColorDate = 0x0071a2;
            public static var ColorClockHour = 0x73b9e0;
            public static var ColorClockMinutes = 0x0071a2;
            public static var ColorClockColon = 0xFFFFFF;
            public static var ColorText = 0x73b9e0;
            public static var ColorLines = 0x73b9e0;
            public static var ColorIcons = 0x00FF00;

            public function initialize()
            {
                self.ColorBackground = self.GetColorFromProperties("ColorBG", self.ColorBackground);
                self.ImageBackground = Application.Properties.getValue("ImageBG") as Number;
                self.ColorDate = self.GetColorFromProperties("ColorDate", self.ColorDate);
                self.ColorClockHour = self.GetColorFromProperties("ColorHour", self.ColorClockHour);
                self.ColorClockMinutes = self.GetColorFromProperties("ColorMinutes", self.ColorClockMinutes);
                self.ColorClockColon = self.GetColorFromProperties("ColorColon", self.ColorClockColon);
                self.ColorText = self.GetColorFromProperties("ColorText", self.ColorText);
                self.ColorLines = self.GetColorFromProperties("ColorLines", self.ColorLines);
                self.ColorIcons = self.GetColorFromProperties("ColorIcons", self.ColorIcons);
            }

            private static function GetColorFromProperties(key as String, fallback as Number) as Number
            {
                //custom color
                var customcolor = Application.Properties.getValue(key) as String;
                var color = Helper.String.stringReplace(customcolor, "#", "").toNumberWithBase(16);

                if (color == null)
                {
                    color = fallback;
                }

                return color;
            }
        }
    }
}