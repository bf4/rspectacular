begin
  require 'sidekiq/testing'

  RSpec.configure do |config|
    config.before(:each) do |example|
      # Clears out the jobs for tests using the fake testing
      Sidekiq::Worker.clear_all

      if example.metadata[:queue] == :stub
        Sidekiq::Testing.fake!
      elsif example.metadata[:queue] == :immediately_execute
        Sidekiq::Testing.inline!
      elsif example.metadata[:type] == :feature
        Sidekiq::Testing.inline!
      else
        Sidekiq::Testing.fake!
      end
    end
  end
rescue LoadError
end
