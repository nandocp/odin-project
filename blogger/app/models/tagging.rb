class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :article
end

# An article has a list of tags through the relationship
# of taggings.