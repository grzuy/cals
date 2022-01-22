require "./tournament_calendar"

URY_TZID = "America/Montevideo"

default_venues = {
  PAR: ["Estadio Defensores del Chaco", "Asunción"],
  URU: ["Estadio Centenario", "Montevideo"],
  ARG: ["Estadio La Bombonera", "Buenos Aires"],
  PER: ["Estadio Nacional", "Lima"],
  CHI: ["Estadio Nacional", "Santiago de Chile"],
  BOL: ["Estadio Hernando Siles", "La Paz"],
  ECU: ["Estadio Rodrigo Paz Delgado", "Quito"],
  VEN: ["Estadio Olímpico de la UCV", "Caracas"],
  COL: ["Estadio Metropolitano Roberto Meléndez", "Barranquilla"]
}

calendar = TournamentCalendar.new("Eliminatorias CONMEBOL")

calendar.define_match("PAR", "PER", 2020, 10, 8, 19, 30, URY_TZID, *default_venues[:PAR])
calendar.define_match("URU", "CHI", 2020, 10, 8, 19, 45, URY_TZID, *default_venues[:URU])
calendar.define_match("ARG", "ECU", 2020, 10, 8, 21, 30, URY_TZID, *default_venues[:ARG])
calendar.define_match("COL", "VEN", 2020, 10, 9, 20, 30, URY_TZID, *default_venues[:COL])
calendar.define_match("BRA", "BOL", 2020, 10, 9, 21, 30, URY_TZID, "Arena Corinthians", "São Paulo")

calendar.define_match("BOL", "ARG", 2020, 10, 13, 17, 00, URY_TZID, *default_venues[:BOL])
calendar.define_match("ECU", "URU", 2020, 10, 13, 18, 00, URY_TZID, *default_venues[:ECU])
calendar.define_match("VEN", "PAR", 2020, 10, 13, 19, 00, URY_TZID, "Estadio Metropolitano de Mérida", "Mérida")
calendar.define_match("PER", "BRA", 2020, 10, 13, 21, 00, URY_TZID, *default_venues[:PER])
calendar.define_match("CHI", "COL", 2020, 10, 13, 21, 30, URY_TZID, *default_venues[:CHI])

calendar.define_match("BOL", "ECU", 2020, 11, 12, 17, 00, URY_TZID, *default_venues[:BOL])
calendar.define_match("ARG", "PAR", 2020, 11, 12, 21, 00, URY_TZID, *default_venues[:ARG])
calendar.define_match("COL", "URU", 2020, 11, 13, 17, 30, URY_TZID, *default_venues[:COL])
calendar.define_match("CHI", "PER", 2020, 11, 13, 20, 00, URY_TZID, *default_venues[:CHI])
calendar.define_match("BRA", "VEN", 2020, 11, 13, 21, 30, URY_TZID, "Estadio Morumbi", "São Paulo")

calendar.define_match("ECU", "COL", 2020, 11, 17, 18, 00, URY_TZID, *default_venues[:ECU])
calendar.define_match("VEN", "CHI", 2020, 11, 17, 18, 00, URY_TZID, *default_venues[:VEN])
calendar.define_match("URU", "BRA", 2020, 11, 17, 20, 00, URY_TZID, *default_venues[:URU])
calendar.define_match("PAR", "BOL", 2020, 11, 17, 20, 00, URY_TZID, *default_venues[:PAR])
calendar.define_match("PER", "ARG", 2020, 11, 17, 21, 30, URY_TZID, *default_venues[:PER])

calendar.define_match("BOL", "VEN", 2021, 6, 3, 17, 00, URY_TZID, *default_venues[:BOL])
calendar.define_match("URU", "PAR", 2021, 6, 3, 19, 00, URY_TZID, *default_venues[:URU])
calendar.define_match("ARG", "CHI", 2021, 6, 3, 21, 00, URY_TZID, "Estadio Único Madre de Ciudades", "Santiago del Estero")
calendar.define_match("PER", "COL", 2021, 6, 3, 23, 00, URY_TZID, *default_venues[:PER])
calendar.define_match("BRA", "ECU", 2021, 6, 4, 21, 30, URY_TZID, "Estadio Beira-Rio", "Porto Alegre")

