module RailsDb
  class Engine < ::Rails::Engine
    isolate_namespace RailsDb
    config.autoload_paths += Dir["#{config.root}/lib"]

    initializer 'rails_db.assets_precompile', :group => :all do |app|
      app.config.assets.paths << root.join("test", "dummy", "public", "assets")
    end

    initializer 'rails_db.helpers' do
      ActiveSupport.on_load :action_view do
        include RailsDb::Helpers
      end
    end
  end
end