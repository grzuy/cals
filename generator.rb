require "icalendar"

CALENDAR_NAME = "cal-wc-2020-qualy"
HOURS_PER_DAY = 24
HOURS_PER_MATCH = (45 + 15 + 50)/60.0
DEFAULT_TZID = "America/Montevideo"
EMOJIS = {
  "ARG" => "🇦🇷",
  "BRA" => "🇧🇷",
  "BOL" => "🇧🇴",
  "CHI" => "🇨🇱",
  "COL" => "🇨🇴",
  "ECU" => "🇪🇨",
  "PAR" => "🇵🇾",
  "PER" => "🇵🇪",
  "URU" => "🇺🇾",
  "VEN" => "🇻🇪"
}

def define_timezone(calendar, id, offset)
  calendar.timezone do |t|
    t.tzid = id

    t.standard do |s|
      s.tzoffsetfrom = offset
      s.tzoffsetto = offset
      s.dtstart = "19701101T020000"
    end
  end
end

def define_match(calendar, team1, team2, year, month, day, hour, minute, tzid = DEFAULT_TZID)
  start_time = DateTime.new(year, month, day, hour, minute)

  calendar.event do |e|
    e.dtstart = start_time
    e.dtstart = Icalendar::Values::DateTime.new(start_time, "tzid" => tzid)
    e.dtend = Icalendar::Values::DateTime.new(start_time + HOURS_PER_MATCH/HOURS_PER_DAY.to_f, "tzid" => tzid)
    e.summary = "#{team1} #{EMOJIS[team1]} v #{EMOJIS[team2]} #{team2}"
  end
end

calendar = Icalendar::Calendar.new

define_timezone(calendar, DEFAULT_TZID, "-0300")

define_match(calendar, "PAR", "PER", 2020, 10, 8, 19, 30)
define_match(calendar, "URU", "CHI", 2020, 10, 8, 19, 45)
define_match(calendar, "ARG", "ECU", 2020, 10, 8, 21, 10)
define_match(calendar, "COL", "VEN", 2020, 10, 9, 20, 30)
define_match(calendar, "BRA", "BOL", 2020, 10, 9, 21, 30)

define_match(calendar, "BOL", "ARG", 2020, 10, 13, 17, 0)
define_match(calendar, "ECU", "URU", 2020, 10, 13, 18, 0)
define_match(calendar, "VEN", "PAR", 2020, 10, 13, 19, 0)
define_match(calendar, "CHI", "COL", 2020, 10, 13, 21, 30)
define_match(calendar, "PER", "BRA", 2020, 10, 13, 23, 15)

File.write("#{CALENDAR_NAME}.ics", calendar.to_ical)
