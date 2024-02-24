import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets 
{
    class Rect extends WidgetBase
    {
        private var _width as Number;
        private var _height as Number;

        function initialize(params as Dictionary) 
        {
            WidgetBase.initialize(params);
            self._width = params.get("W");
            self._height = params.get("H");
        }

        function draw(dc as Dc)
        {
            dc.setColor(Theme.ColorLines, Theme.ColorLines);
            dc.fillRectangle(self.locX, self.locY, self._width, self._height);
        }
    }
}