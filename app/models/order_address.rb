class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :addresses, :building, :phone_number
end