calendar.define_match("ECU", "PER", 2021, 6, 8, 18, 00, URY_TZID, *default_venues[:ECU])
calendar.define_match("VEN", "URU", 2021, 6, 8, 19, 30, URY_TZID, *default_venues[:VEN])
calendar.define_match("COL", "ARG", 2021, 6, 8, 20, 00, URY_TZID, *default_venues[:COL])
calendar.define_match("PAR", "BRA", 2021, 6, 8, 21, 30, URY_TZID, *default_venues[:PAR])
calendar.define_match("CHI", "BOL", 2021, 6, 8, 22, 30, URY_TZID, "Estadio San Carlos de Apoquindo", "Santiago de Chile")

calendar.define_match("BOL", "COL", 2021, 9, 2, 17, 00, URY_TZID, *default_venues[:BOL])
calendar.define_match("ECU", "PAR", 2021, 9, 2, 18, 00, URY_TZID, *default_venues[:ECU])
calendar.define_match("VEN", "ARG", 2021, 9, 2, 21, 00, URY_TZID, *default_venues[:VEN])
calendar.define_match("PER", "URU", 2021, 9, 2, 22, 00, URY_TZID, *default_venues[:PER])
calendar.define_match("CHI", "BRA", 2021, 9, 2, 22, 00, URY_TZID, "Estadio Monumental David Arellano", "Santiago de Chile")

calendar.define_match("BRA", "ARG", 2021, 9, 5, 16, 00, URY_TZID, "Arena Corinthians", "São Paulo")
calendar.define_match("ECU", "CHI", 2021, 9, 5, 18, 00, URY_TZID, *default_venues[:ECU])
calendar.define_match("PAR", "COL", 2021, 9, 5, 19, 00, URY_TZID, *default_venues[:PAR])
calendar.define_match("URU", "BOL", 2021, 9, 5, 19, 00, URY_TZID, "Estadio Campeón del Siglo", "Montevideo")
calendar.define_match("PER", "VEN", 2021, 9, 5, 22, 00, URY_TZID, *default_venues[:PER])

calendar.define_match("PAR", "VEN", 2021, 9, 9, 19, 30, URY_TZID, *default_venues[:PAR])
calendar.define_match("URU", "ECU", 2021, 9, 9, 19, 30, URY_TZID, "Estadio Campeón del Siglo", "Montevideo")
calendar.define_match("COL", "CHI", 2021, 9, 9, 20, 00, URY_TZID, *default_venues[:COL])
calendar.define_match("ARG", "BOL", 2021, 9, 9, 20, 30, URY_TZID, "Estadio Monumental de Nuñez", "Buenos Aires")
calendar.define_match("BRA", "PER", 2021, 9, 9, 21, 30, URY_TZID, "Arena Pernambuco", "Recife")

calendar.define_match("URU", "COL", 2021, 10, 7, 20, 00, URY_TZID, "Gran Parque Central", "Montevideo")
calendar.define_match("PAR", "ARG", 2021, 10, 7, 20, 00, URY_TZID, *default_venues[:PAR])
calendar.define_match("VEN", "BRA", 2021, 10, 7, 20, 30, URY_TZID, *default_venues[:VEN])
calendar.define_match("ECU", "BOL", 2021, 10, 7, 21, 30, URY_TZID, "Estadio Monumental Isidro Romero Carbo", "Guayaquil")
calendar.define_match("PER", "CHI", 2021, 10, 7, 22, 00, URY_TZID, *default_venues[:PER])

calendar.define_match("BOL", "PER", 2021, 10, 10, 17, 00, URY_TZID, *default_venues[:BOL])
calendar.define_match("VEN", "ECU", 2021, 10, 10, 17, 30, URY_TZID, *default_venues[:VEN])
calendar.define_match("COL", "BRA", 2021, 10, 10, 18, 00, URY_TZID, *default_venues[:COL])
calendar.define_match("ARG", "URU", 2021, 10, 10, 20, 30, URY_TZID, "Estadio Monumental de Nuñez", "Buenos Aires")
calendar.define_match("CHI", "PAR", 2021, 10, 10, 21, 00, URY_TZID, "Estadio Monumental David Arellano", "Santiago de Chile")

