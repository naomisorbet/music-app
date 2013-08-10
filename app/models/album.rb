class Album < ActiveRecord::Base
  attr_accessible :band_id, :date, :name

  validates :band, :date, :presence => false

  belongs_to(:band,
             :class_name => "Band",
             :foreign_key => :band_id,
             :primary_key => :id)

  has_many(:tracks,
    :class_name => "Track",
    :foreign_key => :album_id,
    :primary_key => :id,
    :dependent => :destroy)

end
