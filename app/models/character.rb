class Character < ActiveRecord::Base
  # character model is company or outlet profile
  # will have deals (like individual posts which can be searched by user)
  
  #character will become locations or profile
  #belongs to :user / outlet
  # Has_many :offers??
  # see 3:11 railscast elastic search part 1



  attr_accessible :address, :gmaps, :latitude, :longitude, :name

  acts_as_gmappable :process_geocoding => false
  
  # Tire added to model to facilitate elastic search
  # See railscast elastic search 3:11 pt 1
  
  include Tire::Model::Search
  include Tire::Model::Callbacks
  

  def gmaps4rails_address
    address
  end

  def gmaps4rails_infowindow
    "<h2>#{name}</h2><br/><h3>#{address}</h3>"

  end


  def gmaps4rails_marker_picture
    {
        #{}"picture" => "/images/#{name}.jpg",
        "width" => "25",
        "height" => "39",

    }
  end

  def gmaps4rails_sidebar
    "<span>#{latitude}</span>" #put whatever you want here
  end


  def gmaps4rails_title
    "yo gmaps"
  end

 

end





