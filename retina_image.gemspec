$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "retina_image/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "retina_image"
  s.version     = RetinaImage::VERSION
  s.authors     = ["Palm Stable"]
  s.email       = ["songsukeja@gmail.com"]
  s.homepage    = "https://github.com/retina_image"
  s.summary     = "Retina Image supports high resolution images"
  s.description = "A simple retina image tag"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
