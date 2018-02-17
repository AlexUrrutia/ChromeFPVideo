package {
import feathers.utils.ScreenDensityScaleFactorManager;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.display3D.Context3DProfile;
import flash.display3D.Context3DRenderMode;
import flash.events.Event;
import starling.core.Starling;

[SWF(width="800", height="640", frameRate="60", backgroundColor="#555555")]
public class ChromeTest extends Sprite {
    private var myStarling:Starling;
    private var myScaler:ScreenDensityScaleFactorManager;

    public function ChromeTest() {
        if (this.stage) {
            this.stage.scaleMode = StageScaleMode.SHOW_ALL;
            this.stage.align = StageAlign.TOP_LEFT;
        }
        this.mouseEnabled = this.mouseChildren = false;
        this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
    }

    private function loaderInfo_completeHandler(event:Event):void {
        Starling.multitouchEnabled = false;
        this.myStarling = new Starling(Main, this.stage, null, null, Context3DRenderMode.AUTO, Context3DProfile.STANDARD); //Main is the Main.as file which extends Starling Sprite.
        this.myScaler = new ScreenDensityScaleFactorManager(this.myStarling);
        this.myStarling.enableErrorChecking = false;
        this.myStarling.showStats = false;
        this.myStarling.skipUnchangedFrames = false;
        this.myStarling.start();
    }
}
}
