module FactoryBotHelper
  include FactoryBot::Syntax::Methods

  # Misusing an internal API, but what can you do?
  # @see https://github.com/thoughtbot/factory_bot/issues/1534
  def create_all(build_class)
    FactoryBot.factories.select { |f| f.build_class == build_class }.each { |f| create(f.name) }
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include FactoryBotHelper
end
