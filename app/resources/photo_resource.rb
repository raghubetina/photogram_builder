class PhotoResource < ApplicationResource
  attribute :caption, :string
  attribute :image, :string
  attribute :owner_id, :integer
  attribute :location, :string
end
