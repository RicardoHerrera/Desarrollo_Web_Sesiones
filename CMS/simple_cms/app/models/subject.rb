class Subject < ApplicationRecord

  acts_as_list

  has_many :pages

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

  # validates :name, presence: true
  # validates_presence_of :name
  # validates_length_of :name, :maximum => 250

  validates :name, presence: true,
                  length: { maximum: 250 }

end
