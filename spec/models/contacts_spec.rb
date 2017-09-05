require 'rails_helper'

describe Contact do
  # 名前、メアド、内容があればエラーが発生しないこと
  it "is valid with data" do
    contact = Contact.new(name: 'testName', email: 'akira.kubotera+test@gmail.com',content:'testContent')
    expect(contact).to be_valid
  end

  # 名前がないとエラーが発生すること
  it "is invalid without a name" do
    contact = Contact.new(name: '', email: 'akira.kubotera+test@gmail.com',content:'testContent')
    expect(contact).not_to be_valid
  end

  # メアドがないとエラーが発生すること　
  it "is invalid without a mail" do
    contact = Contact.new(name: 'testName', email: '',content:'testContent')
    expect(contact).not_to be_valid
  end
  # 内容がないとエラーが発生すること
  it "is invalid without a content" do
    contact = Contact.new(name: 'testName', email: 'akira.kubotera+test@gmail.com',content:'')
    expect(contact).not_to be_valid
  end

  #エラーメッセージ name
  it "is valid with title" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:name]).to include("を入力してください")
  end
  #エラーメッセージ email
  it "is valid with title" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:email]).to include("を入力してください")
  end
  #エラーメッセージ conent
  it "is valid with title" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:content]).to include("を入力してください")
  end
end
