class Project < ApplicationRecord
  belongs_to :layout
  belongs_to :color
  belongs_to :design
  belongs_to :font
  belongs_to :user
  has_many :placeholders
end
