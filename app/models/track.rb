class Track < ActiveRecord::Base
  attr_accessible :album_id, :name, :ord

  belongs_to(:Album,
    :class_name => "Album",
    :foreign_key => :album_id,
    :primary_key => :id)
end
