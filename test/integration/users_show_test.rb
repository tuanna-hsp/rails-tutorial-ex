require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @activated_user = users(:archer)
    @unactivated_user = users(:lana)
  end

  test 'try to access activated-user page' do
    get user_path(@activated_user)
    assert_template 'users/show'
  end

  test 'try to access unactivated-user page' do
    get user_path(@unactivated_user)
    follow_redirect!
    assert_template 'static_pages/home'
  end
end
