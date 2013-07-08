class Song < ActiveRecord::Base
  attr_accessible :title, :attachment
  has_attached_file :attachment



validates_attachment_presence :attachment
validates_attachment_content_type :attachment,
  :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ],
  :message => 'file must be of filetype .mp3'
validates_presence_of :title

def self.search(search)
  if search
    find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  else  
    find(:all)
  end
end


end
