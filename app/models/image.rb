class Image < ActiveRecord::Base
  attr_accessible :restaurant_id, :user_id, :file
  has_attached_file :file, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :file, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'
end
