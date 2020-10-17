require "icalendar"

CALENDAR_NAME = "cal-wc-2020-qualy"
HOURS_PER_DAY = 24
HOURS_PER_MATCH = (45 + 15 + 50)/60.0
DEFAULT_TZID = "UTC"
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

def define_calendar(name)
  cal = Icalendar::Calendar.new
  cal.append_custom_property("X-WR-CALNAME", name)

  cal
end

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

def define_match(calendar, team1, team2, year, month, day, hour = nil, minute = nil, tzid = DEFAULT_TZID)
  if hour && minute
    start_time = DateTime.new(year, month, day, hour, minute)
  else
    start_date = Date.new(year, month, day)
  end

  calendar.event do |e|
    if start_date
      e.dtstart = Icalendar::Values::Date.new(start_date)
      e.dtend = Icalendar::Values::Date.new(start_date)
    elsif start_time
      e.dtstart = Icalendar::Values::DateTime.new(start_time, "tzid" => tzid)
      e.dtend = Icalendar::Values::DateTime.new(start_time + HOURS_PER_MATCH/HOURS_PER_DAY.to_f, "tzid" => tzid)
    end

    e.summary = "#{team1} #{EMOJIS[team1]} v #{EMOJIS[team2]} #{team2}"
  end
end

calendar = define_calendar("Eliminatorias CONMEBOL")

define_timezone(calendar, DEFAULT_TZID, "-0300")

require "nokogiri"
require "httparty"

MATCHES_URL = "https://www.fifa.com/worldcup/preliminaries/_libraries/season/282735/stage/282737/_matchlist"

doc = Nokogiri::HTML(HTTParty.get(MATCHES_URL))

doc.css(".fi-mu-list").each do |match_group|
  match_group_date = match_group.get_attribute("data-matchesdate")
  year = match_group_date[0..3]

  match_group.css(".fi-mu").each do |match|
    info = match.at(".fi-mu__info")
    m = match.at(".fi-mu__m")

    home_team = m.at(".home .fi-t__nTri").text
    away_team = m.at(".away .fi-t__nTri").text

    score = match.at(".fi-s__score")
    daymonth = score.get_attribute("data-daymonthutc")

    if daymonth
      month = daymonth[2..3]
      day = daymonth[0..1]
      time = score.get_attribute("data-timeutc")
    else
      month = match_group_date[4..5]
      day = match_group_date[6..7]
    end

    define_match(
      calendar,
      home_team,
      away_team,
      year.to_i,
      month.to_i,
      day.to_i,
      (time[0..1].to_i if time),
      (time[3..4].to_i if time)
    )
  end
end

File.write("#{CALENDAR_NAME}.ics", calendar.to_ical)
