class SongsController < ApplicationController
  def index

    @songs = Song.all.order('created_at desc')

  end

  def show

    @song = Song.find(params[:song_id])

    @users = @song.users_that_added


  end

  def create
    @song = Song.new(title:params[:title], artist:params[:artist])

    unless @song.save
      # flash[:errors] = @song.errors.full_messages
      return render json: {result:"ERROR", errors:@song.errors.full_messages}
    end

    @songs = Song.all.order('created_at desc')

    render partial: 'partials/main_table_body.html.erb'
    # redirect_to '/songs'

  end

  def add

    @song = Song.find(params[:song_id])

    @add = PlaylistAdd.create(user:current_user, song:@song)

    @songs = Song.all.order('created_at desc')

    render partial: 'partials/main_table_body.html.erb'

  end
end
