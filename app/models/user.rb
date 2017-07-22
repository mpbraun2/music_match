EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i

class User < ActiveRecord::Base
  has_secure_password
  before_validation :downcase_email
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX, message: "is invalid" }

  has_many :playlist_adds
  has_many :songs, through: :playlist_adds

  def songs_with_count

    Song.joins(:playlist_adds).select('songs.id, songs.title, songs.artist, COUNT(*) as count').where('playlist_adds.user_id = ?', self.id).group('songs.id').order('count desc')

  end

  private
    def downcase_email
      self.email.downcase!
    end



end