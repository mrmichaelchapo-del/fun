package sound {
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    import flash.events.Event;
    
    public class SoundManager {
        private var sounds:Object = {};
        private var channels:Array = [];
        public var volume:Number = 1.0;
        public var pitch:Number = 1.0;
        
        public function SoundManager() {
            registerDefaults();
        }
        
        private function registerDefaults():void {
            // Built-in synthesized "sounds" - in a real app these would be loaded files
            // Here we just register names so the block palette works
            sounds["Meow"] = null;
            sounds["Pop"] = null;
            sounds["Beep"] = null;
            sounds["Chime"] = null;
            sounds["Drum"] = null;
        }
        
        public function registerSound(name:String, s:Sound):void {
            sounds[name] = s;
        }
        
        public function play(name:String, loop:Boolean = false):void {
            var s:Sound = sounds[name];
            if (s == null) return;
            
            var transform:SoundTransform = new SoundTransform(volume);
            var channel:SoundChannel = s.play(0, loop ? 999 : 0, transform);
            if (channel) {
                channels.push(channel);
                channel.addEventListener(Event.SOUND_COMPLETE, onComplete);
            }
        }
        
        private function onComplete(e:Event):void {
            var ch:SoundChannel = e.target as SoundChannel;
            var idx:int = channels.indexOf(ch);
            if (idx >= 0) channels.splice(idx, 1);
        }
        
        public function stopAll():void {
            for each (var ch:SoundChannel in channels) {
                ch.stop();
            }
            channels = [];
        }
        
        public function setVolume(v:Number):void {
            volume = Math.max(0, Math.min(1, v / 100));
        }
        
        public function changeVolume(dv:Number):void {
            setVolume(volume * 100 + dv);
        }
    }
}