import Toybox.Lang;
import Toybox.Graphics;
import Toybox.Time.Gregorian;
import Toybox.System;
import Helper;

module Widgets 
{
    class Date extends WidgetBase
    {
        private var _dateFormat as Number;

        function initialize(params as Dictionary) 
        {
            WidgetBase.initialize(params);

            var setting = Application.Properties.getValue("FormatDate") as Number;
            if (setting != null && setting >= 0)
            {
                self._dateFormat = setting;
            }
            else
            {
                var lang = Toybox.System.getDeviceSettings().systemLanguage;
                if ([ System.LANGUAGE_CHS, System.LANGUAGE_CHT, System.LANGUAGE_JPN, System.LANGUAGE_KOR ].indexOf(lang) >= 0)
                {
                    // yyyy/mm/dd
                    self._dateFormat = 1;
                }
                else if (lang == System.LANGUAGE_ENG)
                {
                    // mm/dd/yyyy
                    self._dateFormat = 3;
                }
                else if ([ System.LANGUAGE_ARA, System.LANGUAGE_GRE, System.LANGUAGE_HEB, System.LANGUAGE_IND, System.LANGUAGE_ITA, 
                    System.LANGUAGE_POR, System.LANGUAGE_SPA, System.LANGUAGE_THA, System.LANGUAGE_VIE, System.LANGUAGE_ZSM ].indexOf(lang) >= 0)
                {
                    // dd/mm/yyyy
                    self._dateFormat = 5;
                }
                else if (lang == System.LANGUAGE_SWE)
                {
                    // yyyy-mm-dd
                    self._dateFormat = 7;
                }
                else
                {
                    self._dateFormat = 0;
                }
                System.println(self._dateFormat);
                Application.Properties.setValue("FormatDate", self._dateFormat);
            }
        }

        function draw(dc as Dc) as Void 
        {
            if (Fonts.Date == null)
            {
                return;
            }

            var time = Gregorian.info(Time.now(), Time.FORMAT_SHORT);

            var date;
            switch (self._dateFormat)
            {
                default:
                    date = time.day.format("%02d") + "." + time.month.format("%02d") + "." + time.year.toString();
                    break;
                case 1:
                    date = time.year.toString() + "/" + time.month.format("%02d") + "/" + time.day.format("%02d");
                    break;
                case 2:
                    date = time.year.toString() + "/" + time.month.toString() + "/" + time.day.toString();
                    break;
                case 3:
                    date = time.month.format("%02d") + "/" + time.day.format("%02d") + "/" + time.year.toString();
                    break;
                case 4:
                    date = time.month.toString() + "/" + time.day.toString() + "/" + time.year.toString();
                    break;
                case 5:
                    date = time.day.format("%02d") + "/" + time.month.format("%02d") + "/" + time.year.toString();
                    break;
                case 6:
                    date = time.day.toString() + "/" + time.month.toString() + "/" + time.year.toString();
                    break;
                case 7:
                    date = time.year.toString() + "-" + time.month.format("%02d") + "-" + time.day.format("%02d");
                    break;
                case 8:
                    date = time.year.toString() + "-" + time.month.toString() + "-" + time.day.toString();
                    break;
            }

            dc.setColor(Theme.ColorText, Graphics.COLOR_TRANSPARENT);
            dc.drawText(self.locX, self.locY, Fonts.Date, date, Graphics.TEXT_JUSTIFY_CENTER);
        }
    }
}