class Style < ApplicationRecord
    belongs_to :layout
    has_many :component_styles
end
