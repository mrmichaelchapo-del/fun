package blocks {
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFieldAutoSize;
    
    public class Block extends Sprite {
        public var id:String;
        public var label:String;
        public var category:String;
        public var blockType:String; // "hat", "stack", "boolean", "reporter", "c"
        public var inputs:Array;
        public var width:Number;
        public var height:Number = 24;
        
        private var bg:Shape;
        private var labelField:TextField;
        private var notchShape:Shape;
        
        public static const CAT_MOTION:String = "motion";
        public static const CAT_LOOKS:String = "looks";
        public static const CAT_SOUND:String = "sound";
        public static const CAT_EVENTS:String = "events";
        public static const CAT_CONTROL:String = "control";
        public static const CAT_SENSING:String = "sensing";
        public static const CAT_OPERATORS:String = "operators";
        public static const CAT_VARIABLES:String = "variables";
        
        public function Block(id:String, label:String, category:String, blockType:String = "stack", inputs:Array = null) {
            this.id = id;
            this.label = label;
            this.category = category;
            this.blockType = blockType;
            this.inputs = inputs ? inputs : [];
            
            bg = new Shape();
            addChild(bg);
            notchShape = new Shape();
            addChild(notchShape);
            
            labelField = new TextField();
            labelField.text = label;
            labelField.autoSize = TextFieldAutoSize.LEFT;
            labelField.selectable = false;
            labelField.mouseEnabled = false;
            addChild(labelField);
            
            draw();
        }
        
        public function getCategoryColor():uint {
            switch (category) {
                case CAT_MOTION: return 0x4C97FF;
                case CAT_LOOKS: return 0x9966FF;
                case CAT_SOUND: return 0xCF63CF;
                case CAT_EVENTS: return 0xFFBF00;
                case CAT_CONTROL: return 0xFFAB19;
                case CAT_SENSING: return 0x5CB1D6;
                case CAT_OPERATORS: return 0x59C059;
                case CAT_VARIABLES: return 0xFF8C1A;
                default: return 0x999999;
            }
        }
        
        private function draw():void {
            labelField.setTextFormat(new TextFormat("Arial", 11, 0xFFFFFF));
            width = Math.max(labelField.width + 20, 60);
            
            var col:uint = getCategoryColor();
            
            // Draw block body
            bg.graphics.clear();
            bg.graphics.beginFill(col);
            bg.graphics.drawRoundRect(0, 0, width, height, 4, 4);
            bg.graphics.endFill();
            
            // Highlight
            bg.graphics.beginFill(0xFFFFFF, 0.15);
            bg.graphics.drawRoundRect(2, 2, width - 4, height / 2 - 2, 3, 3);
            bg.graphics.endFill();
            
            // Notch / bump for stack blocks
            if (blockType == "stack" || blockType == "c") {
                bg.graphics.beginFill(col);
                bg.graphics.drawRect(width / 2 - 6, height, 12, 3);
                bg.graphics.endFill();
            }
            
            labelField.x = 10;
            labelField.y = (height - labelField.height) / 2;
        }
    }
}