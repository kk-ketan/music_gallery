class MusicsController < ApplicationController

  before_action :authenticate_user!

  def index
    @musics= current_user.musics.all
    @ketan=@musics.ransack(params[:ketan])
    @musics=@ketan.result(distinct:true)
  end


  def create
   
    @music= current_user.musics.new(music_params)
    
    if @music.save
      redirect_to musics_path
    else
      render :new, status: :unprocessable_entity
    end


  end

  def new
    @music = current_user.musics.new
  end

  def show
     
    @music = Music.find(params[:id])
  end

  def edit
    begin
    @music =current_user.musics.find(params[:id])
  rescue StandardError
    @message = 'You are not authenticated to edit this album'
  end
  end

  def update
   begin
    @music = current_user.musics.find(params[:id])

    if @music.update(music_params)
      redirect_to musics_path
    else
      render :new, status: :unprocessable_entity
   end

  rescue StandardError
    @message = 'You are not authenticated to edit this album'
  end

  end
  

 
  def destroy

    
  
    @music = Music.find(params[:id])
  
    @music.destroy
   
    redirect_to musics_path

  end

  



  def purge_audio
    
  
      @music = current_user.musics.find(params[:id])
      @audio = @music.audios.find(params[:audio_id])
      @audio.purge
      redirect_to @music, notice: "Audio deleted successfully"
   
  end

 

 


  private
  def music_params
    params.require(:music).permit(:audioname, :description,  :published, :cover, :all_tags, audios: [])
  end
 
end