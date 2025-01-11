import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class WFView extends WatchUi.WatchFace {
    private var _drawables as Array<WatchUi.Drawable>? = null;

    function onLayout(dc as Dc) as Void {
        self.setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onSettingsChanged() as Void {
        if (self._drawables == null) {
            self.readDrawables();
        }

        for (var i = 0; i < self._drawables.size(); i++) {
            var drawable = self._drawables[i];
            if (drawable has :Init) {
                drawable.Init();
            }
        }
    }

    function onHide() as Void {
        WatchFace.onHide();

        if (self._drawables == null) {
            self.readDrawables();
        }

        for (var i = 0; i < self._drawables.size(); i++) {
            var drawable = self._drawables[i];
            if (drawable has :onHide) {
                drawable.onHide();
            }
        }
    }

    private function readDrawables() as Void {
        var ids = ["BG", "Date", "Rect1", "Rect2", "Rect3", "Clock", "WLeft", "WCenter", "WRight", "WBottom"];
        self._drawables = [];
        for (var i = 0; i < ids.size(); i++) {
            var drawable = View.findDrawableById(ids[i]);
            if (drawable != null) {
                self._drawables.add(drawable);
            }
        }
    }
}
