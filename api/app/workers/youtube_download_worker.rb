# frozen_string_literal: true

class YoutubeDownloadWorker
  include Sidekiq::Worker

  def perform(id)
    YoutubeDownload.find(id).download
  end
end
