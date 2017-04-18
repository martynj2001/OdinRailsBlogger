class Article < ApplicationRecord
	#Delcare the one-many relationship with Comments
	has_many :comments
end
