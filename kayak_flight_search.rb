require 'net/http'
require 'rexml/document' 
require 'uri'

class KayakFlightSearch

  def initialize( token,
                  oneway,
                  origin,
                  destination,
                  dep_date,
                  ret_date,
                  travelers)
    @hostname = 'api.kayak.com'
    @port = 80
    @token = token
    @oneway = oneway
    @origin = origin
    @destination = destination
    @dep_date = dep_date
    @ret_date = ret_date
    @travelers = travelers
    @lastcount = nil
    @results = []
    @resulting_xml = ""
  end

  def cheapest_flight
    sorted_results = @results.sort { |a,b| a.first <=> b.first }
    sorted_results.first
  end
  
  def getsession
    if @sid == nil
      Net::HTTP.start(@hostname, @port) do |http|
        response = http.get("/k/ident/apisession?token=#{@token}")
        body = response.body
        xml = REXML::Document.new(body)
        @sid = xml.elements['//sid'].text
      end
    end
    
    return @sid
  end

  def flight_search( load_all = true )
    url = "/s/apisearch?basicmode=true&oneway=n&origin=#{@origin}&destination=#{@destination}&destcode=&depart_date=#{@dep_date}&depart_time=a&return_date=#{@ret_date}&return_time=a&travelers=#{@travelers}&cabin=#{get_cabin}&action=doflights&apimode=1&_sid_=#{getsession}"
    
    start_search(url)
    wait_for_results( load_all )

    self
  end

  def wait_for_results( load_all = true)
    sleep(2)

    # now poll results (only gets "top 10" each time)
    more = poll_results( nil )
    if( load_all || @lastcount < 1)
      while more == 'true' do
        more = poll_results( nil)
        sleep(3)
      end

      # one last one to get the final results
      poll_results
    end    
  end
  
  def get_cabin
    "e"
  end

  def start_search(url)
    @searchid = nil
    Net::HTTP.start(@hostname, @port) do |http|
      response = http.get(url)
      body = response.body
      xml = REXML::Document.new(body)
      @searchid = xml.elements['//searchid']
      if @searchid 
        @searchid = @searchid.text
      else
        puts "search error:"
        puts body
        return nil
      end
    end
    @searchid
  end

  @results = []
  @lastcount = 0

  # for debugging only, load results
  # from a file.
  def poll_results_file
    return handle_results(@resulting_xml)
  end

  def poll_results( count = @lastcount )
    url = "/s/apibasic/flight?searchid=#{@searchid}&apimode=1&_sid_=#{getsession}"
    
    more = nil
    Net::HTTP.start(@hostname, @port) do |http|
      if count
        url += "&c=#{count}"
      end
      response = http.get(url)
      body = response.body
      more = handle_results( body)
      if more != 'true'
        @resulting_xml << body
      end
    end
    return more
  end


  # process the xml result string
  def handle_results(body)
    xml = REXML::Document.new(body)
    more = xml.elements['/searchresult/morepending']
    @lastcount = xml.elements['/searchresult/count'].text
    if more
      more = more.text
    end
    if more != 'true'
      @results = []
      #puts "count=#{@lastcount}"

      # this loop over the XML is just for illustration.
      # once you have the XML, the rest is not that interesting.
      xml.elements.each("/searchresult/trips/trip") do |e|
        e.each_element("price") do |t|
          # pull the prices out of the trip XML element
          @results << [t.text.to_i, t.attribute("url"), e]
        end
        e.each_element("legs") do |legs|
          legs.each_element("leg") do |l|
            # do something with the leg XML element
            l.each_element do |ld| 
              # leg XML contains detail info. 
            end
          end # leg in legs loop
        end # legs in trip loop
      end # each trip
    end
    return more
  end

end
