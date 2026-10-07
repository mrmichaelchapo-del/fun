package sprites {
    import flash.display.BitmapData;
    import flash.display.Shape;
    import flash.geom.Rectangle;
    
    public class Costume {
        public var name:String;
        public var bitmap:BitmapData;
        public var width:Number;
        public var height:Number;
        public var rotationCenterX:Number;
        public var rotationCenterY:Number;
        
        public function Costume(name:String, bitmap:BitmapData) {
            this.name = name;
            this.bitmap = bitmap;
            this.width = bitmap.width;
            this.height = bitmap.height;
            this.rotationCenterX = bitmap.width / 2;
            this.rotationCenterY = bitmap.height / 2;
        }
        
        public static function createDefault(name:String, color:uint, shape:String = "circle"):Costume {
            var s:Shape = new Shape();
            s.graphics.beginFill(color);
            if (shape == "circle") {
                s.graphics.drawCircle(25, 25, 25);
            } else if (shape == "square") {
                s.graphics.drawRect(0, 0, 50, 50);
            } else if (shape == "triangle") {
                s.graphics.moveTo(25, 0);
                s.graphics.lineTo(50, 50);
                s.graphics.lineTo(0, 50);
                s.graphics.lineTo(25, 0);
            }
            s.graphics.endFill();
            
            var bmd:BitmapData = new BitmapData(50, 50, true, 0x00000000);
            bmd.draw(s);
            return new Costume(name, bmd);
        }
    }
}