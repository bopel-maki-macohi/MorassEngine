package songs.classes;

class Week6SongClass extends SongClass
{
	override function onCountdownPreStart():Bool
	{
		if (PlayState.isStoryMode && !PlayState.seenCutscene)
		{
			var dialogue:Array<String> = [];

			switch (song)
			{
				case 'senpai':
					dialogue = CoolUtil.coolTextFile(Paths.txt('senpai/senpaiDialogue'));
				case 'roses':
					dialogue = CoolUtil.coolTextFile(Paths.txt('roses/rosesDialogue'));
				case 'thorns':
					dialogue = CoolUtil.coolTextFile(Paths.txt('thorns/thornsDialogue'));
			}

			var doof:DialogueBox = new DialogueBox(false, dialogue);
			doof.scrollFactor.set();
			doof.finishThing = PlayState.instance.startCountdown;
			doof.cameras = [PlayState.instance.camHUD];

			PlayState.instance.schoolIntro(doof);
			return false;
		}

		return true;
	}
}
