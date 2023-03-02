require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test 'will send contact email to admin' do
    email = 'test@email'
    subject = 'test subject'
    message = 'test message'

    email = ContactMailer.with(email:, subject:, msg: message).contact_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal email.to, ['first.object.oriented@gmail.com']
    assert_equal email.from, ['first.object.oriented@gmail.com']
    assert_includes email.subject, "You've got mail."
    assert_equal read_fixture('contact_email.html').join, email.body.to_html
  end
end
