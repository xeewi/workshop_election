require 'test_helper'

class CandidatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get candidats_index_url
    assert_response :success
  end

end
