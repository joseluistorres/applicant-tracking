require 'test_helper'

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_position = job_positions(:ror_senior_developer)
    @applicant = applicants(:one)
  end

  test "should get index" do
    get applicants_url
    assert_response :success
  end

  test "should get new" do
    get new_applicant_url(job_position_id: @job_position.id)
    assert_response :success
  end

  test "should get create" do
    assert_difference('Applicant.count') do
      post(
        applicants_url,
        params: {
          applicant: {
            first_name: "Johnny",
            last_name: "Torres",
            email: "jtorres@somewhere.com",
            bio: "something random",
            date_applied: DateTime.now,
            job_position_id: @job_position.id
          }
        })
    end

    assert_redirected_to applicant_url(Applicant.last)
  end

  test "should show applicant" do
    get applicant_url(@applicant)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicant_url(@applicant)
    assert_response :success
  end

  test "should get update" do
    patch(
      applicant_url(@applicant),
      params: {
        applicant: {
          first_name: "Sandi",
          last_name: "Metz"
        }
      })
    assert_redirected_to applicant_url(@applicant)
  end

  # test "should get destroy" do
  #   get applicants_destroy_url
  #   assert_response :success
  # end

end
