class Upload < ActiveRecord::Base
  
  has_attached_file :image, :styles => { :medium => "200x200", :thumb => "100x100" }

  validates_attachment :image, presence => true, :content_type => { :content_type => [ "application/pdf", /\Aimage/ ] }, :matches => [ /png\Z/, /jpe?g\Z/ ], :size => { :less_than => 4.megabyte }

end
