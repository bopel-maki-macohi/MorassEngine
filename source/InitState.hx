import songs.classes.*;
import songs.SongManager;
import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		initSongClasses();

		FlxG.switchState(() -> new TitleState());
	}

	function initSongClasses()
	{
		SongManager.addSongFromClass(new Bopeebo());
		SongManager.addSongFromClass(new Fresh());
        
		SongManager.addSongFromClass(new MILF());

		SongManager.addSongFromClass(new Week7SongClass('ugh'));
		SongManager.addSongFromClass(new Week7SongClass('guns'));
		SongManager.addSongFromClass(new Week7SongClass('stress'));
	}
}
