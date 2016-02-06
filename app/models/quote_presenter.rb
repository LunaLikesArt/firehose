class QuotePresenter
  def self.for(quote)
    new(quote)
  end

  def initialize(quote)
    @quote = quote
  end

  def saying
    quote.saying
  end

  def author
    quote.author
  end

  def id
    quote.id
  end

  def next_quote
    if last_quote?
      get_first_quote
    else
      get_next_quote
    end
  end

  def previous_quote
    if first_quote?
      get_last_quote
    else
      get_previous_quote
    end
  end

  private

  attr_reader :quote

  def get_first_quote
    Quote.all.first
  end

  def get_previous_quote
    Quote.where("id <= ? ", id).order("id desc").limit(2).last
  end

  def get_last_quote
    Quote.all.last
  end

  def get_next_quote
    Quote.where("id >= ? ", id).order(:id).limit(2).last
  end

  def last_quote?
    Quote.order(:id).last.id == id
  end

  def first_quote?
    Quote.all.order(:id).first.id == id
  end
end
