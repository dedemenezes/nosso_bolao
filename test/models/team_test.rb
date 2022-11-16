require "test_helper"

class TeamTest < ActiveSupport::TestCase
  test 'expiration at cannot be in the past' do
    swst = Sweepstake.new(starting_at: Date.today, ending_at: Date.today - 1)
    swst.valid?
    assert_includes swst.errors, :ending_at
    assert_includes swst.errors.full_messages, "Ending at can't be in the past"
  end
  test 'starting at cannot be greater than ending at' do
    swst = Sweepstake.new(starting_at: Date.today + 2, ending_at: Date.today + 1)
    swst.valid?
    assert_includes swst.errors, :starting_at
    assert_includes swst.errors.full_messages, "can't be greater than ending_at "
  end
end
