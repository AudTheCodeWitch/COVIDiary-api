class Entry < ApplicationRecord
  belongs_to :user

  def self.public
    self.all.select {|entry| entry.is_public? == true}
  end

end
