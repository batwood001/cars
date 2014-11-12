class Car

	attr_accessor :cars_per_color, :total_car_count, :current_color

	@@total_car_count = 0
	@@cars_per_color = Hash.new("Empty")

	def self.total_car_count #returns the number of Car instances
		@@total_car_count
	end

	def self.cars_per_color
		@@cars_per_color
	end

	def self.most_popular_color
		@@cars_per_color.max_by {|key, value| value}[0]
	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def color(newcolor)
		@@cars_per_color[@current_color] -= 1
		@@cars_per_color[newcolor] += 1
		@current_color = newcolor
	end

	def initialize(color='Unpainted')
		@fuel = 10
		@distance = 0
		@@total_car_count += 1
		@current_color = color
		if @@cars_per_color.has_key?(color)
			@@cars_per_color[color] += 1
		else
			@@cars_per_color[color] = 1
		end
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

class ConvertibleCar < Car

	attr_accessor :roof_status

	def initialize(color="Unpainted")
		super(color)
		@roof_status = "Closed"
	end

	def top_down
		if @roof_status == "Closed"
			@roof_status = "Open"
			puts "The roof is open."
		else
			puts "The roof is already open!"
		end

	end

	def top_up
		if @roof_status == "Open"
			@roof_status = "Closed"
			puts "The roof is closed."
		else
			puts "The roof is already closed!"
		end
	end
end

car_a = Car.new('blue')
car_b = Car.new('red')
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b