module NdJobLookup
  class InvalidParams < StandardError; end
  class HrpyEmployeeJob # < ActiveRecord::Base

    def self.find_by(*args)
      # raise InvalidLookup if ...
      # search_results = JSON.parse(search(args[0]))
      # r = []
      # unless search_results.empty?
      #   search_results.each do |j|
      #     h = HrpyEmployeeJob.new
      #     h. ... = j['...']
      #     r << j
      #   end
      # end
      # r
    end

    def save
    end
    
    def save!
    end

    def new_record?
      false
    end

    def update_attribute
    end

    def initialize(*args)
      #
    end

    def self.search(params)
      clean_params = sanitize_params(params)
      url_open = open lookup_url_from_params(clean_params)
      url_open.read
    end

    def self.sanitize_params(params)
      # TODO
    end

    def self.lookup_url_from_params(clean_params)
      lookup_url = "#{ENV['HRPY_API_BASE']}/job/v1"
      lookup_url += query_string(clean_params)
      lookup_url += "?api_key=#{ENV['HRPY_API_KEY']}"
    end

    def self.query_string(params)
      qs = ""
      if params.key?(:posn) && params.key?(:suffix)
        qs += "/" + params[:pidm] + "/p/" + params[:posn] + "/" + params[:suffix]
      elsif params.key?(:end_date) && params.key?(:start_date)
        qs += "/" + params[:pidm] + "/" + params[:start_date] + params[:end_date]
      elsif params.key?(:start_date)
        qs += "/" params[:pidm]
      else
        raise InvalidParams
      end

      qs
    end

    private_class_method :sanitize_params, :lookup_url_from_params, :query_string
  end
end
