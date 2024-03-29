require 'spec_helper'

describe EventsController do

  def valid_attributes user
    {member_id: user.id,
     title: "The Event",
     description: "My event is awesome",
     starts: "2013-01-01 18:06:00 UTC",
     ends: "2013-03-01 10:05:00 UTC",
     approved: true}
  end

  context 'Logged in member' do

    before :each do
      @member = FactoryGirl.create :member, admin: false, approved: true
      sign_in @member
    end

    describe "GET index" do
      it 'assigns all events as @events' do
        event = Event.create! valid_attributes(@member)
        get :index, {}
        assigns(:events).should eq([event])
      end
    end

    describe "GET show" do
      it 'assigns the requested event as @event' do
        event = Event.create! valid_attributes(@member)
        get :show, {:id => event.to_param}
        assigns(:event).should eq(event)
      end
    end

    describe "GET new" do
      it 'assigns a new event as @event' do
        get :new
        assigns(:event).should be_a_new(Event)
      end
    end

    describe "GET edit" do
      it 'assigns the requested event as @event' do
        event = Event.create! valid_attributes(@member)
        get :edit, {:id => event.to_param}
        assigns(:event).should eq(event)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it 'creates a new Event' do
          expect {
            post :create, {:event => valid_attributes(@member)}
          }.to change(Event, :count).by(1)
        end

        it 'assigns a newly created event as @event' do
          post :create, {:event => valid_attributes(@member)}
          assigns(:event).should be_a(Event)
          assigns(:event).should be_persisted
        end

        it 'redirects to the created event' do
          post :create, {:event => valid_attributes(@member)}
          response.should redirect_to(Event.last)
        end
      end

      describe "with invalid params" do
        it 'assigns a newly created but unsaved event as @event' do
          # Trigger the behavior that occurs when invalid params are submitted
          Event.any_instance.stub(:save).and_return(false)
          post :create, {:event => {}}
          assigns(:event).should be_a_new(Event)
        end

        it 're-renders the "new" template' do
          # Trigger the behavior that occurs when invalid params are submitted
          Event.any_instance.stub(:save).and_return(false)
          post :create, {:event => {}}
          response.should render_template("new")
        end
      end
    end

    it 'should not be allowed to approve a pending event' do
      event = FactoryGirl.create :event, approved: false
      put :approve, id: event.id
      response.should redirect_to root_path
      event.reload
      event.should_not be_approved
    end

  end
  
  context 'Logged in admin' do
    before :each do
      @admin = FactoryGirl.create :member, admin: true, approved: true
      sign_in @admin
    end

    describe "DELETE destroy" do
      it 'destroys the requested event' do
        event = Event.create! valid_attributes(@admin)
        expect {
          delete :destroy, {:id => event.to_param}
        }.to change(Event, :count).by(-1)
      end

      it 'redirects to the events list' do
        event = Event.create! valid_attributes(@admin)
        delete :destroy, {:id => event.to_param}
        response.should redirect_to(events_url)
      end
    end
    describe "PUT update" do
      describe "with valid params" do
        it 'updates the requested event' do
          event = Event.create! valid_attributes(@admin)
          # Assuming there are no other events in the database, this
          # specifies that the Event created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Event.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {:id => event.to_param, :event => {'these' => 'params'}}
        end

        it 'assigns the requested event as @event' do
          event = Event.create! valid_attributes(@admin)
          put :update, {:id => event.to_param, :event => valid_attributes(@admin)}
          assigns(:event).should eq(event)
        end

        it 'redirects to the event' do
          event = Event.create! valid_attributes(@admin)
          put :update, {:id => event.to_param, :event => valid_attributes(@admin)}
          response.should redirect_to(event)
        end
      end

      describe "with invalid params" do
        it 'assigns the event as @event' do
          event = Event.create! valid_attributes(@admin)
          # Trigger the behavior that occurs when invalid params are submitted
          Event.any_instance.stub(:save).and_return(false)
          put :update, {:id => event.to_param, :event => {}}
          assigns(:event).should eq(event)
        end

        it 're-renders the "edit" template' do
          event = Event.create! valid_attributes(@admin)
          # Trigger the behavior that occurs when invalid params are submitted
          Event.any_instance.stub(:save).and_return(false)
          put :update, {:id => event.to_param, :event => {}}
          response.should render_template("edit")
        end
      end
    end

  end

end
