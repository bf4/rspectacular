require 'active_record'

begin
  require 'factory_girl'
rescue LoadError
end

rails_database_yaml_file_path         = File.expand_path('../config/database.yml',       __FILE__)
rails_engine_database_yaml_file_path  = File.expand_path('../dummy/config/database.yml', __FILE__)

database_yaml_file_path               = if File.exist? rails_engine_database_yaml_file_path
                                          rails_engine_database_yaml_file_path
                                        else
                                          rails_database_yaml_file_path
                                        end

connection_info                       = YAML.load_file(database_yaml_file_path)['test']

ActiveRecord::Base.establish_connection(connection_info)

Dir[File.expand_path('../factories/**/*.rb', __FILE__)].each { |f| require f }
Dir[File.expand_path('../support/**/*.rb',   __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.order = 'random'
  config.color = true

  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end
end