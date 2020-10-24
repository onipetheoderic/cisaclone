module Blog
  class PostStateMachine
    include Statesman::Machine
    include Statesman::Events

    state :submitted_for_review, initial: true
    state :in_review
    state :rejected
    state :approved
    state :published

    event :review do
      transition from: :submitted_for_review, to: :in_review
    end

    event :approve do
      transition from: :in_review, to: :approved
    end

    event :publish do
      transition from: :approved, to: :published
    end

    event :reject do
      transition from: :in_review, to: :rejected
    end

    guard_transition(from: :approved, to: :published) do |post|
      !post.declined?
    end

    after_transition(to: :published) do |post,transition|
      #send mail to owner
    end

    after_transition(to: :rejected) do |post,transition|
      #send rejected email
    end

    after_transition(to: :in_review) do |post, transition|
      #send review notification
    end

  end

end
