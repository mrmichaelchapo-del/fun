package {
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFieldAutoSize;
    
    import ui.MenuBar;
    import ui.Toolbar;
    import ui.Stage;
    import blocks.BlockPalette;
    import blocks.BlockRegistry;
    import sprites.SpriteCanvas;
    import sound.SoundManager;
    import scripts.ScriptRunner;
    
    public class App extends Sprite {
        public static const APP_NAME:String = "Fun";
        public static const VERSION:String = "1.0.0";
        
        private var menuBar:MenuBar;
        private var toolbar:Toolbar;
        private var stageView:Stage;
        private var palette:BlockPalette;
        private var spriteCanvas:SpriteCanvas;
        private var soundManager:SoundManager;
        private var scriptRunner:ScriptRunner;
        private var bg:Shape;
        
        public function App() {
            super();
        }
        
        public function init(w:Number, h:Number):void {
            // Background
            bg = new Shape();
            bg.graphics.beginFill(0xF0F0F0);
            bg.graphics.drawRect(0, 0, w, h);
            bg.graphics.endFill();
            addChild(bg);
            
            // Menu bar
            menuBar = new MenuBar(w);
            addChild(menuBar);
            
            // Toolbar
            toolbar = new Toolbar(w);
            toolbar.y = 24;
            addChild(toolbar);
            
            // Block registry
            BlockRegistry.init();
            
            // Block palette (left)
            palette = new BlockPalette(220, h - 80);
            palette.x = 0;
            palette.y = 80;
            addChild(palette);
            
            // Stage (center)
            stageView = new Stage(w - 220 - 260, h - 80);
            stageView.x = 220;
            stageView.y = 80;
            addChild(stageView);
            
            // Sprite canvas (right)
            spriteCanvas = new SpriteCanvas(260, h - 80);
            spriteCanvas.x = w - 260;
            spriteCanvas.y = 80;
            addChild(spriteCanvas);
            
            // Sound manager
            soundManager = new SoundManager();
            
            // Script runner
            scriptRunner = new ScriptRunner(stageView, spriteCanvas, soundManager);
            scriptRunner.start();
            
            // Title
            var title:TextField = new TextField();
            title.text = APP_NAME + " v" + VERSION;
            title.autoSize = TextFieldAutoSize.LEFT;
            title.x = w - 120;
            title.y = 4;
            var tf:TextFormat = new TextFormat("Arial", 12, 0x666666);
            title.setTextFormat(tf);
            addChild(title);
        }
        
        public function resize(w:Number, h:Number):void {
            bg.graphics.clear();
            bg.graphics.beginFill(0xF0F0F0);
            bg.graphics.drawRect(0, 0, w, h);
            bg.graphics.endFill();
            
            if (menuBar) menuBar.resize(w);
            if (toolbar) toolbar.resize(w);
            if (palette) palette.resize(220, h - 80);
            if (stageView) stageView.resize(w - 220 - 260, h - 80);
            if (spriteCanvas) {
                spriteCanvas.x = w - 260;
                spriteCanvas.resize(260, h - 80);
            }
        }
    }
}