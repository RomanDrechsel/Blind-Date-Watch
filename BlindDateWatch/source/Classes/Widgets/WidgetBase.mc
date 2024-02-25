using Toybox.Graphics as Gfx;
import Toybox.Lang;

module Widgets 
{   
    class WidgetBase
    {
        var locX = 0;
        var locY = 0;

        function initialize(container_params as Dictionary)
        {
            self.locX = container_params.get("X");
            if (self.locX == null)
            {
                self.locX = 0;
            }
            self.locY = container_params.get("Y");
            if (self.locY == null)
            {
                self.locY = 0;
            }
        }
    }
}