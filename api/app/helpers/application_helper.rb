# frozen_string_literal: true

module ApplicationHelper

  def status_to_icon(status)
    case status
    when "enqueued"
      "schedule"
    when "downloading"
      "hourglass_empty"
    when "success"
      "check_circle_outline"
    when "error"
      "error"
    end
  end
end

