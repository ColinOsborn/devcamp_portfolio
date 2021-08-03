class PortfoliosController < ApplicationController

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

  private

  def portfolio_select
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end
end
