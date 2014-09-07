class AddAttachmentReportToAuditReports < ActiveRecord::Migration
  def self.up
    change_table :audit_reports do |t|
      t.attachment :report
    end
  end

  def self.down
    remove_attachment :audit_reports, :report
  end
end
