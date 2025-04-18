import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Widgets;

class WFView extends WatchUi.WatchFace {
    private var _drawables as Array<Object>? = null;

    function initialize() {
        WatchFace.initialize();
    }

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

    function onExitSleep() as Void {
        Helper.Fonts.Load();

        if (self._drawables == null) {
            self.readDrawables();
        }

        for (var i = 0; i < self._drawables.size(); i++) {
            var drawable = self._drawables[i];
            if (drawable has :onShow) {
                try {
                    drawable.onShow();
                } catch (ex instanceof Lang.Exception) {
                    $.Log("Could not invoke onShow Method: " + ex.getErrorMessage());
                }
            } else if (drawable instanceof DrawableContainers.WidgetContainer) {
                if (drawable.Widget != null && drawable.Widget has :onHide) {
                    try {
                        drawable.Widget.onHide();
                    } catch (ex instanceof Lang.Exception) {
                        $.Log("Could not invoke onHide Method: " + ex.getErrorMessage());
                    }
                }
            }
        }
    }

    function onEnterSleep() as Void {
        if (self._drawables == null) {
            self.readDrawables();
        }

        for (var i = 0; i < self._drawables.size(); i++) {
            var drawable = self._drawables[i];
            if (drawable has :onHide) {
                try {
                    drawable.onHide();
                } catch (ex instanceof Lang.Exception) {
                    $.Log("Could not invoke onHide Method: " + ex.getErrorMessage());
                }
            } else if (drawable instanceof DrawableContainers.WidgetContainer) {
                if (drawable.Widget != null && drawable.Widget has :onHide) {
                    try {
                        drawable.Widget.onHide();
                    } catch (ex instanceof Lang.Exception) {
                        $.Log("Could not invoke onHide Method: " + ex.getErrorMessage());
                    }
                }
            }
        }
        Helper.Fonts.Unload();
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
