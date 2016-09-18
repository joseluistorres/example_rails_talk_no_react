require 'test_helper'

class MachineDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @machine_datum = machine_data(:one)
  end

  test "should get index" do
    get machine_data_url
    assert_response :success
  end

  test "should get new" do
    get new_machine_datum_url
    assert_response :success
  end

  test "should create machine_datum" do
    assert_difference('MachineDatum.count') do
      post machine_data_url, params: { machine_datum: { name: @machine_datum.name, preread_json: @machine_datum.preread_json } }
    end

    assert_redirected_to machine_datum_url(MachineDatum.last)
  end

  test "should show machine_datum" do
    get machine_datum_url(@machine_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_machine_datum_url(@machine_datum)
    assert_response :success
  end

  test "should update machine_datum" do
    patch machine_datum_url(@machine_datum), params: { machine_datum: { name: @machine_datum.name, preread_json: @machine_datum.preread_json } }
    assert_redirected_to machine_datum_url(@machine_datum)
  end

  test "should destroy machine_datum" do
    assert_difference('MachineDatum.count', -1) do
      delete machine_datum_url(@machine_datum)
    end

    assert_redirected_to machine_data_url
  end
end
