class AddAppointmentTaskTypes < ActiveRecord::Migration
  def self.up

    w = WorkflowTaskType.new
    w.id = WorkflowTaskType::AppointmentRequestId
    w.name = 'Appointment Request'
    w.partial = 'appointment_requests/request_task'
    w.save

    w = WorkflowTaskType.new
    w.id = WorkflowTaskType::AppointmentAcknowledgementId
    w.name = 'Appointment Acknowledgement'
    w.partial = 'appointment_requests/acknowledge_task'
    w.save

  end

  def self.down

    w = WorkflowTaskType::AppointmentRequest
    if(w)
      w.delete
    end

    w = WorkflowTaskType::AppointmentAcknowledgement
    if(w)
      w.delete
    end

  end
end
