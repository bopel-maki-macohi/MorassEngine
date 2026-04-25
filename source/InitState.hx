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
		WeekManager.addWeekFromClass(new Tutorial());
		WeekManager.addWeekFromClass(new Week1());
		WeekManager.addWeekFromClass(new Week2());
		WeekManager.addWeekFromClass(new Week3());
		WeekManager.addWeekFromClass(new Week4());
		WeekManager.addWeekFromClass(new Week5());
		WeekManager.addWeekFromClass(new Week6());
		WeekManager.addWeekFromClass(new Week7());
	}
}
