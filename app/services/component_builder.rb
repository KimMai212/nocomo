class ComponentBuilder
  def initialize(component)
    @component = component
  end

  def build
    html = @component.html
    @component.placeholders.each do |ph|
      html.gsub!("{{{#{ph.name}}}}", ph.value)
    end
    html
  end
end
