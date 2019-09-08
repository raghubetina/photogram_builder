class UserResource < ApplicationResource
  attribute :username, :string

  has_many :likes
  has_many :comments
  has_many :sent_follow_requests, :resource => FollowRequestResource
  has_many :received_follow_requests, :resource => FollowRequestResource
  has_many :own_photos, :resource => PhotoResource

  many_to_many :following, :resource => UserResource
  many_to_many :followers, :resource => UserResource
  many_to_many :liked_photos, :resource => PhotoResource
  many_to_many :feed, :resource => PhotoResource
  many_to_many :activity, :resource => PhotoResource
end
