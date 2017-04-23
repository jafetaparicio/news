class Story < ApplicationRecord
  has_many :votes
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  def score
    total = 0 
    votes.each do |vote|
      total = total + vote.value
    end
    return total
  end
end
