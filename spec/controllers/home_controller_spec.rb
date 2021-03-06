require 'spec_helper'

describe HomeController do
 include ControllerMacros
  login_user
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    let(:file) do
      File.open( File.dirname(__FILE__) + "/../data/test.csv") 
    end

    let(:importer) do
      mock("Importer",:import_data=> nil)
    end
    
    let(:params) do
      {:file => file}
    end

    before do
      Importer.stub!(:new).and_return(importer)
    end

    it "should redirect to /home/index on success" do
      post 'create', params
      response.should render_template("index")
    end

    it "should use the importer to import new data" do
      importer.should_receive(:import_data)
      post 'create', params
    end
  end

end
