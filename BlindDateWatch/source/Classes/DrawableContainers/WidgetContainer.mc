import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Widgets;

module DrawableContainers {
    class WidgetContainer extends WatchUi.Drawable {
        var Widget = null as WidgetBase?;

        function initialize(params as Dictionary) {
            Drawable.initialize(params);
            self.Init();
        }

        function draw(dc as Dc) as Void {
            if (self.Widget != null) {
                self.Widget.draw(dc);
            }
        }

        function Init() as Void {
            self.Widget = null;
            var params = {
                "X" => self.locX,
                "Y" => self.locY,
                "W" => self.width,
                "H" => self.height,
            };

            self.Widget = WidgetFactory.GetWidget(self.identifier as String, params);
            if (self.Widget == null) {
                self.isVisible = false;
            } else {
                self.isVisible = true;
            }
        }
    }
}
