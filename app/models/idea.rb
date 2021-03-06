class Idea < ActiveRecord::Base
  belongs_to :user

  has_many :interests
  has_many :users, through: :ideas

  accepts_nested_attributes_for :interests

  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  :title
  :category
  :content
  :user_id
  :createdDate
  :updatedDate

  def idea_box
    :col_number
    :id
    :title
    :category
    :content
    :user_id
  end

  def idea_box=(box)
    @box = box
  end

end
