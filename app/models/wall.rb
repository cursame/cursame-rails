class Wall < ActiveRecord::Base
  belongs_to :publication, :polymorphic => true

  has_many :userpublicationings, :dependent => :destroy
  has_many :users, :through => :userpublicationings
  has_many :coursepublicationings, :dependent => :destroy
  has_many :courses, :through => :coursepublicationings

  belongs_to :network
  belongs_to :course

  acts_as_commentable
  acts_as_votable

  def self.search(search,id)
    if search != nil
      query = "publication_type LIKE '%"+search+"%'"
      query += id ?  " and publication_id = "+id.to_s : ' '
      where(query)
    else
      scoped
    end
  end
end
