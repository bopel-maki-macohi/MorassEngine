package weeks.classes;

import songs.classes.Bopeebo;
import songs.classes.Fresh;

class Week1 extends WeekClass
{
	override public function new()
	{
		super('week1', ['bopeebo' => new Bopeebo(), 'fresh' => new Fresh(), 'dadbattle' => null,]);

		freeplayCharacters = ['dad'];
	}
}
