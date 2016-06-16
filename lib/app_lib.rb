module AppLib
  #PROPERTY OWNERS
  #Business Focus: D=Development, I=Investment                         
  #Regions of Operation: E=East, MW=Midwest, S=South, W=West, I=International, X=Other  
  
  #OFFICE INVESTORS AND DEVELOPERS
  #Location Type:SB=Suburban, UB=Urban                                                                                                                                                                                     
   
  #NET LEASE
  #Activity Type: B=Brokerage, D=Development, EI=Equity Investment, F=Financing, SL=Sale-leaseback Transactions, SY=Synthetic Leases, EX=1031 Exchanges, TIC=Tenancy-in-common, X=Other
  #Business Type: B=Brokerage, D=Development, EI=Equity Investment, F=Financing
  #Level of Credit: IG=Investment Grade, NG=Non-investment Grade 
   
  #MORTGAGE BANKERS AND BROKERS
  #Loan Types:B=Bridge, C=Construction, D=Debt, EQ=Equity, FR=Fixed Rate, HB=Hybrid, IO = Interest Only, MZ=Mezzanine, M=Mortgage, CMBS=Permanent, VR=Variable/Floating Rate, X=Other 
                                                                                                                             
  #MULTI-FAMILY FINANCE  
  #Activity Type: CO=Conduit, CB=Commercial Banking, FM=Fannie Mae/Freddie Mac/FHA Lender, IA=Institutional Investment Advisory, IB=Investment Banking, L=Lending, LS=Loan Servicing, MB=Mortgage Banking, MBR=Mortgage Brokerage, X=Other
  
  #DIRECT LENDER
  #Lender Types:D=Debt, E=Equity, H=Hybrid
  #Loan Types:C=Construction, D=Debt, E=Equity, FR=Fixed Rate, HB=Hybrid, MZ=Mezzanine, M=Mortgage, VR=Variable Rate, X=Other
 
  #HOTELS                 
  #Segment Types:BE=Budget/Economy, ES=Extended Stay, LX=Luxury, U=Upscale, MF=Midscale (with Food/beverage), MN=Midscale (without Food/Beverage), X=Other

  def self.star_to_bold(s)
    return nil unless s
    AppLib.nl2br s.gsub(/\*\*(.*?)\*\*/, "<b>\\1</b>")
  end

  def self.email_regex
    "/^([\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+\.)*[\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)$/i"
  end

  def self.linked_in_key
    "d3GSOGzi6AJb21GZ2OrGMdfxxBqI0hp--GElidPSoxEt5M6W7-ChZtkIn3QLclyr"
  end
  def self.linked_in_pass
    "kMRM1EIpFdLVQJBgvJCsqznvyDPjgimTomK3NLH4QICLU50My0NvJYcZq9xSbLcy"
  end
                
  def self.hotel_segments
    {"BE"=>"Budget/Economy", "ES"=>"Extended Stay", "LX"=>"Luxury", "U"=>"Upscale", "MF"=>"Mid (food/beverage)", "MN"=>"Mid (no food/beverage)", "X"=>"Other"}
  end
                   
  #HOME PAGE
   
  def self.cpn_company_type 
    {"AO"=>"Apartment Property Owner","BF"=>"Most Powerful Brokerage Firms","BN"=>"Most Powerful Brokerage Networks","D"=>"Commercial Developer","HOFM"=>"Hotel Owners, Franchisors &amp; Managers","IND"=>"Industrial Investor/Developer","INV"=>"Commercial Buyer/Investor","LB"=>"Leading Brokerage Firm","LE"=>"Direct Lender","MB"=>"Mortgage Banker/Broker","MFF"=>"Multi-Family Finance","NLP"=>"Net Lease Player","OF"=>"Office Investor/Developer","OWN"=>"Property Owner","PM"=>"Property Manager","RTL"=>"Retail Investor/Developer"}
  end
  def self.cpn_asset_code_to_name
    {"AH"=>"Affordable Housing","CS"=>"Community Shopping Centers","FO"=>"Factory Outlets","FT"=>"Flex/Tech","GC"=>"Grocery-anchored Centers","HC"=>"Healthcare","H"=>"Hotel","I"=>"Industrial","L"=>"Land","LC"=>"Lifestyle Centers","MG"=>"Manufacturing","M"=>"Mortgage","MF"=>"Multi-Family Centers","O"=>"Office","RM"=>"Regional Malls","R"=>"Retail","SS"=>"Self-Storage Facility","SH"=>"Seniors Housing","SA"=>"Stand-alone Retail","WD"=>"Warehouse/Development","X"=>"Other"}
  end 
  def self.cpn_regions
    {"E"=>"East","MW"=>"Midwest","S"=>"South","W"=>"West","I"=>"International", "X"=>"Other"}
  end  
  
  def self.regions_theirs_to_ours
    {"E"=>[:north_east,:mid_atlantic], "MW"=>[:mid_west], "S"=>[:south], "W"=>[:pacific,:mountains], "I"=>[], "X"=>[]}
  end
   
  def self.similar_to_regex(str) 
    "^[#{str.split(//).uniq.join.gsub(/[^a-zA-Z0-9]/, '')}]{#{str.size-1},#{str.size+1}}$"
  end
   
  def self.cap_only_first_letter(v)
    return v if v.blank?
    return v.first.upcase if v.size==1
    v.first.upcase + v[1..v.size-1]
  end

  def self.nl2br(text)
    return "" if text.blank?
    text.gsub(/\n/, '<br/>')
  end            
  
  def self.today
    day(Time.zone.now)
  end  

  #rounds a float to two decimal places   
  def self.round_a_float(the_float, places=2)
    multiplier = (10**places).to_f
    (the_float*multiplier).round/multiplier
  end              
     
  CURRENCY_SINGLETON = Object.new.extend(ActionView::Helpers::NumberHelper)  
  def self.number_to_currency(*args)
    CURRENCY_SINGLETON.number_to_currency(*args)
  end                        
  
  def self.frac_to_entity(str)                                 
    h = { 
        "1/4"=>"&#188;", 
        "1/2"=>"&#189;", 
        "3/4"=>"&#190;",
        "1/3"=>"&#8531;",      
        "2/3"=>"&#8532;",       
        "1/5"=>"&#8533;",       
        "2/5"=>"&#8534;",       
        "3/5"=>"&#8535;",       
        "4/5"=>"&#8536;",       
        "1/6"=>"&#8537;",       
        "5/6"=>"&#8538;",       
        "1/8"=>"&#8539;",       
        "3/8"=>"&#8540;",
        "5/8"=>"&#8541;",
        "7/8"=>"&#8542;"}
   h.keys.each {|k| str.gsub!(k, h[k])}    
   str
  end  
  
  def self.backup_fract_conv(str)
    str.gsub!(/(\d+)\/(\d+)/, "<span class='fraction'><sup>\1</sup><span class='slash'>&frasl;</span><sub>\2</sub></span>")     
    str
  end             
                           
  def self.pie_percent_to_color(pct) 
    return "ffffff" if pct == 0  
    return "7e4c00" if pct == 100
    return "c75900" if pct >= 90
    return "c75900" if pct >= 80
    return "bb7000" if pct >= 70
    return "bb7000" if pct >= 60
    return "bb7000" if pct >= 50
    return "fd9800" if pct >= 40
    return "fd9800" if pct >= 30
    return "ffd088" if pct >= 20
    return "ffd088" if pct >= 10
    "fde6c2" 
  end  
  
  def self.percent_to_color(pct)      
    return "#ffffff" if pct == 10
    return "#d1e7c4" if pct <= 10
    return "#9ed897" if pct <= 20  
    return "#52b45f" if pct <= 30
    return "#188b3c"   
  end
  
  # for the map legend (these color values are calibrated to compensate for the 30/50/70/90 opacity levels in campaign/_stats.erb)
  def self.hits_to_color(hits)     

    return "#ffffff" if hits == 0
    return "#B1CCF8" if hits <= 10  
    return "#1565EA" if hits <= 20
    return "#0E439C"

