import Toybox.WatchUi;

module Helper
{ 
    class Fonts
    {
        static var Text = null;
        static var Clock = null;
        static var Date = null;
        static var Icons = null;

        static function Load() as Void
        {
            self.Text = WatchUi.loadResource(Rez.Fonts.Text);
            self.Clock = WatchUi.loadResource(Rez.Fonts.Clock);
            self.Date = WatchUi.loadResource(Rez.Fonts.Date);
            self.Icons = WatchUi.loadResource(Rez.Fonts.Icons);
        }
    }
}