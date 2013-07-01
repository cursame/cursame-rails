class ContentController < ApplicationController
  def youtube
     parameters = params[:youtube_search]
     @typeo = params[:typeo]
     puts parameters
     parameter = parameters.delete('<div id="value">','</div>')
     @videos = client_youtube.videos_by(:query => parameter , :page => 1, :per_page => 16)
     @video =  @videos.videos
       
       respond_to do |format|
         format.json
         format.js 
       end
  end

  def vimeo
  end
  
  def dropbox
  end
  
  def wikipedia
    require 'open-uri'
    require 'json'
          @variable = params[:search_wikipedia]
          @typeo = params[:typeo]
         
          @mw=  JSON.parse(open("http://en.wikipedia.org/w/api.php?format=json&action=query&titles=#{ @variable }&prop=revisions&rvprop=content").read)
            # no requiere generate sesion se deja anotado el login en caso de que sea necesario un call with ajax
            #login = mw.login('Cursame', '12345678')
            puts = "#{@mw}"
            @page= @mw
               
                
        respond_to do |format|
          format.json
          format.js 
        end
  end

  def orkut
  end

  def khanacademy
  end
end
