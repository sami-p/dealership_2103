require 'rspec'
require './lib/dealership'
require './lib/car'

RSpec.describe Dealership do
  describe '#initialize' do
    it 'exists' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership).to be_an_instance_of(Dealership)
    end

    it 'has a name' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.name).to eq("Acme Auto")
    end

    it 'has an address' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.address).to eq("123 Main Street")
    end
  end

  describe '#inventory' do
    it 'has default empty inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.inventory).to eq([])
    end

    it 'can count inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.inventory_count).to eq(0)
    end

    it 'can add cars to inventory' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)

      dealership.add_car(car_1)
      dealership.add_car(car_2)

      expect(dealership.inventory).to eq([car_1, car_2])
      expect(dealership.inventory_count).to eq(2)
    end
  end

  describe 'Iteration 3' do
    it '#has_inventory?' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")

      expect(dealership.has_inventory?).to eq(false)
    end

    it '#has_inventory == true if inventory has cars' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.has_inventory?).to eq(true)
    end

    it '#cars_by_make' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.cars_by_make("Toyota")).to eq([car_2, car_3])
      expect(dealership.cars_by_make("Ford")).to eq([car_1])
    end

    it 'has #total_value' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.total_value).to eq(156000)
    end

    it 'has #details hash' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.details).to eq({"total_value" => 156000, "address" => "123 Main Street"})
    end
  end

  describe 'Iteration 4' do
    it '#average_price_of_car' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.average_price_of_car).to eq("39,000")
    end

    it '#cars_sorted_by_price' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.cars_sorted_by_price).to eq([car_3, car_4, car_2, car_1])
    end

    it '#inventory_hash' do
      dealership = Dealership.new("Acme Auto", "123 Main Street")
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)

      dealership.add_car(car_1)
      dealership.add_car(car_2)
      dealership.add_car(car_3)
      dealership.add_car(car_4)

      expect(dealership.inventory_hash).to eq({
                                                "Ford"=> [car_1],
                                                "Toyota"=> [car_2, car_3],
                                                "Chevrolet"=> [car_4]
                                              })
    end
  end
end
