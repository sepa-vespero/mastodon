# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :current_account, :record

  def initialize(current_account, record)
    @current_account = current_account
    @record          = record
  end

  delegate :admin?, :moderator?, :staff?, to: :current_user, allow_nil: true

  private

  def current_user
    current_account&.user
  end
end
