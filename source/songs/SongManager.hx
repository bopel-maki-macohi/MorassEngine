package songs;

class SongManager
{
	public static var CURRENT_SONGCLASS:SongClass = null;

	public static var songClasses:Map<String, SongClass> = [];

	public static function addSong(song:String, songClass:SongClass)
	{
		songClasses.set(song, songClass);
	}

	public static function getSong(song:String):SongClass
	{
		if (!songClasses.exists(song))
			return null;

		return songClasses.get(song);
	}
}
