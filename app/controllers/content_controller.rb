class ContentController < ApplicationController
  def youtube
     parameters = params[:youtube_search]
     puts parameters
     parameter = parameters.delete('<div id="value">','</div>')
     @videos = client_youtube.videos_by(:query => parameter , :page => 2, :per_page => 15)
     @video =  @videos.videos
       respond_to do |format|
         format.json
         format.js 
       end
  end

  def vimeo
  end

  def wikipedia
  end

  def orkut
  end

  def khanacademy
  end
end
