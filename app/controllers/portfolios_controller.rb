class PortfoliosController < ApplicationController
  before_action :portfolio_select, only: %i[show edit]
  access all: %i[show index react], user: { except: %i[destroy create new update edit] }, site_admin: :all
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  # This doesn't currently exist, but is an example of scope etc
  def react
    @react = Portfolio.react
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio.save!
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is live!' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    portfolio_select
  end

  def edit
    portfolio_select
  end

  def update
    portfolio = portfolio_select
    respond_to do |format|
      if portfolio.update!(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated!' }
      else
        format.html { redirect_to :edit }
      end
    end
  end

  def destroy
    portfolio = portfolio_select
    portfolio.destroy!
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end

  private

  def build
    3.times { @portfolio.technologies.build }
  end

  def portfolio_select
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:name])
  end
end
