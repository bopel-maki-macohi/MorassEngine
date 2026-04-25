package songs.classes;

import flixel.FlxG;
import ui.PreferencesMenu;

class MILF extends SongClass
{
	override public function new()
	{
		super('milf');
	}

	override function onBeatHit(beat:Int)
	{
		super.onBeatHit(beat);

		if (PreferencesMenu.getPref('camera-zoom'))
			if (beat >= 168 && beat < 200 && PlayState.instance.camZooming && FlxG.camera.zoom < 1.35)
			{
				FlxG.camera.zoom += 0.015;
				PlayState.instance.camHUD.zoom += 0.03;
			}
	}
}
