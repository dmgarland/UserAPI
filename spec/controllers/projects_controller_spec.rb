require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  render_views

  describe "GET /projects" do
    before do
      @user = User.create!(first_name: "Sophie", last_name: "Figgis")
      @project = @user.projects.create!(:name => "Some project", :description => "saying some stuff about project")

      get :index, :format => :json
    end

    it "returns 200" do
      expect(response.status).to eq(200)
    end

    it "returns Json" do 
      expect(response.content_type).to eq('application/json')
      expect{ JSON.parse(response.body) }.not_to raise_exception
      project_json = JSON(response.body)[0]
      expect(project_json["name"]).to eq "Some project"
      expect(project_json["description"]).to eq "saying some stuff about project"
    end
  end

  describe "GET /projects/:id" do
    before do
      @user = User.create!(first_name: "Sophie", last_name: "Figgis")
      @project = @user.projects.create!(:name => "Some project", :description => "saying some stuff about project")
      get :show, params: {:id => @project.id}, :format => :json
    end

    it "returns 200" do
      expect(response.status).to eq(200)
    end

    it "returns JSON" do 
      expect(response.content_type).to eq('application/json')
      expect{ JSON(response.body) }.not_to raise_exception
      user_json = JSON(response.body)
      expect(user_json["name"]).to eq "Some project"
      expect(user_json["description"]).to eq "saying some stuff about project"
    end
  end

end