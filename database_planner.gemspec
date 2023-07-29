require_relative 'lib/database_planner/version'

Gem::Specification.new do |spec|
  spec.name        = 'database_planner'
  spec.version     = DatabasePlanner::VERSION
  spec.authors     = ['Guillaume Zeldine']
  spec.email       = ['g.zeldine@hotmail.fr']
  spec.homepage    = 'https://rubygems.org/gems/example'
  spec.summary     = 'Summary of DatabasePlanner.'
  spec.description = 'Description of DatabasePlanner.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/LovlsGenesis/table_mapper'
  spec.metadata['changelog_uri'] = 'https://github.com/LovlsGenesis/table_mapper/changelog'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 7.0.6'
end
