Project.configure do |project|  
  # Send email notifications about broken and fixed builds to email1@your.site, email2@your.site (default: send to nobody)
  project.email_notifier.emails = []

  # Build the project by invoking rake task 'custom'
  # project.rake_task = 'repackage:full'

  # Ping Subversion for new revisions every 5 minutes (default: 30 seconds)
  # project.scheduler.polling_interval = 5.minutes
end