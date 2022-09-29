class Podcast < ApplicationRecord
 validates :name,{
    presence: true,
    length: {in: 4..15}
 }
validate :uppercase_podcast
 def uppercase_podcast
    unless !name.upcase!
    errors.add(:name, "must be uppercase") 
    end
 end
end
