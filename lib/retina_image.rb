require 'retina_image/version'

module RetinaImage
  class RetinaImageRailtie < ::Rails::Railtie
    config.after_initialize do
      require 'retina_image/view_helpers' if defined?(Rails)
    end
  end
end
