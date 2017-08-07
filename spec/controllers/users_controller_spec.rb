require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe "GET /users" do
    before do
      @user = User.create!(first_name: "Dan", last_name: "Garland")

      get :index, :format => :json
    end

    it "returns 200" do
      expect(response.status).to eq(200)
    end

    it "returns Json" do 
      expect(response.content_type).to eq('application/json')
      expect{ JSON.parse(response.body) }.not_to raise_exception
      user_json = JSON(response.body)[0]
      expect(user_json["first_name"]).to eq "Dan"
      expect(user_json["last_name"]).to eq "Garland"
    end
  end

  describe "GET /users/:id" do
    before do
      @user = User.create!(first_name: "Dan", last_name: "Garland")
      get :show, params: {:id => @user.id}, :format => :json
    end

    it "returns 200" do
      expect(response.status).to eq(200)
    end

    it "returns JSON" do 
      expect(response.content_type).to eq('application/json')
      expect{ JSON(response.body) }.not_to raise_exception
      user_json = JSON(response.body)
      expect(user_json["first_name"]).to eq "Dan"
      expect(user_json["last_name"]).to eq "Garland"
    end
  end

  describe "UPDATE /users" do
    before do
      @user = User.create!(first_name: "Dan", last_name: "Garland")
      @updated = {first_name: "Sophie", last_name: "Figgis"}
      put :update, params: {:id => @user.id, :user => @updated}, :format => :json
    end

    it "returns 200" do
      expect(response.status).to eq(200)
    end

    it "returns JSON" do 
      expect(response.content_type).to eq('application/json')
      expect{ JSON(response.body) }.not_to raise_exception
      user_json = JSON(response.body)
      expect(user_json["first_name"]).to eq "Sophie"
      expect(user_json["last_name"]).to eq "Figgis"
    end
  end

  describe "DELETE /users" do
    before do
      @user = User.create!(first_name: "Dan", last_name: "Garland")
      delete :destroy, params: {:id => @user.id}, :format => :json
    end

    it "returns 200" do
      expect(response.status).to eq(204)
    end

    it "returns nothing" do 
      expect(response.body).to eq ""
      expect(User.count).to eq(0)
    end
  end

end
