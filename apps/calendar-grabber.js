var url = "http://www.consultant.ru/law/ref/calendar/proizvodstvennye/2019/";
function by_tag( node, tags )
{
	if( !Array.isArray( tags ) )
		tags = [ tags ];
		
	var res = node;
	var i;
	for( i = 0; i != tags.length; ++i )
	{
		if( i != 0 )
			res = res[ 0 ];
		res = res.getElementsByTagName( tags[ i ] );
	}
	return res; 
}
function by_class( node, class_name )
{
	return node.getElementsByClassName( class_name );
}
function includes( str, substr ) { return str.indexOf( substr ) != -1; }

function Calendar( year )
{
	this.year = year;
	
// 	this.day_of_week_to_index = -1;
// 	this.month_to_index = -1;
// 	this.day_of_year_to_index = -1;
// 	this.day_of_month_to_index = -1;
	this.days_of_week =
	[
		new DayOfWeek( 1, "понедельник", "пн", false ),
		new DayOfWeek( 2, "вторник",     "вт", false ),
		new DayOfWeek( 3, "среда",       "ср", false ),
		new DayOfWeek( 4, "четверг",     "чт", false ),
		new DayOfWeek( 5, "пятница",     "пт", false ),
		new DayOfWeek( 6, "суббота",     "сб", true  ),
		new DayOfWeek( 7, "воскресенье", "вс", true  )
	];
	this.months =
	[
		new Month( 1, "январь"   ),
		new Month( 1, "февраль"  ),
		new Month( 1, "март",    ),
		new Month( 1, "апрель",  ),
		new Month( 1, "май",     ),
		new Month( 1, "июнь",    ),
		new Month( 1, "июль",    ),
		new Month( 1, "август"   ),
		new Month( 1, "сентябрь" ),
		new Month( 1, "октябрь"  ),
		new Month( 1, "ноябрь"   ),
		new Month( 1, "декабрь"  )
	];
	this.days = new Array();
	return this;
}

function Month( id, name )
{
	this.id = month_no;
	this.name = name;
	return this;
}
Month.prototype.get_genitive_case = function()
{
	var base_length = this.name.length - 1;
	var last_letter = this.name.substr( base_length );
	if( ( last_letter == "ь" ) || ( last_letter == "й" ) )
		return this.name.substr( 0, base_length ) + "я";
	return this.name + "а";
}

function DayOfWeek( day_no, full_name, abbrev, is_weekend )
{
	this.day_no     = day_no;
	this.full_name  = full_name;
	this.abbrev     = abbrev;
	this.is_weekend = is_weekend;
	return this;
}
function Day( calendar, month, day_no, day_of_week, is_weekend, is_holiday, is_preholiday )
{
	this.calendar = calendar;
	this.month = month;
	this.day_no = day_no;
	this.day_of_week = day_of_week;
	this.is_holiday = is_holiday;
	this.is_preholiday = is_preholiday;
	this.is_weekend = is_weekend;
	return this;
}

var year = by_tag( by_class( document, "list-year" )[0], [ "li", "b" ] )[0].innerText;

var months = by_class( document, "cal" );
var i;
var month_no = 1;
var day_no = 1;



for( i = 0; i != months.length; ++i )
{
	var month = by_tag( months[i], [ "thead", "tr", "th" ] )[0].innerText;
	//console.log( "MONTH[ " + month_no + " ]: " + month );
	var weeks = by_tag( months[i], [ "tbody", "tr" ] );
	var j;
	for( j = 0; j != weeks.length; ++j )
	{
		var days = by_tag( weeks[j], "td" );
		var day_of_week_no = 1;
		var k;
		for( k = 0; k != days.length; ++k )
		{
			var type = days[k].className;
			if( type == "inactively" )
				continue;
			var weekend    = includes( type, "weekend" );
			var holiday    = includes( type, "holiday" );
			var preholiday = includes( type, "preholiday" );
			console.log( "YEAR:" + year + ", MONTH:" + month_no + ", DAY:" + day_no + ", DWEEK:" + day_of_week_no + ": " + month + ", " + days[k].innerHTML + " : " + type );
			++day_no;
			++day_of_week_no;
		}
	}
	++month_no;
}
