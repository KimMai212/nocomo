class Component < ApplicationRecord
    belongs_to :placeholder
    has_many :component_styles
end
