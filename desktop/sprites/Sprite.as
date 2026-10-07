package sprites {
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite as FlashSprite;
    import flash.geom.Point;
    
    public class Sprite extends FlashSprite {
        public var name:String;
        public var x:Number = 0;
        public var y:Number = 0;
        public var direction:Number = 90;
        public var size:Number = 100;
        public var visible:Boolean = true;
        public var costumes:Array = [];
        public var currentCostume:int = 0;
        public var sounds:Array = [];
        public var scripts:Array = [];
        public var variables:Object = {};
        public var isClone:Boolean = false;
        
        private var costumeBitmap:Bitmap;
        
        public function Sprite(name:String) {
            this.name = name;
            costumeBitmap = new Bitmap();
            addChild(costumeBitmap);
        }
        
        public function addCostume(c:Costume):void {
            costumes.push(c);
            if (costumes.length == 1) updateCostume();
        }
        
        public function updateCostume():void {
            if (costumes.length == 0) return;
            var c:Costume = costumes[currentCostume];
            costumeBitmap.bitmapData = c.bitmap;
            costumeBitmap.x = -c.rotationCenterX;
            costumeBitmap.y = -c.rotationCenterY;
            this.x = x;
            this.y = y;
            this.visible = visible;
            this.scaleX = size / 100;
            this.scaleY = size / 100;
        }
        
        public function setX(v:Number):void { x = v; this.x = v; }
        public function setY(v:Number):void { y = v; this.y = v; }
        public function changeX(dx:Number):void { setX(x + dx); }
        public function changeY(dy:Number):void { setY(y + dy); }
        
        public function move(steps:Number):void {
            var rad:Number = (direction - 90) * Math.PI / 180;
            setX(x + Math.cos(rad) * steps);
            setY(y + Math.sin(rad) * steps);
        }
        
        public function turnRight(deg:Number):void { direction = (direction + deg) % 360; }
        public function turnLeft(deg:Number):void { direction = (direction - deg + 360) % 360; }
        
        public function nextCostume():void {
            if (costumes.length == 0) return;
            currentCostume = (currentCostume + 1) % costumes.length;
            updateCostume();
        }
        
        public function setCostume(index:int):void {
            if (index >= 0 && index < costumes.length) {
                currentCostume = index;
                updateCostume();
            }
        }
        
        public function show():void { visible = true; this.visible = true; }
        public function hide():void { visible = false; this.visible = false; }
        public function setSize(s:Number):void { size = s; this.scaleX = s/100; this.scaleY = s/100; }
        public function changeSize(ds:Number):void { setSize(size + ds); }
        
        public function clone():Sprite {
            var s:Sprite = new Sprite(name + "_clone");
            s.costumes = costumes;
            s.currentCostume = currentCostume;
            s.x = x; s.y = y;
            s.direction = direction;
            s.size = size;
            s.visible = visible;
            s.isClone = true;
            s.updateCostume();
            return s;
        }
    }
}