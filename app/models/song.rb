class Song < ActiveRecord::Base

  validates :title, :artist, presence: true, length: {minimum: 2}
  validates :title, uniqueness: true

  has_many :playlist_adds
  has_many :users, through: :playlist_adds

  def users_that_added

    User.joins(:playlist_adds).select('users.id, users.first_name, users.last_name, COUNT(*) as times_added').where('playlist_adds.song_id = ?', self.id).group('users.id').order('times_added desc')

  end

end