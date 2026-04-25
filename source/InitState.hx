import songs.SongClass;
import weeks.WeekClass;
import songs.SongManager;
import songs.classes.*;
import weeks.WeekManager;
import ui.PreferencesMenu;
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

		if (FlxG.save.data.seenVideo != null)
			VideoState.seenVideo = FlxG.save.data.seenVideo;

		initDiscordRPC();

		initWeekClasses();

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

	function initWeekClasses()
	{
		var weeks:Map<String, Map<String, SongClass>> = [
			'tutorial' => ['tutorial' => null,],
			'week1' => ['bopeebo' => new Bopeebo(), 'fresh' => new Fresh(), 'dadbattle' => null,],
			'week2' => ['spookeez' => null, 'south' => null, 'monster' => null,],
			'week3' => ['pico' => null, 'philly' => null, 'blammed' => null,],
			'week4' => ['satin-panties' => null, 'high' => null, 'milf' => new MILF(),],
			'week5' => [
				'cocoa' => null,
				'eggnog' => null,
				'winter-horrorland' => new WinterHorrorland(),
			],
			'week6' => [
				'senpai' => new Week6SongClass('senpai'),
				'roses' => new Week6SongClass('roses'),
				'thorns' => new Week6SongClass('thorns'),
			],
			'week7' => [
				'ugh' => new Week7SongClass('ugh'),
				'guns' => new Week7SongClass('guns'),
				'stress' => new Week7SongClass('stress'),
			],
		];

		for (weekName => weekSongs in weeks)
		{
			WeekManager.addWeekFromClass(new WeekClass(weekName, weekSongs));
		}
	}
}
