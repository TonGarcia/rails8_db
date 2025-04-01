module RailsDb
  class Engine < ::Rails::Engine
    isolate_namespace RailsDb
    config.autoload_paths += Dir["#{config.root}/lib"] # For Ruby code, keep this

    initializer "rails_db.assets" do |app|
      # Check if the host app uses config.assets.paths (like Propshaft)
      if app.config.respond_to?(:assets) && app.config.assets.respond_to?(:paths)
        # Add the engine's app/javascript directory to the host app's asset paths
        # 'config.root' here refers to the engine's root directory
        app.config.assets.paths << config.root.join("app/javascript")

        # Optional: You might also explicitly add app/assets if needed,
        # although Rails usually adds app/assets/** from engines automatically.
        # Explicitly adding might help in some edge cases or ensure precedence.
        # app.config.assets.paths << config.root.join("app/assets")

        # Rails.logger.debug "[RailsDb Engine] Added #{config.root.join('app/javascript')} to asset paths"
      else
        # Log a warning if the expected configuration isn't found
        Rails.logger.warn "[RailsDb Engine] Host application's config.assets.paths not found. Cannot automatically add engine's app/javascript path."
      end
    end

    initializer 'rails_db.helpers' do
      ActiveSupport.on_load :action_view do
        include RailsDb::Helpers
      end
    end

  end
end