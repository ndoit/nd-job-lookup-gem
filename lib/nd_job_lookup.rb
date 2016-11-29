require "nd_job_lookup/engine"

module NdJobLookup
  def self.root
    File.expand_path(File.dirname(File.dirname(__FILE__)))
  end

  def self.models_dir
    "#{root}/app/models/nd_job_lookup"
  end

  def self.controllers_dir
    "#{root}/app/controllers/nd_job_lookup"
  end
end
