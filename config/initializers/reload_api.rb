if Rails.env.development?
  ActiveSupport::Dependencies.explicitly_unloadable_constants << 'API::V1'

  api_files = Dir[Rails.root.join('controllers', 'app', 'api', '**', '*.rb')]
  api_reloader = ActiveSupport::FileUpdateChecker.new(api_files) do
    Rails.application.reload_routes!
  end
  ActionDispatch::Callbacks.to_prepare do
    api_reloader.execute_if_updated
  end
end