class Book < ApplicationRecord
  validates_presence_of :title, :pages, :published, :image

  has_many :author_books, dependent:  :destroy
  has_many :authors, through: :author_books
  has_many :reviews, dependent:  :destroy

  def reviews_count
    reviews.count(:id)
  end

  def rating_avg
    reviews.average(:rating)
  end

  def list_authors
    authors.map{|author| author.name}.compact.join(", ")
  end

  def co_authors(input_author)
    co_author = authors.map do |author|
      author.name unless author.id == input_author.id
    end.compact.join(", ")

    co_author.empty? ? "None" : co_author
  end
end
