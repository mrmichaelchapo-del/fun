package sprites {
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    public class SpriteCanvas extends Sprite {
        private var w:Number;
        private var h:Number;
        private var bg:Shape;
        private var title:TextField;
        public var sprites:Array = [];
        public var activeSprite:Sprite;
        
        public function SpriteCanvas(w:Number, h:Number) {
            this.w = w;
            this.h = h;
            
            bg = new Shape();
            bg.graphics.beginFill(0xFFFFFF);
            bg.graphics.drawRect(0, 0, w, h);
            bg.graphics.lineStyle(1, 0xCCCCCC);
            bg.graphics.drawRect(0, 0, w, h);
            bg.graphics.endFill();
            addChild(bg);
            
            title = new TextField();
            title.text = "Sprites";
            title.width = w;
            title.height = 24;
            title.x = 8;
            title.y = 4;
            title.setTextFormat(new TextFormat("Arial", 14, 0x333333, true));
            addChild(title);
            
            createDefaultSprites();
        }
        
        private function createDefaultSprites():void {
            var cat:Sprite = new Sprite("Cat");
            cat.addCostume(Costume.createDefault("costume1", 0xFFAA00, "circle"));
            cat.addCostume(Costume.createDefault("costume2", 0xFF6600, "square"));
            cat.setX(0); cat.setY(0);
            addSprite(cat);
            
            var ball:Sprite = new Sprite("Ball");
            ball.addCostume(Costume.createDefault("costume1", 0x00AAFF, "circle"));
            ball.setX(50); ball.setY(50);
            addSprite(ball);
            
            var star:Sprite = new Sprite("Star");
            star.addCostume(Costume.createDefault("costume1", 0xFFD700, "triangle"));
            star.setX(-50); star.setY(0);
            addSprite(star);
        }
        
        public function addSprite(s:Sprite):void {
            sprites.push(s);
            if (!activeSprite) activeSprite = s;
        }
        
        public function resize(w:Number, h:Number):void {
            this.w = w;
            this.h = h;
            bg.graphics.clear();
            bg.graphics.beginFill(0xFFFFFF);
            bg.graphics.drawRect(0, 0, w, h);
            bg.graphics.lineStyle(1, 0xCCCCCC);
            bg.graphics.drawRect(0, 0, w, h);
            bg.graphics.endFill();
            title.width = w;
        }
    }
}