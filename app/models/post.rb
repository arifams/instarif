class Post < ActiveRecord::Base
	has_attached_file :image, styles: { big: "740x740>", medium: "300x300>", thumb: "100x100>" }, default_url: "http://www.arifams.com/wp-content/uploads/2015/12/arifams-300x300.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
