import Toybox.Lang;
import Toybox.Graphics;
import Helper;

module Widgets {
    class Rect extends WidgetBase {
        private var _width as Number;
        private var _height as Number;

        function initialize(params as Dictionary) {
            WidgetBase.initialize(params);
            self._width = params.hasKey("W") ? params.get("W") : 0;
            self._height = params.hasKey("H") ? params.get("H") : 0;
        }

        function draw(dc as Dc) {
            if (self._height > 0 && self._width > 0) {
                dc.setColor(Theme.ColorLines, Theme.ColorLines);
                dc.fillRectangle(self.locX, self.locY, self._width, self._height);
            }
        }
    }
}
