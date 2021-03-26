require 'action_view'

class Cat < ApplicationRecord

  include ActionView::Helpers::DateHelper

  CAT_COLORS = ['green', 'purple', 'invisible', 'rainbow']

  validates :birth_date, :descrition, :name, presence:true
  validates :color, inclusion: { in: CAT_COLORS}, presence:true
  validates :sex, inclusion: {in: ['M', 'F']}, presence:true

  def age
    time_ago_in_words(self.birth_date) 
    # Time.now - self.birthdate
  end


end
