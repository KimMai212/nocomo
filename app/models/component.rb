class Component < ApplicationRecord
  has_many :placeholders
  has_many :component_styles
  has_many :styles, through: :component_styles
end
