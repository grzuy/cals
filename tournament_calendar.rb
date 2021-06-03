require "icalendar"

class TournamentCalendar
  HOURS_PER_DAY = 24
  HOURS_PER_MATCH = (45 + 15 + 50)/60.0
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

  def initialize(name)
    @name = name
  end

  def define_timezone(id, offset)
    calendar.timezone do |t|
      t.tzid = id

      t.standard do |s|
        s.tzoffsetfrom = offset
        s.tzoffsetto = offset
        s.dtstart = "19701101T020000"
      end
    end
  end

  def define_match(
    team1,
    team2,
    year,
    month,
    day,
    hour = nil,
    minute = nil,
    tzid = DEFAULT_TZID,
    stadium = nil,
    city = nil
  )
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
      e.location = [stadium, city].compact.join(", ")
    end
  end

  def to_ical
    calendar.to_ical
  end

  private

  attr_reader :name

  def calendar
    @calendar ||=
      begin
        cal = Icalendar::Calendar.new
        cal.append_custom_property("X-WR-CALNAME", name)

        cal
      end
  end
end
