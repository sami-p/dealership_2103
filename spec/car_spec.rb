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
end
