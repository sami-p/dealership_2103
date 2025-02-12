class Dealership
  attr_reader :name,
              :address,
              :inventory

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.count
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    if @inventory.count == 0
      false
    else true
    end
  end

  def cars_by_make(make)
    selected_inventory = []
    @inventory.map do |car|
      if car.make == make
        selected_inventory << car
      end
    end
    return selected_inventory
  end

  def total_value
    value = 0
    @inventory.each do |car|
      value += car.total_cost
    end
    return value
  end

  def details
    details = {
                "address" => @address,
                "total_value" => total_value
              }
  end

  def average_price_of_car
    price = total_value / @inventory.length
    average = price.to_s
    average.reverse.scan(/\d{3}|.+/).join(",").reverse
  end

  def cars_sorted_by_price
    @inventory.sort_by { |car| car.total_cost }
  end

  def inventory_hash
    hash = {}
    @inventory.each do |car|
      hash[car.make] = cars_by_make(car.make)
    end
    hash
  end
end
