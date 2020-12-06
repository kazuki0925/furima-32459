class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, numericality: { only_integer: true, message: 'Half-width number'}
  end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' }
    validates :category_id, numericality: { other_than: 0, message: 'Select' }
    validates :sales_status_id, numericality: { other_than: 0, message: 'Select' }
    validates :shopping_fee_status_id, numericality: { other_than: 0, message: 'Select' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :scheduled_delivery_id, numericality: { other_than: 0, message: 'Select' }

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shopping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
