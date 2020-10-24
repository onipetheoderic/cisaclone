class Post < ApplicationRecord
  include Statesman::Adapters::ActiveRecordQueries
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :owner, :class_name => 'User'
  belongs_to :approved_by, :class_name => 'User'


  has_many :post_transitions, autosave: false

  def state_machine
    @state_machine ||= Blog::PostStateMachine.new(self,transition_class: PostTransition)
  end

  def declined?
    declined
  end

  def self.transition_class
    PostTransition
  end

  def self.initial_state
    :submitted_for_review
  end

  private_class_method :initial_state

  delegate :can_transition_to?,:available_events, :transition_to!, :transition_to, :current_state, :trigger,
           to: :state_machine
end
