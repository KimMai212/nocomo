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
user = User.create(email: "guest@guests.org", password: "123456")
project.user = user
# ---------------------------------------------------
#  Create Layout


puts "Creating business layout"
business = Layout.create!(
  name: "Business",
  html: File.read("html/business-layout.html")
  )

puts "Creating shop layout"
Layout.create!(
  name: "Shop",
  html: File.read("html/shop-layout.html")
  )

puts "Creating photo layout"
Layout.create!(
  name: "Photography",
  html: File.read("html/photo-layout.html")
  )

puts "Creating blog layout"
Layout.create!(
  name: "Blog",
  html: File.read("html/blog-layout.html")
  )

puts "Assigning business layout to the project"
project.layout = business



# ---------------------------------------------------
#  Create Design
puts "Creating corporate design"
corporate_design = Design.create!(
  name: "Corporate",
  css: File.read("html/business.css")
  )

puts "Creating minimal design"
Design.create!(
  name: "Minimal",
  css: File.read("html/minimal.css")
  )

puts "Creating dark design"
Design.create!(
  name: "Dark",
  css: File.read("html/dark.css")
  )

puts "Assigning a design to the project"
project.design = corporate_design

# ---------------------------------------------------
#  Create Color

puts "Creating earth colors"
Color.create!(
  name: "Earth tones",
  css: File.read("html/colors/earth-tones-color.css")
)

puts "Creating dark colors"
Color.create!(
  name: "Dark",
  css: File.read("html/colors/dark-color.css")
)

puts "Creating rainbow colors"
Color.create!(
  name: "Rainbow",
  css: File.read("html/colors/rainbow-color.css")
)

puts "Creating grey colors"
Color.create!(
  name: "Grey",
  css: File.read("html/colors/grey-color.css")
)

puts "Creating awesome colors"
Color.create!(
  name: "Awesome colours",
  css: File.read("html/colors/awesome-color.css")
)

puts "Creating minimal colors"
Color.create!(
  name: "Minimal",
  css: File.read("html/colors/minimal-color.css")
)

puts "Creating bright colors"
bright_color = Color.create!(
  name: "Bright",
  css: File.read("html/colors/bright-color.css")
  )

puts "Assigning bright colors to the project"
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

