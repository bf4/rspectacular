if defined? FactoryGirl
  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
  end
end