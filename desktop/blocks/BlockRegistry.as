package blocks {
    public class BlockRegistry {
        public static var blocks:Array = [];
        
        public static function init():void {
            blocks = [];
            
            // ---- MOTION (10) ----
            add("motion_move", "move 10 steps", Block.CAT_MOTION);
            add("motion_turn_right", "turn ↻ 15 degrees", Block.CAT_MOTION);
            add("motion_turn_left", "turn ↺ 15 degrees", Block.CAT_MOTION);
            add("motion_goto", "go to x: 0 y: 0", Block.CAT_MOTION);
            add("motion_glide", "glide 1 secs to x: 0 y: 0", Block.CAT_MOTION);
            add("motion_point", "point in direction 90", Block.CAT_MOTION);
            add("motion_change_x", "change x by 10", Block.CAT_MOTION);
            add("motion_set_x", "set x to 0", Block.CAT_MOTION);
            add("motion_change_y", "change y by 10", Block.CAT_MOTION);
            add("motion_set_y", "set y to 0", Block.CAT_MOTION);
            
            // ---- LOOKS (12) ----
            add("looks_say", "say Hello!", Block.CAT_LOOKS);
            add("looks_sayforsecs", "say Hello! for 2 secs", Block.CAT_LOOKS);
            add("looks_think", "think Hmm...", Block.CAT_LOOKS);
            add("looks_switchcostume", "switch costume to costume1", Block.CAT_LOOKS);
            add("looks_nextcostume", "next costume", Block.CAT_LOOKS);
            add("looks_changesize", "change size by 10", Block.CAT_LOOKS);
            add("looks_setsize", "set size to 100%", Block.CAT_LOOKS);
            add("looks_show", "show", Block.CAT_LOOKS);
            add("looks_hide", "hide", Block.CAT_LOOKS);
            add("looks_changeeffect", "change color effect by 25", Block.CAT_LOOKS);
            add("looks_seteffect", "set color effect to 0", Block.CAT_LOOKS);
            add("looks_cleareffects", "clear graphic effects", Block.CAT_LOOKS);
            
            // ---- SOUND (8) ----
            add("sound_play", "play sound Meow", Block.CAT_SOUND);
            add("sound_playuntildone", "play sound Meow until done", Block.CAT_SOUND);
            add("sound_stop", "stop all sounds", Block.CAT_SOUND);
            add("sound_changevolume", "change volume by 10", Block.CAT_SOUND);
            add("sound_setvolume", "set volume to 100%", Block.CAT_SOUND);
            add("sound_changeeffect", "change pitch effect by 10", Block.CAT_SOUND);
            add("sound_seteffect", "set pitch effect to 100", Block.CAT_SOUND);
            add("sound_clear", "clear sound effects", Block.CAT_SOUND);
            
            // ---- EVENTS (8) ----
            add("event_whenflag", "when ⚑ clicked", Block.CAT_EVENTS, "hat");
            add("event_whenkey", "when space key pressed", Block.CAT_EVENTS, "hat");
            add("event_whenclicked", "when this sprite clicked", Block.CAT_EVENTS, "hat");
            add("event_whenbackdrop", "when backdrop switches to backdrop1", Block.CAT_EVENTS, "hat");
            add("event_whenloudness", "when loudness > 10", Block.CAT_EVENTS, "hat");
            add("event_whentimer", "when timer > 10", Block.CAT_EVENTS, "hat");
            add("event_broadcast", "broadcast message1", Block.CAT_EVENTS);
            add("event_broadcastwait", "broadcast message1 and wait", Block.CAT_EVENTS);
            
            // ---- CONTROL (12) ----
            add("control_wait", "wait 1 seconds", Block.CAT_CONTROL);
            add("control_repeat", "repeat 10", Block.CAT_CONTROL, "c");
            add("control_forever", "forever", Block.CAT_CONTROL, "c");
            add("control_if", "if <> then", Block.CAT_CONTROL, "c");
            add("control_ifelse", "if <> then else", Block.CAT_CONTROL, "c");
            add("control_waituntil", "wait until <>", Block.CAT_CONTROL);
            add("control_repeatuntil", "repeat until <>", Block.CAT_CONTROL, "c");
            add("control_stop", "stop all", Block.CAT_CONTROL);
            add("control_startclone", "create clone of myself", Block.CAT_CONTROL);
            add("control_deleteclone", "delete this clone", Block.CAT_CONTROL);
            add("control_whenclone", "when I start as a clone", Block.CAT_EVENTS, "hat");
            add("control_stopthis", "stop this script", Block.CAT_CONTROL);
            
            // ---- SENSING (10) ----
            add("sensing_touching", "touching mouse-pointer?", Block.CAT_SENSING, "boolean");
            add("sensing_touchingcolor", "touching color?", Block.CAT_SENSING, "boolean");
            add("sensing_coloristouching", "color is touching color?", Block.CAT_SENSING, "boolean");
            add("sensing_distance", "distance to mouse-pointer", Block.CAT_SENSING, "reporter");
            add("sensing_ask", "ask What's your name? and wait", Block.CAT_SENSING);
            add("sensing_answer", "answer", Block.CAT_SENSING, "reporter");
            add("sensing_keypressed", "key space pressed?", Block.CAT_SENSING, "boolean");
            add("sensing_mousedown", "mouse down?", Block.CAT_SENSING, "boolean");
            add("sensing_mousex", "mouse x", Block.CAT_SENSING, "reporter");
            add("sensing_mousey", "mouse y", Block.CAT_SENSING, "reporter");
            
            // ---- OPERATORS (14) ----
            add("operator_add", "+", Block.CAT_OPERATORS, "reporter");
            add("operator_subtract", "-", Block.CAT_OPERATORS, "reporter");
            add("operator_multiply", "*", Block.CAT_OPERATORS, "reporter");
            add("operator_divide", "/", Block.CAT_OPERATORS, "reporter");
            add("operator_random", "pick random 1 to 10", Block.CAT_OPERATORS, "reporter");
            add("operator_gt", ">", Block.CAT_OPERATORS, "boolean");
            add("operator_lt", "<", Block.CAT_OPERATORS, "boolean");
            add("operator_equals", "=", Block.CAT_OPERATORS, "boolean");
            add("operator_and", "and", Block.CAT_OPERATORS, "boolean");
            add("operator_or", "or", Block.CAT_OPERATORS, "boolean");
            add("operator_not", "not", Block.CAT_OPERATORS, "boolean");
            add("operator_join", "join apple banana", Block.CAT_OPERATORS, "reporter");
            add("operator_letterof", "letter 1 of apple", Block.CAT_OPERATORS, "reporter");
            add("operator_length", "length of apple", Block.CAT_OPERATORS, "reporter");
            
            // ---- VARIABLES (8) ----
            add("var_set", "set my variable to 0", Block.CAT_VARIABLES);
            add("var_change", "change my variable by 1", Block.CAT_VARIABLES);
            add("var_show", "show variable my variable", Block.CAT_VARIABLES);
            add("var_hide", "hide variable my variable", Block.CAT_VARIABLES);
            add("var_addtolist", "add thing to list", Block.CAT_VARIABLES);
            add("var_deleteoflist", "delete 1 of list", Block.CAT_VARIABLES);
            add("var_insertat", "insert thing at 1 of list", Block.CAT_VARIABLES);
            add("var_replace", "replace item 1 of list with thing", Block.CAT_VARIABLES);
        }
        
        private static function add(id:String, label:String, cat:String, type:String = "stack"):void {
            blocks.push(new Block(id, label, cat, type));
        }
        
        public static function getByCategory(cat:String):Array {
            var result:Array = [];
            for each (var b:Block in blocks) {
                if (b.category == cat) result.push(b);
            }
            return result;
        }
        
        public static function getById(id:String):Block {
            for each (var b:Block in blocks) {
                if (b.id == id) return b;
            }
            return null;
        }
        
        public static function getCategories():Array {
            return [
                Block.CAT_MOTION, Block.CAT_LOOKS, Block.CAT_SOUND,
                Block.CAT_EVENTS, Block.CAT_CONTROL, Block.CAT_SENSING,
                Block.CAT_OPERATORS, Block.CAT_VARIABLES
            ];
        }
    }
}