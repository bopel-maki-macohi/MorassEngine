package weeks;

import songs.SongClass;

class WeekClass
{
	public var week:String;

	public var songs:Map<String, SongClass>;

	public var freeplayCharacters:Array<String> = [];
	public var freeplayOnly:Bool = false;

	public var storymenuCharacters:Array<String> = [];
	public var storymenuHeader:String = '';

	public function new(week:String, songs:Map<String, SongClass>)
	{
		this.week = week;

		this.songs = songs;
	}
}
