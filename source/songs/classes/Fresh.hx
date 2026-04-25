package songs.classes;

class Fresh extends SongClass
{
	override public function new()
	{
		super('fresh');
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		switch (PlayState.instance.curBeat)
		{
			case 16:
				PlayState.instance.camZooming = true;
				PlayState.instance.gfSpeed = 2;
			case 48, 112:
				PlayState.instance.gfSpeed = 1;
			case 80:
				PlayState.instance.gfSpeed = 2;
		}
	}
}
