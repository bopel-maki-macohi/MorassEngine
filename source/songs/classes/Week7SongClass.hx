package songs.classes;

class Week7SongClass extends SongClass
{
	override function onCountdownPreStart():Bool
	{
		if (PlayState.isStoryMode && !PlayState.seenCutscene)
		{
			PlayState.instance.beginVidCutscene(Paths.mp4('${song.toLowerCase()}Cutscene'));
			return false;
		}

		return true;
	}
}
