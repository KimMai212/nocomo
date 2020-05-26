class ColorBuilder
  def initialize(color)
    @color = color
  end

  def build
    colors = @color.css.scan(/((--\w*|\w*-\w*): (#\w*))/)
    html = ""
    colors.each do |c|
      html += <<~HTML
      <div class="color" style="background-color: #{c[2]};"></div>
      HTML
    end
    html
  end
end
