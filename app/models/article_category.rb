class ArticleCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category # belongs_to should be singular

end