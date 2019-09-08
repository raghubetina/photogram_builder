class CommentResource < ApplicationResource
  attribute :body, :text
  attribute :commenter_id, :integer
  attribute :photo_id, :integer
end
