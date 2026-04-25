package weeks;

class WeekManager
{
	public static var preferedWeekOrder:Array<String> = [];

	public static function sortByOrderPreference(a:WeekClass, b:WeekClass):Int
	{
		if (a.week == b.week)
			return 0;
		if (preferedWeekOrder.contains(a.week) && preferedWeekOrder.contains(b.week))
		{
			// Sort by index in preferedWeekOrder
			return preferedWeekOrder.indexOf(a.week) - preferedWeekOrder.indexOf(b.week);
		};

		if (preferedWeekOrder.contains(a.week))
			return -1;

		if (preferedWeekOrder.contains(b.week))
			return 1;

		// i think this one sends it to the end? idk
		return -1;
	}

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
