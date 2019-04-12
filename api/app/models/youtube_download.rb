# frozen_string_literal: true

class YoutubeDownload < ApplicationRecord
  belongs_to :user
  include HasUid

  set_uid_constants "te42gl08khuy61zrwbaiscd953nqofmj7xpv", 100_000

  after_initialize :init
  after_create :generate_uid
  before_destroy :delete_file

  def init
    self.status ||= "enqueued"
  end

  def extension
    is_audio ? "mp3" : "mp4"
  end

  def file_prefix
    Rails.root.join("tmp", "videos", id.to_s)
  end

  def file_path
    "#{file_prefix}.#{extension}"
  end

  def http_type
    is_audio ? "audio/mp3" : "video/mp4"
  end

  def download
    update_attributes(status: "downloading")
    options = {
      output: "#{file_prefix}.%(ext)s"
    }
    YoutubeDL::Video.get(url, options)

    if is_audio
      options[:audio_format] = "mp3"
      options[:extract_audio] = true
    else
      options[:format] = "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"
    end
    result = YoutubeDL.download url, options
    update_attributes(filename: result.information[:fulltitle], status: "success")
  rescue StandardError => e
    update_attributes(error: e.message, status: "error")
  end

  def delete_file
    File.delete(file_path) if File.exist?(file_path)
  end

end
