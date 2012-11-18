class Movie < ActiveRecord::Base
  RATINGS = %w[G PG PG-13 NC-17 R]
  validates :title, :presence => true
  validates :release_date, presence: true
  #validate :released_1930_or_later
  #validates :rating, inclusion: {in: RATINGS}, unless: :grandfathered?
  #def released_1930_or_later
  #  errors.add(:release_date, 'must be 1930 or later') if
  #    self.release_date < Date.parse('1 Jan 1930')
  #end
  #def grandfathered?
  #  self.realease_date >= @@grandfathered_date
  #end
end
