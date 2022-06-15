require "sidekiq/cron/web_extension"
require "sidekiq/cron/job"

if defined?(Sidekiq::Web)
  Sidekiq::Web.register Sidekiq::Cron::WebExtension

  if Sidekiq::Web.tabs.is_a?(Array)
    # For sidekiq < 2.5
    Sidekiq::Web.tabs << "old_cron"
  else
    Sidekiq::Web.tabs["OldCron"] = "old_cron"
  end
end
