class CommentResource < ApplicationResource
  attribute :body, :string
  attribute :commenter_id, :integer
  attribute :photo_id, :integer
end
