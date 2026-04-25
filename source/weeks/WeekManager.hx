package weeks;

class WeekManager
{
	public static var weekClasses:Map<String, WeekClass> = [];

	public static function addWeek(week:String, weekClass:WeekClass)
	{
		weekClasses.set(week.toLowerCase(), weekClass);
	}

	public static function addWeekFromClass(weekClass:WeekClass)
	{
		weekClasses.set(weekClass.week.toLowerCase(), weekClass);
	}

	public static function getWeek(week:String):WeekClass
	{
		if (!weekClasses.exists(week.toLowerCase()))
			return null;

		return weekClasses.get(week.toLowerCase());
	}
}
