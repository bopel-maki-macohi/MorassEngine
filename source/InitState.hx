import weeks.classes.*;
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
		WeekManager.preferedWeekOrder = [
			'week1',
		];

		WeekManager.addWeekFromClass(new Week1());
	}
}
