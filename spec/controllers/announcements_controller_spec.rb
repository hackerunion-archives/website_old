require 'spec_helper'

describe AnnouncementsController do

  def valid_attributes user
    {member_id: user.id,
     title: "The Announcement",
     text: "My announcement is awesome",
     created_at: DateTime.now - 1.hour,
     approved: true}
  end

  context 'Logged in member' do

    before :each do
      @member = FactoryGirl.create :member, admin: false, approved: true
      sign_in @member
    end

    it 'should not be allowed to approve a pending announcement' do
      announcement = FactoryGirl.create :announcement, approved: false
      put :approve, id: announcement.id
      response.should redirect_to root_path
      announcement.reload
      announcement.should_not be_approved
    end

    describe "GET index" do
      it 'assigns all announcements as @announcements' do
        announcement = Announcement.create! valid_attributes(@member)
        get :index, {}
        assigns(:announcements).should eq([announcement])
      end
    end

    describe "GET show" do
      it 'assigns the requested announcement as @announcement' do
        announcement = Announcement.create! valid_attributes(@member)
        get :show, {:id => announcement.to_param}
        assigns(:announcement).should eq(announcement)
      end
    end

    describe "GET new" do
      it 'assigns a new announcement as @announcement' do
        get :new
        assigns(:announcement).should be_a_new(Announcement)
      end
    end

    describe "GET edit" do
      it 'assigns the requested announcement as @announcement' do
        announcement = Announcement.create! valid_attributes(@member)
        get :edit, {:id => announcement.to_param}
        assigns(:announcement).should eq(announcement)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it 'creates a new Announcement' do
          expect {
            post :create, {:announcement => valid_attributes(@member)}
          }.to change(Announcement, :count).by(1)
        end

        it 'assigns a newly created announcement as @announcement' do
          post :create, {:announcement => valid_attributes(@member)}
          assigns(:announcement).should be_a(Announcement)
          assigns(:announcement).should be_persisted
        end

        it 'redirects to the created announcement' do
          post :create, {:announcement => valid_attributes(@member)}
          response.should redirect_to(Announcement.last)
        end
      end

      describe "with invalid params" do
        it 'assigns a newly created but unsaved announcement as @announcement' do
          # Trigger the behavior that occurs when invalid params are submitted
          Announcement.any_instance.stub(:save).and_return(false)
          post :create, {:announcement => {}}
          assigns(:announcement).should be_a_new(Announcement)
        end

        it 're-renders the "new" template' do
          # Trigger the behavior that occurs when invalid params are submitted
          Announcement.any_instance.stub(:save).and_return(false)
          post :create, {:announcement => {}}
          response.should render_template("new")
        end
      end
    end

  end

  context 'Logged in admin' do
    before :each do
      @admin = FactoryGirl.create :member, admin: true, approved: true
      sign_in @admin
    end

    describe "PUT update" do
      describe "with valid params" do
        it 'updates the requested announcement' do
          announcement = Announcement.create! valid_attributes(@admin)
          # Assuming there are no other announcements in the database, this
          # specifies that the Announcement created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Announcement.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {:id => announcement.to_param, :announcement => {'these' => 'params'}}
        end

        it 'assigns the requested announcement as @announcement' do
          announcement = Announcement.create! valid_attributes(@admin)
          put :update, {:id => announcement.to_param, :announcement => valid_attributes(@admin)}
          assigns(:announcement).should eq(announcement)
        end

        it 'redirects to the announcement' do
          announcement = Announcement.create! valid_attributes(@admin)
          put :update, {:id => announcement.to_param, :announcement => valid_attributes(@admin)}
          response.should redirect_to(announcement)
        end
      end

      describe "with invalid params" do
        it 'assigns the announcement as @announcement' do
          announcement = Announcement.create! valid_attributes(@admin)
          # Trigger the behavior that occurs when invalid params are submitted
          Announcement.any_instance.stub(:save).and_return(false)
          put :update, {:id => announcement.to_param, :announcement => {}}
          assigns(:announcement).should eq(announcement)
        end

        it 're-renders the "edit" template' do
          announcement = Announcement.create! valid_attributes(@admin)
          # Trigger the behavior that occurs when invalid params are submitted
          Announcement.any_instance.stub(:save).and_return(false)
          put :update, {:id => announcement.to_param, :announcement => {}}
          response.should render_template("edit")
        end
      end
    end


    describe "DELETE destroy" do
      it 'destroys the requested announcement' do
        announcement = Announcement.create! valid_attributes(@admin)
        expect {
          delete :destroy, {:id => announcement.to_param}
        }.to change(Announcement, :count).by(-1)
      end

      it 'redirects to the announcements list' do
        announcement = Announcement.create! valid_attributes(@admin)
        delete :destroy, {:id => announcement.to_param}
        response.should redirect_to(announcements_url)
      end
    end

  end

  context 'No member logged in' do

  end

end
