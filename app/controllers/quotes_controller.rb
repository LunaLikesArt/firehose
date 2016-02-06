class QuotesController < ApplicationController

  def index
    quote = Quote.order("RANDOM()").first

    @quote_presenter = QuotePresenter.for(quote)
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Oops..</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end

  def show
    quote = Quote.find(params[:id])
    @quote_presenter = QuotePresenter.for(quote)

    render "index"
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end