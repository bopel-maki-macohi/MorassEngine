package weeks;

import songs.SongClass;

class WeekClass
{
	public var week:String;

	public var songs:Map<String, SongClass>;

	public function new(week:String, songs:Map<String, SongClass>)
	{
		this.week = week;

		this.songs = songs;
	}
}
