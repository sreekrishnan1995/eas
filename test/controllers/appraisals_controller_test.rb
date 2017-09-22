require 'test_helper'

class AppraisalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appraisal = appraisals(:one)
  end

  test "should get index" do
    get appraisals_url
    assert_response :success
  end

  test "should get new" do
    get new_appraisal_url
    assert_response :success
  end

  test "should create appraisal" do
    assert_difference('Appraisal.count') do
      post appraisals_url, params: { appraisal: { attendance: @appraisal.attendance, communication_skills: @appraisal.communication_skills, employee_id: @appraisal.employee_id, inter_personal_skills: @appraisal.inter_personal_skills, leadership: @appraisal.leadership, self_rating: @appraisal.self_rating, technical_skills: @appraisal.technical_skills } }
    end

    assert_redirected_to appraisal_url(Appraisal.last)
  end

  test "should show appraisal" do
    get appraisal_url(@appraisal)
    assert_response :success
  end

  test "should get edit" do
    get edit_appraisal_url(@appraisal)
    assert_response :success
  end

  test "should update appraisal" do
    patch appraisal_url(@appraisal), params: { appraisal: { attendance: @appraisal.attendance, communication_skills: @appraisal.communication_skills, employee_id: @appraisal.employee_id, inter_personal_skills: @appraisal.inter_personal_skills, leadership: @appraisal.leadership, self_rating: @appraisal.self_rating, technical_skills: @appraisal.technical_skills } }
    assert_redirected_to appraisal_url(@appraisal)
  end

  test "should destroy appraisal" do
    assert_difference('Appraisal.count', -1) do
      delete appraisal_url(@appraisal)
    end

    assert_redirected_to appraisals_url
  end
end