calendar.define_match("BOL", "PAR", 2021, 10, 14, 17, 00, URY_TZID, *default_venues[:BOL])
calendar.define_match("COL", "ECU", 2021, 10, 14, 18, 00, URY_TZID, *default_venues[:COL])
calendar.define_match("ARG", "PER", 2021, 10, 14, 20, 30, URY_TZID, "Estadio Monumental de Nuñez", "Buenos Aires")
calendar.define_match("CHI", "VEN", 2021, 10, 14, 21, 00, URY_TZID, "Estadio Monumental David Arellano", "Santiago de Chile")
calendar.define_match("BRA", "URU", 2021, 10, 14, 21, 30, URY_TZID, "Arena da Amazônia", "Manaus")

calendar.define_match("ECU", "VEN", 2021, 11, 11, 18, 00, URY_TZID, *default_venues[:ECU])
calendar.define_match("PAR", "CHI", 2021, 11, 11, 20, 00, URY_TZID, *default_venues[:PAR])
calendar.define_match("BRA", "COL", 2021, 11, 11, 21, 30, URY_TZID, "Arena Corinthians", "São Paulo")
calendar.define_match("PER", "BOL", 2021, 11, 11, 23, 00, URY_TZID, *default_venues[:PER])
calendar.define_match("URU", "ARG", 2021, 11, 12, 20, 00, URY_TZID, "Estadio Campeón del Siglo", "Montevideo")

calendar.define_match("BOL", "URU", 2021, 11, 16, 17, 00, URY_TZID, *default_venues[:BOL])
calendar.define_match("VEN", "PER", 2021, 11, 16, 18, 00, URY_TZID, *default_venues[:VEN])
calendar.define_match("COL", "PAR", 2021, 11, 16, 20, 00, URY_TZID, *default_venues[:COL])
calendar.define_match("ARG", "BRA", 2021, 11, 16, 20, 30, URY_TZID, "Estadio del Bicentenario", "San Juan")
calendar.define_match("CHI", "ECU", 2021, 11, 16, 21, 15, URY_TZID, "Estadio San Carlos de Apoquindo", "Santiago de Chile")

calendar.define_match("ECU", "BRA", 2022, 1, 27, 18, 00, URY_TZID, *default_venues[:ECU])
calendar.define_match("PAR", "URU", 2022, 1, 27, 20, 00, URY_TZID, "Estadio General Pablo Rojas", "Asunción")
calendar.define_match("CHI", "ARG", 2022, 1, 27, 21, 15, URY_TZID, "Estadio Zorros del Desierto", "Calama")
calendar.define_match("COL", "PER", 2022, 1, 28, 18, 00, URY_TZID, *default_venues[:COL])
calendar.define_match("VEN", "BOL", 2022, 1, 28, 19, 00, URY_TZID, "Estadio Agustín Tovar", "Barinas")

calendar.define_match("BOL", "CHI", 2022, 2, 1, 17, 00, URY_TZID, *default_venues[:BOL])
calendar.define_match("URU", "VEN", 2022, 2, 1, 20, 00, URY_TZID, *default_venues[:URU])
calendar.define_match("ARG", "COL", 2022, 2, 1, 20, 30, URY_TZID, "Estadio Mario Alberto Kempes", "Córdoba")
calendar.define_match("BRA", "PAR", 2022, 2, 1, 21, 30, URY_TZID, "Mineirão", "Belo Horizonte")
calendar.define_match("PER", "ECU", 2022, 2, 1, 23, 00, URY_TZID, *default_venues[:PER])

calendar.define_match("URU", "PER", 2022, 3, 23)
calendar.define_match("COL", "BOL", 2022, 3, 23)
calendar.define_match("BRA", "CHI", 2022, 3, 23)
calendar.define_match("PAR", "ECU", 2022, 3, 23)
calendar.define_match("ARG", "VEN", 2022, 3, 23)

calendar.define_match("PER", "PAR", 2022, 3, 28)
calendar.define_match("VEN", "COL", 2022, 3, 28)
calendar.define_match("BOL", "BRA", 2022, 3, 28)
calendar.define_match("CHI", "URU", 2022, 3, 28)
calendar.define_match("ECU", "ARG", 2022, 3, 28)

File.write("cal-wc-2020-qualy.ics", calendar.to_ical)
