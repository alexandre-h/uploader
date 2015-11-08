require 'rails_helper'

RSpec.describe FileImport, type: :model do
  it "Should be a correct data" do
     FactoryGirl.create(:file_import)
    expect(CorrectList.count).to eq(1)
  end

  it "Should not be valid e email" do
    data = FactoryGirl.create(:file_import, email: "sds===dsqd@test.com")
    expect(data.refused_reason).to eq("email format invalid")
  end

  it "Should save only one record in the correct list and set an error" do
    FactoryGirl.create(:file_import)
    data2 = FactoryGirl.create(:file_import)
    expect(CorrectList.count).to eq(1)
    expect(data2.refused_reason).to eq("Error mail, first name and last name duplicated")
  end

  it "Should save the record one time if first and last name are unique" do
    FactoryGirl.create(:file_import)
    data2 = FactoryGirl.create(:file_import, email:"testemail@test.com")
    expect(CorrectList.count).to eq(1)
    expect(data2.refused_reason).to eq("Already have this user")
  end

  it "Should not save if the first name  et/or last nama are < 3 " do
    data1 =FactoryGirl.create(:file_import, first_name: "if")
    FactoryGirl.create(:file_import, first_name:"alex",email:"testemail1@test.com")
    FactoryGirl.create(:file_import, email:"testemail2@test.com")
    data2 =FactoryGirl.create(:file_import, last_name: "of",email:"testemail3@test.com")

    expect(CorrectList.count).to eq(2)
    expect(data1.refused_reason).to eq("first or/and last name too short")
    expect(data2.refused_reason).to eq("first or/and last name too short")
  end
end
