package weeks.classes;

import songs.classes.WinterHorrorland;

class Week5 extends WeekClass
{
	override public function new()
	{
		super('week5', [
			'cocoa' => null,
			'eggnog' => null,
			'winter-horrorland' => new WinterHorrorland(),
		]);
	}
}
