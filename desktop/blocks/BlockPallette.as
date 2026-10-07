package blocks {
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.events.MouseEvent;
    
    public class BlockPalette extends Sprite {
        private var w:Number;
        private var h:Number;
        private var bg:Shape;
        private var scrollY:Number = 0;
        private var content:Sprite;
        private var title:TextField;
        
        public function BlockPalette(w:Number, h:Number) {
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
            title.text = "Blocks";
            title.width = w;
            title.height = 24;
            title.x = 8;
            title.y = 4;
            title.setTextFormat(new TextFormat("Arial", 14, 0x333333, true));
            addChild(title);
            
            content = new Sprite();
            content.y = 30;
            addChild(content);
            
            buildPalette();
        }
        
        private function buildPalette():void {
            var yPos:Number = 0;
            var cats:Array = BlockRegistry.getCategories();
            
            for each (var cat:String in cats) {
                var catLabel:TextField = new TextField();
                catLabel.text = cat.toUpperCase();
                catLabel.width = w;
                catLabel.height = 20;
                catLabel.x = 8;
                catLabel.y = yPos;
                catLabel.setTextFormat(new TextFormat("Arial", 11, 0x666666, true));
                content.addChild(catLabel);
                yPos += 22;
                
                var blocks:Array = BlockRegistry.getByCategory(cat);
                for each (var b:Block in blocks) {
                    var item:Block = new Block(b.id, b.label, b.category, b.blockType, b.inputs);
                    item.x = 8;
                    item.y = yPos;
                    content.addChild(item);
                    yPos += item.height + 4;
                }
                yPos += 8;
            }
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