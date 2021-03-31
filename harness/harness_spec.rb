require 'pry'
require './lib/car'
require './lib/dealership'


RSpec.describe "Car Dealership Spec Harness" do
  before :each do
    @car_1 = Car.new("Ford Mustang", 1500, 36)
    @car_2 = Car.new("Toyota Prius", 1000, 48)
    @car_3 = Car.new("Toyota Tercel", 500, 48)
    @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
  end

  describe 'iteration 1' do
    it '1. Car Instantiation' do
      expect(Car).to respond_to(:new).with(3).argument
      expect(@car_1).to be_an_instance_of(Car)
    end

    it '2. Car Make and Model' do
      expect(@car_1).to respond_to(:make).with(0).argument
      expect(@car_1).to respond_to(:model).with(0).argument
      expect(@car_1.make).to eq("Ford")
      expect(@car_1.model).to eq("Mustang")
    end

    it '3. Car Attributes' do
      expect(@car_1).to respond_to(:monthly_payment).with(0).argument
      expect(@car_1).to respond_to(:loan_length).with(0).argument
      expect(@car_1.monthly_payment).to eq(1500)
      expect(@car_1.loan_length).to eq(36)
    end

    it '4. Can be painted' do
      expect(@car_1.color).to be nil
      @car_1.paint!(:red)
      expect(@car_1.color).to eq(:red)
    end

    it '5. Has a total cost' do
      expect(@car_1).to respond_to(:total_cost).with(0).argument
      expect(@car_1).to eq(54000)
    end
  end

  describe 'iteration 2' do
    it '1. Dealership Instantiation' do
      expect(Dealership).to respond_to(:new).with(2).argument
      expect(@dealership).to be_an_instance_of(Dealership)
    end

    it '2. Dealership #inventory' do
      expect(@dealership).to respond_to(:inventory).with(0).argument
      expect(@dealership.inventory).to eq([])
    end

    it '3. Dealership #add_car' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_1)

      expect(@dealership).to respond_to(:add_car).with(1).argument
      expect(@dealership.inventory).to eq([@car_1, @car_2])
    end

    it '4. counts' do
      expect(@dealership.inventory_count).to eq(0)

      @dealership.add_car(@car_1)
      @dealership.add_car(@car_1)

      expect(@dealership.inventory_count).to eq(2)
    end
  end

  describe 'iteration 3' do
     before :each do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
    end

    it '1. Dealership cars by make' do
      expect(@dealership).to respond_to(:cars_by_make).with(1).argument
      expect(@dealership.cars_by_make("Toyota")).to eq([@car_2, @car_3])
      expect(@dealership.cars_by_make(("Chevrolet")).to eq([@car_4])
    end

    it '2. Dealership total value' do
      expect(@dealership).to respond_to(:total_value).with(0).argument
      expect(@dealership.total_value).to eq(156000)
    end

    it '3. Dealership details' do
      expect(@dealership).to respond_to(:details).with(0).argument
      expected = {"total_value" => 156000, "address" => "123 Main Street"}
      expect(@dealership.details).to eq(expected)
    end
  end

  describe 'iteration 4' do
    before :each do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
    end

    it '1. Dealership average price per car' do
      expect(@dealership).to respond_to(:average_price_of_car).with(0).argument
      expect(@dealership.average_price_of_car).to eq("39,000")
    end

    it '2. Dealership cars sorted by price' do
      expected = [@car_3, @car_4, @car_2, @car_1]

      expect(@dealership).to respond_to(:cars_sorted_by_price).with(0).argument
      expect(@dealership.cars_sorted_by_price).to eq(expected)
    end

    it '3. Dealership inventory hash' do
      expected = {
        "Ford" => [@car_1],
        "Toyota" => [@car_2, @car_3],
        "Chevrolet" =>[@car_4],
      }

      expect(@dealership).to respond_to(:inventory_hash).with(0).argument
      expect(@dealership.inventory_hash).to eq(expected)
    end
  end
end
