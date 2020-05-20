# Style.destroy_all

Project.destroy_all
Layout.destroy_all

# blog = Layout.create!(
#   name: "Influencer's blog"
# )

Placeholder.destroy_all
# Component.destroy_all
leon = User.last

html = <<~HTML
  <div>
    <div>{{{heading_date}}}</div>
    <h1 class="heading_style">{{{heading_text}}}</h1>
  </div>
HTML

h1 = Layout.create!(
  name: "h1",
  html: html
)


# Create style

css = <<~CSS
  .heading_style {
    color: red;
  }
CSS

dark_design = Design.create!(
  name: "dark_design",
  css: css,
)

#  Create Color
color_css = <<~CSS
  p {
    color: black;
  }
CSS

color = Color.create!(
  name: "dark_design",
  css: color_css,
)



font = Font.create!(
  paragraph: "Varela Round",
  heading: "Lato",
)

project = Project.new
project.design = dark_design
project.layout = h1
project.user = leon
project.color = color
project.font = font
project.save!

project.placeholders.create!(
  name: "heading_date",
  value: "May 11, 2011"
)





# style = blog.styles.first
# style.components << h1



