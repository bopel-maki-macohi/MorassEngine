package weeks.classes;

import songs.classes.Week6SongClass;

class Week6 extends WeekClass
{
	override public function new()
	{
		super('week6', [
			'senpai' => new Week6SongClass('senpai'),
			'roses' => new Week6SongClass('roses'),
			'thorns' => new Week6SongClass('thorns'),
		]);

		freeplayCharacters = ['senpai', 'senpai', 'spirit'];
	}
}
