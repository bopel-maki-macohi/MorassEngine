package weeks.classes;

class TestWeek extends WeekClass
{
	override public function new()
	{
		super('test', ['test' => null,]);

		freeplayCharacters = ['bf-pixel'];
		freeplayOnly = true;
	}
}
