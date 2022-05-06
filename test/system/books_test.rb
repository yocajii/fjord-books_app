# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    create(:book, title: '土佐日記', memo: '日記文学', author: '紀貫之')
    alice = create(:user)
    login_as(alice, scope: :user)
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
    assert_text '土佐日記'
    assert_text '日記文学'
    assert_text '紀貫之'
  end

  test 'creating a Book' do
    visit books_url
    click_link '新規作成'

    fill_in 'タイトル', with: '枕草子'
    fill_in 'メモ', with: '随筆'
    fill_in '著者', with: '清少納言'
    click_button '登録する'

    assert_text '本が作成されました。'
    assert_text '枕草子'
    assert_text '随筆'
    assert_text '清少納言'
  end

  test 'updating a Book' do
    visit books_url
    within 'table' do
      click_link '編集', match: :first
    end

    fill_in 'タイトル', with: '徒然草'
    fill_in 'メモ', with: '随筆'
    fill_in '著者', with: '兼好法師'
    click_button '更新する'

    assert_text '本が更新されました。'
    assert_text '徒然草'
    assert_text '随筆'
    assert_text '兼好法師'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_link '削除', match: :first
    end

    assert_text '本が削除されました。'
    assert_no_text '南総里見八犬伝'
  end
end
