class UserVideosController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:uploads]

  def uploads
    first = params[:files].first if params[:files]
    # debugger
    # first.path  # save file
    # first.original_filename # filename
    # first.content_type
    # first.size

    json_data = { 
      files:
      [
        {
          name: first.original_filename,
          url: "http://url.to/file/or/page",
          thumbnail_url: "http://url.to/thumnail.jpg ",
          type: first.content_type,
          size: first.content_type,
          delete_url: "http://url.to/delete /file/",
          delete_type: "DELETE"
        }
      ]
    }        
    render json: json_data
  end
end
