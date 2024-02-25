import Toybox.Lang;
import Toybox.Graphics;
import Helper;
import Helper;

module Widgets 
{
    class Clock extends WidgetBase
    {
        private var _textContainer as ExtText;
        private var _texts as Array<ExtTextPart>;
        private var _leadingZero = true;

        function initialize(params as Dictionary) 
        {
            WidgetBase.initialize(params);
            self._textContainer = new ExtText(self.locX, self.locY - (Graphics.getFontHeight(Fonts.Clock) / 2), Graphics.TEXT_JUSTIFY_CENTER);
            var setting = Application.Properties.getValue("TimeZero") as Boolean;
            Toybox.System.println(setting);
            if (setting != null)
            {
                self._leadingZero = setting;
                
            }
            Toybox.System.println(self._leadingZero);
        }

        function draw(dc as Dc) as Void 
        {
            if (Fonts.Clock == null)
            {
                self._texts = [];
                return;
            }
            else if (self._texts == null)
            {
                self._texts = [];
                self._texts.add(new ExtTextPart("", Theme.ColorClockHour, Fonts.Clock));
                self._texts.add(new ExtTextPart(":", Theme.ColorClockColon, Fonts.Clock));
                self._texts.add(new ExtTextPart("", Theme.ColorClockMinutes, Fonts.Clock));
            }

            var clockTime = System.getClockTime();
            var hour = clockTime.hour;
            var m = clockTime.min.format("%02d");
            var h = hour.format("%02d");
            
            if (System.getDeviceSettings().is24Hour == false)
            {
                if (hour == 0)
                {
                    h = "12";
                }
                else if (hour < 12)
                {
                    h = hour.toString();
                }
                else if (hour == 12)
                {
                    h = "12";
                }
                else
                {
                    h = (hour - 12).toString();
                    hour -= 12;
                }

                if (hour > 0 && hour < 10 && self._leadingZero == true)
                {
                    h = "0" + h;
                }
            }

            self._texts[0].Text = h.toString();
            self._texts[2].Text = m.toString();
            self._textContainer.draw(self._texts, dc);
        }
    }
}