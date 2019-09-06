class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email

  RATINGS = {
    'One Star': '1_Star',
    'Two Stars': '2_Stars',
    'Three Stars': '3_Stars',
    'Four Stars': '4_Stars',
    'Five Stars': '5_Stars'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end

  def send_comment_email
    NotificationMailer.comment_added(self).deliver_now
  end
end