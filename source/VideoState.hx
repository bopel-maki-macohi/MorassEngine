package;

import flixel.FlxG;

class VideoState extends MusicBeatState
{
	var video:FlxVideo;

	public static var seenVideo:Bool = false;

	override function create()
	{
		super.create();

		seenVideo = true;

		FlxG.save.data.seenVideo = true;
		FlxG.save.flush();

		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();

		video = new FlxVideo();
		video.play(Paths.mp4('kickstarterTrailer'));
		add(video);

		video.finishCallback.add(finishVid);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			video.finishVideo();
		}

		super.update(elapsed);
	}

	function finishVid():Void
	{
		TitleState.initialized = false;
		FlxG.switchState(() -> new TitleState());
	}
}
