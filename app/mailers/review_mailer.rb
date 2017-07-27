class ReviewMailer < ApplicationMailer
  default from: 'postmaster@sandbox3ee2af90cb214e488b94195339f6c579.mailgun.org'
  def new_review(review)
    @review = review
    mail to: "burgrco@gmail.com", subject: "Success! You did it."

  end
end
