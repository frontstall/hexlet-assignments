# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'opens all bulletins page' do
    get bulletins_path

    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'opens bulletin page' do
    bulletin = bulletins(:bulletin1)
    get bulletin_path(bulletin)

    assert_response :success
    assert_select 'h1', bulletin.title
    assert_select 'p', bulletin.body
  end
end
