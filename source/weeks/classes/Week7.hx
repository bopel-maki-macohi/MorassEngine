package weeks.classes;

import songs.classes.Week7SongClass;

class Week7 extends WeekClass
{
	override public function new()
	{
		super('week7', [
			'ugh' => new Week7SongClass('ugh'),
			'guns' => new Week7SongClass('guns'),
			'stress' => new Week7SongClass('stress'),
		]);
	}
}
