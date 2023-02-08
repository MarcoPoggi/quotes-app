class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  def index
    @quotes = Quote.ordered_newest
  end

  # GET /quotes/:id
  def show; end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end
  
  # POST /quotes/
  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @quote.destroy
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote successfully deleted." }
        format.turbo_stream
      end
    else
      render quotes_path, status: :unprocessable_entity
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end