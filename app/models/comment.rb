# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :string
#  body       :text
#  article_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string
#
class Comment < ApplicationRecord
  belongs_to :article

  VALID_STATUSES = [ 'public', 'private', 'archived' ]

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
