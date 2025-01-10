import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Time;

class WFApp extends Application.AppBase {
    var WatchfaceView = null as WFView?;

    function initialize() {
        AppBase.initialize();
        IsSmallDisplay = System.getDeviceSettings().screenWidth < 320;
    }

    function getInitialView() as Array<Views or InputDelegates>? {
        if (self.WatchfaceView == null) {
            self.WatchfaceView = new WFView();
        }
        return [self.WatchfaceView] as Array<Views or InputDelegates>;
    }

    function onStart(state as Dictionary?) as Void {
        Helper.Fonts.Load();
        DrawableContainers.WidgetFactory.onSettingsChanged();
        Themes.ThemesLoader.loadTheme();
    }

    function onSettingsChanged() as Void {
        Helper.Fonts.Load();
        Themes.ThemesLoader.loadTheme();
        DrawableContainers.WidgetFactory.onSettingsChanged();
        self.WatchfaceView.onSettingsChanged();
    }
}

var IsSmallDisplay = true;

function Log(obj as String) {
    var info = Time.Gregorian.info(Time.now(), Time.FORMAT_SHORT);
    var str = info.year + "-" + info.month.format("%02d") + "-" + info.day.format("%02d") + "T" + info.hour.format("%02d") + ":" + info.min.format("%02d") + ":" + info.sec.format("%02d");
    Toybox.System.println(str + ": " + obj);
}
