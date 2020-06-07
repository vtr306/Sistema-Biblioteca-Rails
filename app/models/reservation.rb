class Reservation < ApplicationRecord
  belongs_to :book
  belongs_to :client
  belongs_to :librarian

  after_create :atualize_stock

  private
    def atualize_stock
      self.book.update(stock: book.stock-1)
    end
end
