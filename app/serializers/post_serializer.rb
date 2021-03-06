class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :created_at, :poster, :dateTimeFormat
  has_many :comments
  # include comments data at the root level and the comments ids
  # keeps the comments data separate and used when needed
  # embed :ids, include: true
  # has_one :user, root: :poster

  # returns poster name as a string instead of an object
  def poster
    object.user.name
  end 

  def dateTimeFormat
    self.created_at.strftime('%B %d, %Y %H:%M:%S %p')
  end
end
