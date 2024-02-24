import Toybox.Application;
import Toybox.Lang;

module Themes
{ 
    module Settings
    {
        class Custom extends DarkBlue
        {
            public function initialize()
            {
                self.ColorBackground = self.GetColorFromProperties("ColorBG", self.ColorBackground);
                self.ColorDate = self.GetColorFromProperties("ColorDate", self.ColorDate);
                self.ColorClockHour = self.GetColorFromProperties("ColorHour", self.ColorClockHour);
                self.ColorClockMinutes = self.GetColorFromProperties("ColorMinutes", self.ColorClockMinutes);
                self.ColorClockColon = self.GetColorFromProperties("ColorColon", self.ColorClockColon);
                self.ColorText = self.GetColorFromProperties("ColorText", self.ColorText);
                self.ColorLines = self.GetColorFromProperties("ColorLines", self.ColorLines);
                self.ColorIcons = self.GetColorFromProperties("ColorIcons", self.ColorIcons);
                Toybox.System.println("INIT 1");
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