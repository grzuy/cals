require "./tournament_calendar"

DEFAULT_TZID = "UTC"

calendar = TournamentCalendar.new("Eliminatorias CONMEBOL")
calendar.define_timezone(DEFAULT_TZID, "-0300")

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

    stadium = info.at(".fi__info__stadium")&.text
    city = info.at(".fi__info__venue")&.text

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

    calendar.define_match(
      home_team,
      away_team,
      year.to_i,
      month.to_i,
      day.to_i,
      (time[0..1].to_i if time),
      (time[3..4].to_i if time),
      DEFAULT_TZID,
      stadium,
      city
    )
  end
end

File.write("cal-wc-2020-qualy.ics", calendar.to_ical)
