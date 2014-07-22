RSpec.configure do |config|
  config.before(:each) do
    FactoryGirl.reload
  end
end