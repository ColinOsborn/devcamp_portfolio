class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.react
    where(subtitle: 'React')
  end

  def self.by_position
    order('position ASC')
  end
end
