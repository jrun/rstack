module RStack
  class RSpec
    def self.define_tasks(configuration)      
      ::Spec::Rake::SpecTask.new do |t|
        t.spec_files = configuration.spec_files
      end
      
      desc "Run specs through RCov and generate HTML reports"
      ::Spec::Rake::SpecTask.new('spec:with_coverage') do |t|
        t.rcov_dir      = configuration.outpath + '/coverage'
        t.spec_files    = configuration.spec_files
        t.spec_opts     = ["--format", "html:#{configuration.outpath}/spec_report.html", "--diff"]
        t.fail_on_error = false
        t.rcov          = true
        t.rcov_opts << '--no-rcovrt' # required or rcov will fail
      end      
    end
  end
end
