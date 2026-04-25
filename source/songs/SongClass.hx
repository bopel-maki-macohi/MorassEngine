package songs;

class SongClass
{
	public var song:String;

	public function new(song:String)
	{
		this.song = song;
	}

	public function update(elapsed:Float) {}

	public function onStepHit(step:Int) {}

	public function onBeatHit(beat:Int) {}

	/**
	 * @return Should the countdown begin
	 */
	public function onCountdownPreStart():Bool
	{
		return true;
	}

	public function onCountdownStep(step:Int) {}
}
