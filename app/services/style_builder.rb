class StyleBuilder
  def initialize(layout)
    @layout = layout
  end

  def build
    html = "<style>"
    @layout.styles.each do |style|
      html += style.css + "\n"
    end
    html += "</style>"
    html
  end
end
