class Outlet < ActiveRecord::Base
  attr_accessible :address, :category, :description, :latitude, :longitude, :name, :phone
  
   acts_as_gmappable :process_geocoding => false
  
  # Outlets associated with users
  belongs_to  :user
  
  
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
