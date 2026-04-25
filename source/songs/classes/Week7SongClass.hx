package songs.classes;

class Week7SongClass extends SongClass
{
	override function onCountdownPreStart():Bool
	{
		if (PlayState.isStoryMode && !PlayState.seenCutscene)
		{
			PlayState.instance.beginVidCutscene(Paths.file('music/${song.toLowerCase()}Cutscene.mp4'));
			return false;
		}

		return true;
	}
}
