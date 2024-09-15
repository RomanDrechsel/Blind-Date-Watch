import Toybox.Lang;

module Widgets {
    class WidgetBase {
        var locX = 0;
        var locY = 0;

        function initialize(container_params as Dictionary) {
            self.locX = container_params.hasKey("X") ? container_params.get("X") : 0;
            self.locY = container_params.hasKey("Y") ? container_params.get("Y") : 0;
        }
    }
}
