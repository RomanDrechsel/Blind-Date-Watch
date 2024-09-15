import Widgets;
import Toybox.Lang;
import Toybox.Application;

module DrawableContainers {
    class WidgetFactory {
        static function GetWidget(pos as String, container_params as Dictionary) as WidgetBase? {
            switch (pos) {
                case "Clock":
                    return new Widgets.Clock(container_params);
                case "Date":
                    return new Widgets.Date(container_params);
                case "Rect1":
                case "Rect2":
                case "Rect3":
                case "Rect4":
                    return new Widgets.Rect(container_params);
                case "Heartrate":
                    return new Widgets.Heartrate(container_params);
                case "Steps":
                    return new Widgets.Steps(container_params);
                case "Battery":
                    return new Widgets.Battery(container_params);
                default:
                    return null;
            }
        }
    }
}
