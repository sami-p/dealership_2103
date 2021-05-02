require 'rspec'
require './lib/car'

RSpec.describe Car do
  describe '#initialize' do
    it 'exists' do
      car = Car.new("Ford Mustang", 1500, 36)

      expect(car).to be_an_instance_of(Car)
    end

    it '#make_model' do
      car = Car.new("Ford Mustang", 1500, 36)

      expect(car.make).to eq("Ford")
      expect(car.model).to eq("Mustang")
    end

    it '#monthly_payment' do
      car = Car.new("Ford Mustang", 1500, 36)

      expect(car.monthly_payment).to eq(1500)
    end

    it '#loan_length' do
      car = Car.new("Ford Mustang", 1500, 36)

      expect(car.loan_length).to eq(36)
    end
  end

  describe '#total_cost' do
    it 'calculates total cost' do
      car = Car.new("Ford Mustang", 1500, 36)

      expect(car.total_cost).to eq(54000)
    end
  end

  describe '#color' do
    it 'defaults color to nil' do
      car = Car.new("Ford Mustang", 1500, 36)

      expect(car.color).to eq(nil)
    end

    it 'can paint car and change color' do
      car = Car.new("Ford Mustang", 1500, 36)

      car.paint!(:blue)

      expect(car.color).to eq(:blue)
    end
  end
end
