class PortfoliosController < ApplicationController
  before_action :portfolio_select, only: %i[ show edit ]

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.create!(portfolio_params)
    if @portfolio.save
      format.html { redirect_to portfolios_path, notice: 'Your portfolio item is live!' }
    else
      format.html { render :new }
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
    if portfolio.update!(portfolio_params)
      format.html { redirect_to portfolios_path, notice: 'The record successfully updated!' }
    else
      format.html { redirect_to :edit }
    end
  end

  def destroy
    portfolio = portfolio_select
    portfolio.destroy!
    format.html { redirect_to portfolios_path, notice: 'The record has been deleted'}
  end

  private

  def portfolio_select
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image)
  end
end
