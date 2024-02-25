import Widgets;
import Toybox.Lang;
import Toybox.Application;

module DrawableContainers
{
    class WidgetFactory
    {
        static function GetWidget(pos as String, container_params as Dictionary) as WidgetBase
        {
            switch (pos)
            {
                case "Clock":
                    return new Clock(container_params);
                case "Date":
                    return new Date(container_params);
                case "Rect1":
                case "Rect2":
                case "Rect3":
                case "Rect4":
                    return new Rect(container_params);
                case "Heartrate":
                    return new Heartrate(container_params);
                case "Steps":
                    return new Steps(container_params);
                case "Battery":
                    return new Battery(container_params);
            }

            return null;
        }
    }
}