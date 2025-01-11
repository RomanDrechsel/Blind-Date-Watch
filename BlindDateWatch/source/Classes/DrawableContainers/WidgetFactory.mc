import Widgets;
import Toybox.Lang;

module DrawableContainers {
    class WidgetFactory {
        private static var _showHeartrate as Boolean = true;
        private static var _showSteps as Boolean = true;

        static function onSettingsChanged() as Void {
            self._showHeartrate = Helper.Properties.Get("ShowHeartrate", true);
            self._showSteps = Helper.Properties.Get("ShowSteps", true);
        }

        static function GetWidget(pos as String, container_params as Dictionary) as WidgetBase? {
            switch (pos) {
                case "Clock":
                    return new Widgets.Clock(container_params);
                case "Date":
                    return new Widgets.Date(container_params);
                case "Rect1":
                case "Rect2":
                case "Rect3":
                    return new Widgets.Rect(container_params);
                case "WLeft":
                    return self.GetLeft(container_params);
                case "WCenter":
                    return self.GetCenter(container_params);
                case "WRight":
                    return self.GetRight(container_params);
                case "WBottom":
                    return self.GetBottom(container_params);
                default:
                    return null;
            }
        }

        private static function GetLeft(container_params as Dictionary) as WidgetBase? {
            if (self._showHeartrate == true && self._showSteps == true) {
                return new Widgets.Heartrate(container_params);
            } else {
                return null;
            }
        }

        private static function GetRight(container_params as Dictionary) as WidgetBase? {
            if (self._showSteps == true && self._showHeartrate == true) {
                return new Widgets.Steps(container_params);
            } else {
                return null;
            }
        }

        private static function GetCenter(container_params as Dictionary) as WidgetBase? {
            if (!container_params.hasKey("center")) {
                container_params.put("center", true);
            }
            if (self._showHeartrate == true && self._showSteps == true) {
                return new Widgets.Rect(container_params);
            } else if (self._showHeartrate == true) {
                return new Widgets.Heartrate(container_params);
            } else if (self._showSteps == true) {
                return new Widgets.Steps(container_params);
            } else {
                return new Widgets.Battery(container_params);
            }
        }

        private static function GetBottom(container_params as Dictionary) as WidgetBase? {
            if (self._showHeartrate == true || self._showSteps == true) {
                return new Widgets.Battery(container_params);
            } else {
                return null;
            }
        }
    }
}
