class Project < ApplicationRecord

  validates :title, :technologies, present: true
  belongs_to :freelancer
end


