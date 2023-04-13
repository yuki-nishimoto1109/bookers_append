class Book < ApplicationRecord
  belongs_to :user
	validates :title,presence:true
	validates :body,presence:true,length:{maximum:200}

	scope :search_by_keyword, -> (keyword, regular) {
    if keyword.present?
        case regular
          when "1" then where("books.title LIKE :keyword", keyword: "#{sanitize_sql_like(keyword)}")
          when "2" then where("books.title LIKE :keyword", keyword: "#{sanitize_sql_like(keyword)}%")
          when "3" then where("books.title LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}")
          else where("books.title LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%")
        end
    else
      all
    end
  }

end
