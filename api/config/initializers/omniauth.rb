# frozen_string_literal: true

opts = { scope: "user:email" }

Rails.application.config.middleware.use OmniAuth::Builder do
  credentials = if Rails.env.production?
                  Rails.application.credentials.production
                else
                  Rails.application.credentials.development
  end

  provider :github, credentials[:github_client_id], credentials[:github_client_secret], opts
end
