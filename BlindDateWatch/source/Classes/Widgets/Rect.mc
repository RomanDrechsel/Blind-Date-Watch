import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets {
    class Rect extends WidgetBase {
        private var _width as Number;
        private var _height as Number;
        private var _centerContainer as Boolean = false;

        function initialize(params as Dictionary) {
            WidgetBase.initialize(params);
            self._width = params.hasKey("W") ? params.get("W") : 0;
            self._height = params.hasKey("H") ? params.get("H") : 0;
            self._centerContainer = params.hasKey("center") ? params.get("center") : false;
        }

        function draw(dc as Dc) {
            if (self._height > 0 && self._width > 0) {
                var xoffset = self._centerContainer ? -12 : -5;
                dc.setColor(Theme.ColorLines, Theme.ColorLines);
                dc.fillRectangle(self.locX + xoffset, self.locY, self._width, self._height);
            }
        }
    }
}
