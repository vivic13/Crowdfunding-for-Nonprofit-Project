class Photofile < ApplicationRecord
  belongs_to :story
  has_attached_file :image,:default_url => 'upload_image.png', styles: { small: "100x100"}

end
