require "test_helper"

class MessageMailerTest < ActionMailer::TestCase
  test "message_created" do
    mail = MessageMailer.message_created
    assert_equal "Message created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
