class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_librarian

  after_destroy :destroy_librarian
  private
    def create_librarian
      Librarian.create!(email: self.email)
    end
    def destroy_librarian
      Librarian.where(email: self.email).destroy_all
    end
end
