class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies
  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  after_initialize :set_defaults

  def self.react
    where(subtitle: 'React')
  end

  def set_defaults
    self.main_image ||= Placeholder.image_generator(600, 400)
    self.thumb_image ||= Placeholder.image_generator(350, 200)
  end
end
