class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  end

  validates :price, presence: true, numericality: {
    with: /\A[0-9]+\z/, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9_999_999, 
    message: 'is out of setting range' }

  with_options numericality: { other_than: 0, message: "を選択してください" } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_date_id
    validates :prefecture_id
  end
  
end
