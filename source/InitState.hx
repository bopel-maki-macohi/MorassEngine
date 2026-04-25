import ui.PreferencesMenu;
import songs.classes.*;
import songs.SongManager;
import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		FlxG.game.focusLostFramerate = 60;

		FlxG.sound.muteKeys = [ZERO];

		// DEBUG BULLSHIT

		FlxG.save.bind('Morass', 'Maki');
		PreferencesMenu.initPrefs();
		PlayerSettings.init();
		Highscore.load();

		if (FlxG.save.data.weekUnlocked != null)
		{
			// FIX LATER!!!
			// WEEK UNLOCK PROGRESSION!!
			// StoryMenuState.weekUnlocked = FlxG.save.data.weekUnlocked;

			if (StoryMenuState.weekUnlocked.length < 4)
				StoryMenuState.weekUnlocked.insert(0, true);

			// QUICK PATCH OOPS!
			if (!StoryMenuState.weekUnlocked[0])
				StoryMenuState.weekUnlocked[0] = true;
		}

		if (FlxG.save.data.seenVideo != null)
		{
			VideoState.seenVideo = FlxG.save.data.seenVideo;
		}

		initDiscordRPC();

		initSongClasses();

		#if FREEPLAY
		FlxG.switchState(() -> new FreeplayState());
		#elseif ANIMATE
		FlxG.switchState(() -> new CutsceneAnimTestState());
		#elseif CHARTING
		FlxG.switchState(() -> new ChartingState());
		#else
		FlxG.switchState(() -> new TitleState());
		#end
	}

	function initDiscordRPC()
	{
		#if discord_rpc
		DiscordClient.initialize();

		Application.current.onExit.add(function(exitCode)
		{
			DiscordClient.shutdown();
		});
		#end
	}

	function initSongClasses()
	{
		SongManager.addSongFromClass(new Bopeebo());
		SongManager.addSongFromClass(new Fresh());

		SongManager.addSongFromClass(new MILF());

		SongManager.addSongFromClass(new WinterHorrorland());

		SongManager.addSongFromClass(new Week6SongClass('senpai'));
		SongManager.addSongFromClass(new Week6SongClass('roses'));
		SongManager.addSongFromClass(new Week6SongClass('thorns'));

		SongManager.addSongFromClass(new Week7SongClass('ugh'));
		SongManager.addSongFromClass(new Week7SongClass('guns'));
		SongManager.addSongFromClass(new Week7SongClass('stress'));
	}
}
