require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "message attributes must not be empty" do
  	message = Message.new
  	assert message.invalid?
  	assert message.errors[:content].any?
  	assert message.errors[:user_id].any?
  end
end
