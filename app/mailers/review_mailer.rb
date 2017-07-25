class ReviewMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def new_review(review)
    @review = review
    @url = 'http://example.com/review'

    mail(
      to: review.restaurant.user.email,
      subject: "New Review for A Site #{review.restaurant.name}"
    )
  end
end
