class Car
  attr_reader :make,
              :model,
              :monthly_payment,
              :loan_length

  def initialize(make_model, monthly_payment, loan_length)
    @make_model = make_model
    @make = make_model.split.first
    @model = make_model.split.last
    @monthly_payment = monthly_payment
    @loan_length = loan_length
  end
end
