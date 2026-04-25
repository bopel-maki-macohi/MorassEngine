package songs.classes;

class Bopeebo extends SongClass
{
	override public function new()
	{
		super('bopeebo');
	}

	override function onBeatHit(beat:Int)
	{
		super.onBeatHit(beat);

		if (beat % 8 == 7)
			PlayState.instance.boyfriend.playAnim('hey', true);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		switch (PlayState.instance.curBeat)
		{
			case 128, 129, 130:
				PlayState.instance.vocals.volume = 0;
		}
	}
}
