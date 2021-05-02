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
end
