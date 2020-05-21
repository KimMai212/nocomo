puts " Starting off with a clean slate, Cleaning database of all records"

Placeholder.destroy_all
Project.destroy_all
Layout.destroy_all
Color.destroy_all
Design.destroy_all
Font.destroy_all
User.destroy_all

# ---------------------------------------------------
#  Initialize Project
puts "Initializing a new Project"
project = Project.new

# ---------------------------------------------------
#  Create User
puts "Assining a user to the project"
user = User.create(email: "peter@lustig.org", password: "123456")
project.user = user
# ---------------------------------------------------
#  Create Layout
html = <<~HTML
  <div>
    <div>{{{heading_date}}}</div>
    <h1 class="heading_style">{{{heading_text}}}</h1>
  </div>
HTML

puts "Assining a layout to the project"
layout = Layout.create!(
  name: "h1",
  html: html
)
project.layout = layout

# ---------------------------------------------------
#  Create Design
css = <<~CSS
  .heading_style {
    color: red;
  }
CSS

puts "Assining a design to the project"
design = Design.create!(
  name: "dark_design",
  css: css,
)
project.design = design
# ---------------------------------------------------
#  Create Color

color_css = <<~CSS
  p {
    color: black;
  }
CSS
puts "Assining a color to the project"
color = Color.create!(
  name: "dark_design",
  css: color_css,
)
project.color = color
# ---------------------------------------------------
#  Create Font
puts "Assining a font to the project"

font = Font.create!(
  paragraph: "Varela Round",
  heading: "Lato",
)
project.font = font
# ---------------------------------------------------
#  Create Placeholder
puts "Assining a placeholder to the project"

placeholder = Placeholder.new(
  name: "heading_date",
  value: "May 11, 2011"
)
placeholder.project = project
placeholder.save!

# ---------------------------------------------------


project.save!
puts "project has been saved"

