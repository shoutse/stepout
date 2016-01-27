class Industry < ActiveRecord::Base
	has_many :topics, :dependent => :destroy
	has_many :drafts, :dependent => :destroy
  has_attached_file :photo, styles: { medium: "250x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
