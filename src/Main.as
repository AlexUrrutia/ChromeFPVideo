package {
import feathers.controls.ImageLoader;
import feathers.media.VideoPlayer;

import starling.core.Starling;
import starling.display.Sprite;
import starling.events.Event;


public class Main extends Sprite {
    public function Main() {
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    protected function addedToStageHandler(event:starling.events.Event):void {
        this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
        var contentScaleFactor:Number = this.stage.starling.contentScaleFactor;
        var myStageWidth:Number = Starling.current.stage.stageWidth;
        var myStageHeight:Number = Starling.current.stage.stageHeight;

        var player:VideoPlayer = new VideoPlayer();
        player.setSize(320, 300);
        player.videoSource = "https://s3.amazonaws.com/flaxbinpic/bunny.mp4";
        this.addChild(player);
        var loader:ImageLoader = new ImageLoader();
        player.addChild(loader);

        function videoPlayer_readyHandler(event:Event):void {
            loader.source = player.texture;
        }

        player.addEventListener(Event.READY, videoPlayer_readyHandler);
        player.play();
    }
}
}


