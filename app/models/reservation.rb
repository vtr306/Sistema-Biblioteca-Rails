class Reservation < ApplicationRecord
  belongs_to :book
  belongs_to :client
  belongs_to :librarian
  
  after_create :reduce_stock, :available

  after_destroy :increase_stock

  private
    def reduce_stock
      self.book.update(stock: book.stock-1)
    end
    def increase_stock
      self.book.update(stock: book.stock+1)
    end
    def available
      if self.book.stock < 0
        self.destroy
      end
    end
end
