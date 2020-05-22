puts "Starting off with a clean slate, Cleaning database of all records"

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
puts "Assigning a user to the project"
user = User.create(email: "peter@lustig.org", password: "123456")
project.user = user
# ---------------------------------------------------
#  Create Layout


puts "Assigning a layout to the project"
business = Layout.create!(
  name: "Business",
  html: File.read("html/business-layout.html")
  )
project.layout = business


shop = Layout.create!(
  name: "Shop",
  html: File.read("html/shop-layout.html")
  )

photo = Layout.create!(
  name: "Photography",
  html: File.read("html/photo-layout.html")
  )

# ---------------------------------------------------
#  Create Design
puts "Assigning a design to the project"
business_design = Design.create!(
  name: "Business",
  css: File.read("html/business.css")
  )
project.design = business_design

minimal_css = File.read("html/minimal.css")
minimal_design = Design.create!(
  name: "Minimal",
  css: minimal_css
  )



# ---------------------------------------------------
#  Create Color

Color.create!(
  name: "Earth tones",
  css: File.read("html/earth-tones-color.css")
)

Color.create!(
  name: "Dark",
  css: File.read("html/dark-color.css")
)

Color.create!(
  name: "Rainbow",
  css: File.read("html/rainbow-color.css")
)

Color.create!(
  name: "Grey",
  css: File.read("html/grey-color.css")
)

Color.create!(
  name: "Awesome colours",
  css: File.read("html/awesome-color.css")
)

Color.create!(
  name: "Minimal",
  css: File.read("html/minimal-color.css")
)

puts "Assining a color to the project"
bright_color = Color.create!(
  name: "Bright",
  css: File.read("html/bright-color.css")
  )

project.color = bright_color

# ---------------------------------------------------
#  Create Font
puts "Assigning a font to the project"

font = Font.create!(
  paragraph: "Varela Round",
  heading: "Lato",
  )
project.font = font

# ---------------------------------------------------
#  Create Placeholder
puts "Assigning a placeholder to the project"

placeholder = Placeholder.new(
  name: "heading_date",
  value: "May 11, 2011"
  )
placeholder.project = project
placeholder.save!

# ---------------------------------------------------

project.save!
puts "Project has been saved"

