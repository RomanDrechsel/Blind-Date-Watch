import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class WFApp extends Application.AppBase 
{
    var WatchfaceView = null as WFView;

    function initialize() 
    {
        AppBase.initialize();
        var settings = System.getDeviceSettings() as DeviceSettings;
        IsSmallDisplay = settings.screenWidth < 320;
    }

    function getInitialView() as Array<Views or InputDelegates>? 
    {
        self.WatchfaceView = new WFView();
        return [ self.WatchfaceView ] as Array<Views or InputDelegates>;
    }

    function onStart(state as Dictionary?) as Void 
    {
        Helper.Fonts.Load();
        Themes.ThemesLoader.loadTheme();        
    }

    // New app settings have been received so trigger a UI update
    function onSettingsChanged() as Void 
    {
        Helper.Fonts.Load();
        Themes.ThemesLoader.loadTheme();
        self.WatchfaceView.onSettingsChanged();
    }
}

var IsSmallDisplay = true;