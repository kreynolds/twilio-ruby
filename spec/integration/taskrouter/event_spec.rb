require 'spec_helper'

describe Twilio::Resources::Taskrouter::WorkspaceInstance::EventList do
  before do
    Twiliodeck.activate
  end

  after do
    Twiliodeck.deactivate
  end

  context "should fetch events" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      resource = client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').events.get()
      expect { resource.sid }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      resource = client.workspaces.get('WSllllllllllllllllllllllllllllllll').events.get()
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      resource = client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').events.get()
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      resource = client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').events.get()
      expect { resource.sid }.to raise_error Twilio::REST::RequestError
    end
  end

  context "should read events" do
    it "and return 200" do
      client = Twilio::REST::TaskrouterClient.new('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'AUTHTOKEN')
      expect { client.workspaces.get('WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').events.list(end_date: 1199174400, event_type: 'event_type', minutes: 1, reservation_sid: 'reservation_sid', start_date: 1199174400, task_queue_sid: 'task_queue_sid', task_sid: 'task_sid', worker_sid: 'worker_sid', workflow_sid: 'workflow_sid') }.not_to raise_error
    end
  
    it "and return 401" do
      client = Twilio::REST::TaskrouterClient.new('ACllllllllllllllllllllllllllllllll', 'AUTHTOKEN')
      expect { client.workspaces.get('WSllllllllllllllllllllllllllllllll').events.list(end_date: 1199174400, event_type: 'event_type', minutes: 1, reservation_sid: 'reservation_sid', start_date: 1199174400, task_queue_sid: 'task_queue_sid', task_sid: 'task_sid', worker_sid: 'worker_sid', workflow_sid: 'workflow_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 404" do
      client = Twilio::REST::TaskrouterClient.new('ACkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 'AUTHTOKEN')
      expect { client.workspaces.get('WSkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk').events.list(end_date: 1199174400, event_type: 'event_type', minutes: 1, reservation_sid: 'reservation_sid', start_date: 1199174400, task_queue_sid: 'task_queue_sid', task_sid: 'task_sid', worker_sid: 'worker_sid', workflow_sid: 'workflow_sid') }.to raise_error Twilio::REST::RequestError
    end
  
    it "and return 500" do
      client = Twilio::REST::TaskrouterClient.new('ACmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', 'AUTHTOKEN')
      expect { client.workspaces.get('WSmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm').events.list(end_date: 1199174400, event_type: 'event_type', minutes: 1, reservation_sid: 'reservation_sid', start_date: 1199174400, task_queue_sid: 'task_queue_sid', task_sid: 'task_sid', worker_sid: 'worker_sid', workflow_sid: 'workflow_sid') }.to raise_error Twilio::REST::RequestError
    end
  end
end