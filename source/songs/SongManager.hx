package songs;

class SongManager
{
	static var songClasses:Map<String, SongClass> = [];

	public static function addSong(song:String, songClass:SongClass)
	{
		songClasses.set(song.toLowerCase(), songClass);
	}

	public static function addSongFromClass(songClass:SongClass)
	{
		songClasses.set(songClass.song.toLowerCase(), songClass);
	}

	public static function getSong(song:String):SongClass
	{
		if (!songClasses.exists(song.toLowerCase()))
			return null;

		return songClasses.get(song.toLowerCase());
	}
}
