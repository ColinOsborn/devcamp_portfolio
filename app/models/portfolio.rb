class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  after_initialize :set_defaults

  def self.react
    where(subtitle: 'React')
  end

  def set_defaults
    self.main_image ||= 'http://via.placeholder.com/600x400'
    self.thumb_image ||= 'http://via.placeholder.com/350x200'
  end
end
