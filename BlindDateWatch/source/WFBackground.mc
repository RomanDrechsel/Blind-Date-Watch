import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class WFBackground extends WatchUi.Drawable
{
    private var _image = null as BitmapResource?;

    function initialize(params) {
        Drawable.initialize(params);
        self.Init();
    }

    function draw(dc as Dc) as Void
    {
        dc.setAntiAlias(true);
        dc.setColor(Graphics.COLOR_TRANSPARENT, Theme.ColorBackground);
        dc.clear();

        if (self._image != null)
        {
            dc.drawBitmap(0, 0, self._image);
        }
    }

    function Init()
    {
        self._image = null;
        if (Theme.ImageBackground > 0)
        {
            if (Theme.ImageBackground == 1 && Rez.Drawables has :BackgroundImageDark)
            {
                self._image = Application.loadResource(Rez.Drawables.BackgroundImageDark) as BitmapResource;
            }
            else if (Theme.ImageBackground == 2 && Rez.Drawables has :BackgroundImageFire)
            {
                self._image = Application.loadResource(Rez.Drawables.BackgroundImageFire) as BitmapResource;
            }
        }
    }
}
