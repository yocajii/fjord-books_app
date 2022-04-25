# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url

    assert_selector 'h1', text: '日報'
    within 'table' do
      assert_text '猫1日目'
      assert_text 'アリス'
    end
  end

  test 'creating a Report' do
    visit reports_url
    click_link '新規作成'

    fill_in 'タイトル', with: '猫3日目'
    fill_in '内容', with: '爪を切った'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text '猫3日目'
    assert_text '爪を切った'
    assert_text 'アリス'
  end

  test 'updating a Report' do
    visit reports_url
    within 'table' do
      click_link '編集', match: :first
    end

    fill_in 'タイトル', with: '猫2日目'
    fill_in '内容', with: 'ブラッシングして紐で遊んだ'
    click_button '更新する'

    assert_text '日報が更新されました。'
    assert_text '猫2日目'
    assert_text 'ブラッシングして紐で遊んだ'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_link '削除', match: :first
    end
    take_screenshot
    assert_text '日報が削除されました。'
    assert_no_text '猫1日目'
  end
end
