Gem::Specification.new do |s|
    s.name        = "tivitylog"
    s.version     = "0.0.0"
    s.summary     = "creates a log of actions"
    s.description = "commandline tool to track basic system commands"
    s.authors     = ["Philip Becker"]
    s.email       = "philiprbecker@gmail.com"
    s.files        = Dir["{lib}/**/*.rb", "bin/*", "*.md"]
    s.require_path = 'lib'
    s.homepage    = 'https://github.com/erluti/tivitylog'
    s.executables << "tivitylog"

    s.add_development_dependency "rspec"
  end