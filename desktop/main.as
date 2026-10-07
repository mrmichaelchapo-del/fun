package {
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    
    public class Main extends Sprite {
        private var app:App;
        
        public function Main() {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            app = new App();
            addChild(app);
            app.init(stage.stageWidth, stage.stageHeight);
            
            stage.addEventListener(Event.RESIZE, onResize);
        }
        
        private function onResize(e:Event):void {
            app.resize(stage.stageWidth, stage.stageHeight);
        }
    }
}