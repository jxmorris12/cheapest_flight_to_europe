#! /usr/bin/ruby
# -*- coding: utf-8 -*-
require_relative 'phantomjs_multi_destination_flight_search'


if( ARGV.length < 3 )
  puts "ruby cheapest_flight_to_north_america.rb START_AIRPORT_CODE START_DATE END_DATE"
else

  start_airport_code = ARGV[0]
  start_date = ARGV[1]
  end_date = ARGV[2]

  flight_search = MultiDestinationFlightSearch.new( start_airport_code, start_date, end_date )

  flight_search.add_destination("ATL","Atlanta","United States")
  flight_search.add_destination("ORD","Chicago","United States")
  flight_search.add_destination("LAX","Los Angeles","United States")
  flight_search.add_destination("DFW","Dallas","United States")
  flight_search.add_destination("DEN","Denver","United States")
  flight_search.add_destination("JFK","New York","United States")
  flight_search.add_destination("SFO","San Francisco","United States")
  flight_search.add_destination("LAS","Las Vegas","United States")
  flight_search.add_destination("PHX","Phoenix","United States")
  flight_search.add_destination("IAH","Houston","United States")
  flight_search.add_destination("CLT","Charlotte","United States")
  flight_search.add_destination("MIA","Miami","United States")
  flight_search.add_destination("MCO","Orlando","United States")
  flight_search.add_destination("EWR","Newark","United States")
  flight_search.add_destination("SEA","Seattle","United States")
  flight_search.add_destination("MSP","Minneapolis","United States")
  flight_search.add_destination("DTW","Detroit","United States")
  flight_search.add_destination("PHL","Philadelphia","United States")
  flight_search.add_destination("BOS","Boston","United States")
  flight_search.add_destination("LGA","New York","United States")
  flight_search.add_destination("FLL","Fort Lauderdale","United States")
  flight_search.add_destination("BWI","Baltimore","United States")
  flight_search.add_destination("IAD","Washington, DC","United States")
  flight_search.add_destination("SLC","Salt Lake City","United States")
  flight_search.add_destination("MDW","Chicago","United States")
  flight_search.add_destination("DCA","Washington, D.C.","United States")
  flight_search.add_destination("HNL","Honolulu","United States")
  flight_search.add_destination("ITO","Hilo","United States")
  flight_search.add_destination("KOA","Kona","United States")
  flight_search.add_destination("OGG","Maui","United States")
  flight_search.add_destination("LIH","Kauai","United States")
  flight_search.add_destination("SAN","San Diego","United States")
  flight_search.add_destination("TPA","Tampa","United States")
  flight_search.add_destination("PDX","Portland","United States")
  flight_search.add_destination("STL","St. Louis","United States")
  flight_search.add_destination("MCI","Kansas City","United States")
  flight_search.add_destination("HOU","Houston","United States")
  flight_search.add_destination("BNA","Nashville","United States")
  flight_search.add_destination("MKE","Milwaukee","United States")
  flight_search.add_destination("OAK","Oakland","United States")
  flight_search.add_destination("RDU","Raleigh","United States")
  flight_search.add_destination("AUS","Austin","United States")
  flight_search.add_destination("CLE","Cleveland","United States")
  flight_search.add_destination("SMF","Sacramento","United States")
  flight_search.add_destination("MEM","Memphis","United States")
  flight_search.add_destination("MSY","New Orleans","United States")
  flight_search.add_destination("SNA","Orange County","United States")
  flight_search.add_destination("SJC","San Jose","United States")
  flight_search.add_destination("PIT","Pittsburgh","United States")
  flight_search.add_destination("SAT","San Antonio","United States")
  flight_search.add_destination("SJU","San Juan","United States")
  flight_search.add_destination("DAL","Dallas","United States")
  flight_search.add_destination("RSW","Fort Myers","United States")
  flight_search.add_destination("IND","Indianapolis","United States")
  
  flight_search.add_destination("YYZ","Toronta","Canada")  
  flight_search.add_destination("YVR","Vancouver","Canada")  
  flight_search.add_destination("YUL","Montreal","Canada")  
  flight_search.add_destination("YYC","Calgary","Canada")  
  flight_search.add_destination("YEG","Edmonton","Canada")  
  flight_search.add_destination("YOW","Ottawa","Canada")  
  flight_search.add_destination("YHZ","Halifax","Canada")  
  flight_search.add_destination("YWG","Winnepeg","Canada")  
  flight_search.add_destination("YTZ","Toronto","Canada")  
  flight_search.add_destination("YYQ","Victoria","Canada")  
  flight_search.add_destination("YLW","Kelowna","Canada")  
  flight_search.add_destination("YYT","St. Johns","Canada")  
  flight_search.add_destination("YQB","Quebec City","Canada")  
  flight_search.add_destination("YXE","Saskatoon","Canada")  
  flight_search.add_destination("YQR","Regina","Canada")  

  flight_search.add_destination("MEX","Mexico City","Mexico")  
  flight_search.add_destination("CUN","Cancun","Mexico")  
  flight_search.add_destination("GDL","Guadalajara","Mexico")  
  flight_search.add_destination("MTY","Monterrey","Mexico")  
  flight_search.add_destination("TIJ","Tijuana","Mexico")  
  flight_search.add_destination("SJD","Cabo San Lucas","Mexico")  
  flight_search.add_destination("PVR","Puerto Vallarta","Mexico")  
  flight_search.add_destination("TLC","Mexico City","Mexico")  
  flight_search.add_destination("MID","Monterrey","Mexico")  
  flight_search.add_destination("HMO","Sonora","Mexico")  
  flight_search.add_destination("CUL","Culiacán","Mexico")  

  flight_search.add_destination("BDA","Bermuda","Bermuda")  
  flight_search.add_destination("PUJ","Punta Cana","Dominican Republic")  
  flight_search.add_destination("MBJ","Montego Bay","Jamaica")  
  flight_search.add_destination("SDQ","Santa Domingo","Dominican Republic")  
  flight_search.add_destination("POS","Santo Domingo","Trinidad and Tobago")  
  flight_search.add_destination("AUA","Aruba","Netherlands Antilles" )  
  flight_search.add_destination("BGI","Bridgetown","Barbados" )  
  flight_search.add_destination("PTP","Pointe-à-Pitre","Guadeloupe" )  
  flight_search.add_destination("FDF","Fort-de-France","Martinique" )  
  flight_search.add_destination("SXM","St. Maarten","Netherlands Antilles" )  
  flight_search.add_destination("KIN","Kingston","Jamaica" )  
  flight_search.add_destination("CUR","Curaçao","Netherlands Antilles" )  
  flight_search.add_destination("STT","St. Thomas","US Virgin Islands" )  
  flight_search.add_destination("GCM","Grand Cayman","Cayman Islands" )  
  flight_search.add_destination("STI","Santiago","Dominican Republic" )  
  flight_search.add_destination("POP","Puerto Plata","Dominican Republic" )  
  flight_search.add_destination("TAB","Scarborough","Trinidad and Tobago" )  
  flight_search.add_destination("UVF","Vieux Fort Quarter","Saint Lucia" )  
  flight_search.add_destination("BQN","Aguadilla","Puerto Rico" )  
  flight_search.add_destination("BON","Bonaire","Netherlands Antilles" )  
  flight_search.add_destination("STX","Saint Croix","US Virgin Islands" )  
  flight_search.add_destination("SKB","Saint Kitts","Saint Kitts and Nevis" )  
  flight_search.add_destination("EIS","Tortola","British Virgin Islands" )  
  flight_search.add_destination("SLU","Castries","Saint Lucia" )  
  flight_search.add_destination("LRM","La Romana","Dominican Republic" )  
  flight_search.add_destination("PSE","Ponce","Puerto Rico" )  
  flight_search.add_destination("VQS","Vieques","Puerto Rico" )  
  flight_search.add_destination("AZS","Samaná","Dominican Republic" )  

  
  
  flight_search.print_cheapest_flights
  
  
end

