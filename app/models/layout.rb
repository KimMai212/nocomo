class Layout < ApplicationRecord
  has_many :styles
  has_many :component_styles, through: :styles
  has_many :components, through: :component_styles
end
