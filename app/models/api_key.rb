class ApiKey < ActiveRecord::Base
  before_validation :generate_api_key
  belongs_to :user

  private

  def generate_api_key
    self.api_key ||= SecureRandom.hex
  end
end
