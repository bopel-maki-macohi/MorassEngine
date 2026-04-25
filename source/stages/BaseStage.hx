package stages;

import flixel.group.FlxSpriteGroup;

class BaseStage
{
    public var stage:String;

	public var backLayer:FlxSpriteGroup;
	public var frontLayer:FlxSpriteGroup;

	public function new(stage:String)
	{
        this.stage = stage;

        backLayer = new FlxSpriteGroup();
        frontLayer = new FlxSpriteGroup();
	}
}
