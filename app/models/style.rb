class Style < ApplicationRecord
  belongs_to :layout
  has_many :component_styles
  has_many :components, through: :component_styles
end