#    return "#a8c8d5" if hits == 0
#    return "#789dcb" if hits <= 10  
#    return "#4866c2" if hits <= 20
#    return "#1823b8"
  end 

  def self.day(time)
    # return date (with no time info)
    Date.civil(time.year, time.month, time.mday)
  end
  
  def self.file_extension(filename)
    File.extname(filename).tr_s('.', '')
  end   
                                                    
  def self.hash_to_options(hash) 
    sorted = hash.sort
    sorted.each { |a| a.reverse! }    
    sorted
  end    
  
  def self.state_options_short
    [["--", ""]]+AppLib.code_to_state.keys.collect{|x| [x.to_s, x.to_s]}.sort{|x,y| x[0] <=> y[0]}
  end
  def self.state_options(include_blank=true)
    blank = [['-- Select State --', '']]
    s = [['Alabama', 'AL'], ['Alaska', 'AK'],['Arizona', 'AZ'],['Arkansas', 'AR'], ['California', 'CA'],['Colorado', 'CO'], ['Connecticut', 'CT'], ['Delaware', 'DE'], ['District Of Columbia', 'DC'], ['Florida', 'FL'],['Georgia', 'GA'],['Hawaii', 'HI'], ['Idaho', 'ID'], ['Illinois', 'IL'], ['Indiana', 'IN'], ['Iowa', 'IA'], ['Kansas', 'KS'], ['Kentucky', 'KY'], ['Louisiana', 'LA'], ['Maine', 'ME'], ['Maryland', 'MD'], ['Massachusetts', 'MA'], ['Michigan', 'MI'], ['Minnesota', 'MN'],['Mississippi', 'MS'], ['Missouri', 'MO'], ['Montana', 'MT'], ['Nebraska', 'NE'], ['Nevada', 'NV'], ['New Hampshire', 'NH'], ['New Jersey', 'NJ'], ['New Mexico', 'NM'], ['New York', 'NY'], ['North Carolina', 'NC'], ['North Dakota', 'ND'], ['Ohio', 'OH'], ['Oklahoma', 'OK'], ['Oregon', 'OR'], ['Pennsylvania', 'PA'], ['Rhode Island', 'RI'], ['South Carolina', 'SC'], ['South Dakota', 'SD'], ['Tennessee', 'TN'], ['Texas', 'TX'], ['Utah', 'UT'], ['Vermont', 'VT'], ['Virginia', 'VA'], ['Washington', 'WA'], ['West Virginia', 'WV'], ['Wisconsin', 'WI'], ['Wyoming', 'WY']]
    include_blank ? (blank+s) : s
  end 
  def self.code_to_state 
    {:AL=>'Alabama', :AK=>'Alaska', :AZ=>'Arizona', :AR=>'Arkansas', :CA=>'California', :CO=>'Colorado', :CT=>'Connecticut', :DE=>'Delaware', :DC=>'District Of Columbia', :FL=>'Florida', :GA=>'Georgia', :HI=>'Hawaii', :ID=>'Idaho', :IL=>'Illinois', :IN=>'Indiana', :IA=>'Iowa', :KS=>'Kansas', :KY=>'Kentucky', :LA=>'Louisiana', :ME=>'Maine', :MD=>'Maryland', :MA=>'Massachusetts', :MI=>'Michigan', :MN=>'Minnesota', :MS=>'Mississippi', :MO=>'Missouri', :MT=>'Montana', :NE=>'Nebraska', :NV=>'Nevada', :NH=>'New Hampshire', :NJ=>'New Jersey', :NM=>'New Mexico', :NY=>'New York', :NC=>'North Carolina', :ND=>'North Dakota', :OH=>'Ohio', :OK=>'Oklahoma', :OR=>'Oregon', :PA=>'Pennsylvania', :RI=>'Rhode Island', :SC=>'South Carolina', :SD=>'South Dakota', :TN=>'Tennessee', :TX=>'Texas', :UT=>'Utah', :VT=>'Vermont', :VA=>'Virginia', :WA=>'Washington', :WV=>'West Virginia', :WI=>'Wisconsin', :WY=>'Wyoming'}
  end
  def self.state_to_code
    r = {}
    AppLib.code_to_state.each_pair{|k,v| r[v] = k}
    r
  end
  def self.from_state_to_code(s)
    r = {}
    AppLib.code_to_state.each_pair{|k,v| r[v.downcase] = k}
    r[s.downcase]
  end
  
  def self.tz_to_name
    {"Central Time (US & Canada)"=>'cst', 'Mountain Time (US & Canada)'=>'mst', 'Alaska'=>'akst', 'Hawaii'=>'hst', "Pacific Time (US & Canada)"=>'pst', "Eastern Time (US & Canada)"=>'est'} 
  end
  
  def self.name_to_tz
    AppLib.tz_to_name.to_a.collect_h{|x| [x[1],x[0]]}
  end

  def self.state_to_time_zone      
    {:AK=>"Alaska", :AL=>"Central Time (US & Canada)", :AR=>"Central Time (US & Canada)", :AZ=>"Mountain Time (US & Canada)", :CA=>"Pacific Time (US & Canada)", :CO=>"Mountain Time (US & Canada)", :CT=>"Eastern Time (US & Canada)", :DC=>"Eastern Time (US & Canada)", :DE=>"Eastern Time (US & Canada)", :FL=>"Eastern Time (US & Canada)", :GA=>"Eastern Time (US & Canada)", :HI=>"Hawaii", :IA=>"Central Time (US & Canada)", :ID=>"Mountain Time (US & Canada)", :IL=>"Central Time (US & Canada)", :IN=>"Eastern Time (US & Canada)", :KS=>"Central Time (US & Canada)", :KY=>"Eastern Time (US & Canada)", :LA=>"Central Time (US & Canada)", :MA=>"Eastern Time (US & Canada)", :MD=>"Eastern Time (US & Canada)", :ME=>"Eastern Time (US & Canada)", :MI=>"Eastern Time (US & Canada)", :MN=>"Central Time (US & Canada)", :MO=>"Central Time (US & Canada)", :MS=>"Central Time (US & Canada)", :MT=>"Mountain Time (US & Canada)", :NC=>"Eastern Time (US & Canada)", :ND=>"Central Time (US & Canada)", :NE=>"Central Time (US & Canada)", :NH=>"Eastern Time (US & Canada)", :NJ=>"Eastern Time (US & Canada)", :NM=>"Mountain Time (US & Canada)", :NV=>"Pacific Time (US & Canada)", :NY=>"Eastern Time (US & Canada)", :OH=>"Eastern Time (US & Canada)", :OK=>"Central Time (US & Canada)", :OR=>"Pacific Time (US & Canada)", :PA=>"Eastern Time (US & Canada)", :RI=>"Eastern Time (US & Canada)", :SC=>"Eastern Time (US & Canada)", :SD=>"Central Time (US & Canada)", :TN=>"Central Time (US & Canada)", :TX=>"Central Time (US & Canada)", :UT=>"Mountain Time (US & Canada)", :VA=>"Eastern Time (US & Canada)", :VT=>"Eastern Time (US & Canada)", :WA=>"Pacific Time (US & Canada)", :WI=>"Central Time (US & Canada)", :WV=>"Eastern Time (US & Canada)", :WY=>"Mountain Time (US & Canada)"}
  end    
    
  def self.price_from_options
    [ 
      ["2,000,000",2000000], ["5,000,000",5000000], ["10,000,000",10000000], ["15,000,000",15000000], ["20,000,000",20000000], ["30,000,000",30000000], ["40,000,000",40000000], ["50,000,000",50000000]
    ]
  end 
  def self.price_to_options
    [                                                                                                                                                                                            
      ["5,000,000",5000000], ["10,000,000",10000000], ["15,000,000",15000000], ["20,000,000",20000000], ["30,000,000",30000000], ["40,000,000",40000000], ["50,000,000",50000000], ["No Limit",""]          
    ]
  end   

  def self.exp_year_options
    # [[2008, 2008], [2009, 2009], [2010, 2010], etc]
    (2008..2020).to_a.map {|year| [year,year] }
  end

  def self.exp_month_options
    # [[01, 1], [2, 02], etc]
    (1..12).to_a.map {|month| [format('%02d',month), month]}
  end

  def self.cc_options
    hash_to_options(CreditCard::CARD_TYPES)
  end    
  
  def self.country_options
    country_options = ""
    
    priority_countries = [['US', AppDB.countries['US']], ['AU', AppDB.countries['AU']], ['UK', AppDB.countries['UK']], ['CA', AppDB.countries['CA']]]
    for c in priority_countries
      country_options += "<option value=\"#{c[0]}\">#{c[1]}</option>\n"
    end
    
    country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
      
    countries = AppDB.countries.sort {|a,b| a[1]<=>b[1]}
    
    for c in countries
      country_options += "<option value=\"#{c[0]}\">#{c[1]}</option>\n"
    end  
  
    country_options
  end   
  
  # Awesome truncate
  # First regex truncates to the length, plus the rest of that word, if any.
  # Second regex removes any trailing whitespace or punctuation (except ;).
  # Unlike the regular truncate method, this avoids the problem with cutting
  # in the middle of an entity ex.: truncate("this &amp; that",9)  => "this &am..."
  # though it will not be the exact length.  
  def self.word_truncate(text, len=30, truncate_string = " ...")
    return if text.nil?
    l = len - truncate_string.size
    text.size > len ? text[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : text
  end
  
  # Create a gateway object to the Authorize.net service
  def self.gateway
    ActiveMerchant::Billing::PayflowGateway.new(
        :user     => 'jharper',
        :login    => 'creconsole',
        :password => 'atl4ssian',
        :partner  => 'PayPal'
      )
  end
  
  def self.ext_to_content_type
    {"xhtml"=>"application/xhtml+xml", "me"=>"application/x-troff-me", "pbm"=>"image/x-portable-bitmap", "rpm"=>"audio/x-pn-realaudio-plugin", 'xlsm'=>'application/vnd.ms-excel', "xls"=>"application/vnd.ms-excel", "xslt"=>"application/xslt+xml", "dcr"=>"application/x-director", "htm"=>"text/html", "dll"=>"application/octet-stream", "latex"=>"application/x-latex", "ogg"=>"application/ogg", "vrml"=>"model/vrml", "man"=>"application/x-troff-man", "texi"=>"application/x-texinfo", "png"=>"image/png", "txt"=>"text/plain", ".php"=>"application/x-httpd-php", "cpt"=>"application/mac-compactpro", "ief"=>"image/ief", "kar"=>"audio/midi", "mpe"=>"video/mpeg", ".wmlc"=>"application/vnd.wap.wmlc", "css"=>"text/css", "ppt"=>"application/vnd.ms-powerpoint", "dir"=>"application/x-director", "lzh"=>"application/octet-stream", "eps"=>"application/postscript", "m3u"=>"audio/x-mpegurl", "igs"=>"model/iges", "mpg"=>"video/mpeg", "aif"=>"audio/x-aiff", "xml"=>"application/xml", ".tgz"=>"application/x-tar", "wbmp"=>"image/vnd.wap.wbmp", "wmlsc"=>"application/vnd.wap.wmlscriptc", "sh"=>"application/x-sh", "mpga"=>"audio/mpeg", "mov"=>"video/quicktime", "hdf"=>"application/x-hdf", "sv4crc"=>"application/x-sv4crc", "t"=>"application/x-troff", "pnm"=>"image/x-portable-anymap", "msh"=>"model/mesh", "rtf"=>"text/rtf", "shar"=>"application/x-shar", "hqx"=>"application/mac-binhex40", "xpm"=>"image/x-xpixmap", "au"=>"audio/basic", "sit"=>"application/x-stuffit", "xsl"=>"application/xml", "nc"=>"application/x-netcdf", "mxu"=>"video/vnd.mpegurl", "vxml"=>"application/voicexml+xml", "ifb"=>"text/calendar", "js"=>"application/x-javascript", "ice"=>"x-conference/x-cooltalk", "xbm"=>"image/x-xbitmap", "vcd"=>"application/x-cdlink", "texinfo"=>"application/x-texinfo", "dxr"=>"application/x-director", "wrl"=>"model/vrml", "tsv"=>"text/tab-separated-values", "bmp"=>"image/bmp", "sgm"=>"text/sgml", "smi"=>"application/smil", "aifc"=>"audio/x-aiff", "so"=>"application/octet-stream", "dvi"=>"application/x-dvi", "ms"=>"application/x-troff-ms", "wmlc"=>"application/vnd.wap.wmlc", "gif"=>"image/gif", "pdb"=>"chemical/x-pdb", "jpe"=>"image/jpeg", "tif"=>"image/tiff", ".phps"=>"application/x-httpd-php-source", ".crl"=>"application/x-pkcs7-crl", "jpeg"=>"image/jpeg", "cpio"=>"application/x-cpio", "ps"=>"application/postscript", "aiff"=>"audio/x-aiff", "xwd"=>"image/x-xwindowdump", "tcl"=>"application/x-tcl", "svg"=>"image/svg+xml", "cdf"=>"application/x-netcdf", "spl"=>"application/x-futuresplash", "jpg"=>"image/jpeg", "pdf"=>"application/pdf", "movie"=>"video/x-sgi-movie", "silo"=>"model/mesh", ".wml"=>"text/vnd.wap.wml", "roff"=>"application/x-troff", "smil"=>"application/smil", "exe"=>"application/octet-stream", "tex"=>"application/x-tex", "skd"=>"application/x-koan", "rgb"=>"image/x-rgb", "dms"=>"application/octet-stream", "asc"=>"text/plain", "sv4cpio"=>"application/x-sv4cpio", "djv"=>"image/vnd.djvu", "dtd"=>"application/xml-dtd", "class"=>"application/octet-stream", "mathml"=>"application/mathml+xml", ".wmls"=>"text/vnd.wap.wmlscript", "mid"=>"audio/midi", "rdf"=>"application/rdf+xml", "djvu"=>"image/vnd.djvu", "midi"=>"audio/midi", "snd"=>"audio/basic", "ico"=>"image/x-icon", "bcpio"=>"application/x-bcpio", "wml"=>"text/vnd.wap.wml", "lha"=>"application/octet-stream", "xht"=>"application/xhtml+xml", "mif"=>"application/vnd.mif", "mp2"=>"audio/mpeg", ".php3"=>"application/x-httpd-php", ".crt"=>"application/x-x509-ca-cert", "mesh"=>"model/mesh", "ra"=>"audio/x-realaudio", "grxml"=>"application/srgs+xml", "mp3"=>"audio/mpeg", ".php4"=>"application/x-httpd-php", "etx"=>"text/x-setext", "mpeg"=>"video/mpeg", "wav"=>"audio/x-wav", "sgml"=>"text/sgml", "rtx"=>"text/richtext", "gram"=>"application/srgs", "cgm"=>"image/cgm", "ram"=>"audio/x-pn-realaudio", "ics"=>"text/calendar", "xyz"=>"chemical/x-xyz", ".wmlsc"=>"application/vnd.wap.wmlscriptc", "pgm"=>"image/x-portable-graymap", "pgn"=>"application/x-chess-pgn", "skm"=>"application/x-koan", "avi"=>"video/x-msvideo", "csh"=>"application/x-csh", "ez"=>"application/andrew-inset", "doc"=>"application/msword", "swf"=>"application/x-shockwave-flash", "tr"=>"application/x-troff", "tiff"=>"image/tiff", "qt"=>"video/quicktime", "oda"=>"application/oda", "wmls"=>"text/vnd.wap.wmlscript", "skp"=>"application/x-koan", "iges"=>"model/iges", "html"=>"text/html", ".wbmp"=>"image/vnd.wap.wbmp", ".phtml"=>"application/x-httpd-php", "wbxml"=>"application/vnd.wap.wbxml", "ppm"=>"image/x-portable-pixmap", "ai"=>"application/postscript", "bin"=>"application/octet-stream", "ras"=>"image/x-cmu-raster", "gtar"=>"application/x-gtar", "ustar"=>"application/x-ustar", "rm"=>"audio/x-pn-realaudio", "xul"=>"application/vnd.mozilla.xul+xml", "src"=>"application/x-wais-source", "zip"=>"application/zip", "tar"=>"application/x-tar", ".shtml"=>"text/html", "skt"=>"application/x-koan"}
  end
  
end