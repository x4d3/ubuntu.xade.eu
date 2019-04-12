# frozen_string_literal: true

class YoutubeController < ApplicationController
  before_action :logged_in_user

  def logged_in_user
    redirect_to root_path unless current_user
  end

  def download
    youtube_download = current_user.youtube_downloads.create(url: params[:url], is_audio: params[:is_audio])
    YoutubeDownloadWorker.perform_async(youtube_download.id)
    redirect_to action: "index"
  end

  def index
    @youtube_downloads = current_user.youtube_downloads
  end

  def get
    youtube = current_user.youtube_downloads.find_by!(uid: params[:id])
    send_file(
      youtube.file_path,
      filename: youtube.filename + "." + youtube.extension,
      type: youtube.http_type
    )
  end

  def destroy
    youtube = current_user.youtube_downloads.find(params[:id])
    youtube.destroy
    redirect_to action: "index"
  end

end
