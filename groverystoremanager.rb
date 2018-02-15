class Product  
  attr_accessor :name, :quantity, :serial, :cost, :sell_price, :category
  def initialize(name, quantity, serial, cost, sell_price, category)  
    @name = name  
    @quantity = quantity  
    @serial = serial
    @cost = cost
    @sell_price = sell_price
    @category = category
  end
  
  def about
    puts "#{@name} is a #{@category} with a serial of #{@serial}. We have #{@quantity} of this product in stock. We purchased it for $#{@cost} per unit and sell it for $#{@sell_price} per unit."
  end
end
def menu
  puts "Welcome to Grocery Store Manager. Enter a selection:"
  puts "1. View Categories"
  puts "2. View Product Info (enter product name)"
  puts "3. Update product quantity"
  puts "4. Add Products to Category"
  selection = gets.chomp.to_i 
    if selection == 1
      view_categories
    elsif selection == 2
      view_prod_info
    elsif selection == 3
      update_prod_quan
    elsif selection == 4
      add_products
    else
      puts "Invalid selection. Try again."
      menu
  end
end
def view_categories
  categories = ["cereal", "chips", "candy"]
  puts "The categories of product in this grocery store are: "
  categories.each { |x| puts x.capitalize }
  menu
end
def view_prod_info
  puts "Here is the complete list of products in stock."
  $products.each { |x| puts x.name }
  puts "Type in a product to get more info:"
  choice = gets.chomp.to_s.downcase
  $products.each do |x|
      if x.name == choice
        puts x.about
      end
  end
  menu
end
  
def update_prod_quan
  puts "Here is the complete list of products in stock."
  $products.each { |x| puts x.name }
  puts "Type in a product to update it's quantity:"
  choice = gets.chomp.to_s.downcase
  $products.each do |x|
      if x.name == choice
        puts "Enter new quantity"
        newquan = gets.chomp.to_i
        x.quantity = newquan
        puts "There are now " +  newquan.to_s + " " + x.name.to_s
      end
  end  
  menu
end
def add_products
  puts "Here are all the availible categories: "
  categories = ["cereal", "chips", "candy"]
  categories.each { |x| puts x.capitalize }
  puts "Enter a category you want to add a product to:"
  choice = gets.chomp.to_s.downcase
  categories.each do |x|
      if categories.include?(choice) == true
        puts choice.capitalize + " selected. Type in the new product name: "
        newname = gets.chomp
        puts "Type in new product quanity:"
        quanity = gets.chomp.to_i
        puts "Type in new prduct serial: "
        serial = gets.chomp.to_i
        puts "Type in new product wholesale price:"
        wholesale = gets.chomp.to_f
        puts "Type in new product sell price:"
        sellprice = gets.chomp.to_f
        newprod = Product.new(newname,quanity,serial,wholesale,sellprice,choice)
        $products.push(newprod)
        puts "Success! Product added."
        menu
      else 
        puts "Invalid choice. Back to menu."
        menu
      end
  end
end
$products = []
lc = Product.new("lucky charms", 20, 77732, 0.50, 2, "cereal")
cheerios = Product.new("cheerios", 25, 19283, 0.30, 1.50, "cereal")
ctc = Product.new("cinnamon coast crunch", 30, 12231, 0.70, 2.99, "cereal")
fruitl = Product.new("fruit loops", 35, 29335, 0.50, 4, "cereal")
ajs = Product.new("apple jacks", 60, 29467, 0.60, 3.25, "cereal")
twix = Product.new("twix", 50, 23123, 0.50, 1, "candy")
snickers = Product.new("snickers", 50, 76566, 0.50, 1, "candy")
spk = Product.new("sour patch", 50, 11224, 0.22, 1.50, "candy")
skittles = Product.new("skittles", 50, 90988, 0.20, 2, "candy")
fundip = Product.new("fun dip", 50, 43433, 0.80, 1.30, "candy")
sunchips = Product.new("sun chips", 75, 12355, 0.20, 0.99, "chip")
lays = Product.new("lays", 75, 76532, 0.20, 0.75, "chip")
pringles = Product.new("pringles", 75, 32438, 0.20, 1, "chip")
tostidos = Product.new("tostidos", 75, 92835, 0.30, 1, "chip")
cheetos = Product.new("cheetos", 75, 65924, 0.40, 1, "chip")
$products.push(lc, cheerios, ctc, fruitl, ajs, twix, snickers, spk, skittles, fundip, sunchips, lays, pringles, tostidos, cheetos)
menu
