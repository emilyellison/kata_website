require 'spec_helper'

describe "simple company website" do
  it "should display a company logo on each page" do
    pending "verify an element exist on each page named logo.jpg"
  end

  it "should show a picture of the company building on the front page" do
    pending "verify an element exist on the front page named building.jpg"
  end

  it "should display text about the company on the front page" do
    pending "verify a paragraph with id='about our company' is on front page"
  end

  context "should have three pages home, about, contact" do
    it "a home page" do
      get simple_website_home_path
      p response
      
      assert_select 'h1', :text => "Hi... I'm alive!"
      response.status.should be(200)
    end
    it "assigns an instance variable" do
      get simple_website_home_path
      assigns(:title).should eq('My Title is Something Clever')
    end
    xit "an about page"
    xit "and a contact form"
  end

  it "should have a name,email and comments field" do
    pending "code here verifies presence of each field"
  end
end