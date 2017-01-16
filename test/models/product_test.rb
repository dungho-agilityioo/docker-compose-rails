require 'test_helper'

class ProductTest < ActiveSupport::TestCase

	# fixtures :products

	def new_product(image_url)
		Product.new(
				title: 'My title',
				description: 'hfhafaf',
				price: 19.00,
				image_url: image_url
			)
	end

  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
  	product = Product.new({
  			title: 'Agile web development with rails 5',
  			description: 'idiasss',
  			image_url: 'one.png'
  		})

  	product.price = -1
  	product.invalid?
  	assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

  	product.price = 0
  	product.invalid?
  	assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

  	product.price = 1
  	product.valid?
  end

  test "image url" do
  	good = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://abc.v/x/a/ad/fred.png}
  	bad = %w{ fred.doc fred.xml fred.gif/more fred.png.abc }

  	good.each do |image|
  		assert new_product(image).valid?, "#{image} shouldn't be invalid"
  	end

  	bad.each do |image|
  		assert new_product(image).invalid?, "#{image} shouldn't be valid"
  	end
  end
end
