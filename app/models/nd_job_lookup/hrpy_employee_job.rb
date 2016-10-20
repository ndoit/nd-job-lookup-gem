module NdJobLookup
  class InvalidParams < StandardError; end
  class HrpyEmployeeJob # < ActiveRecord::Base
    extend Validation

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

    rescue => e
      case e
      when OpenURI::HTTPError
        # raise e unless e.io.status == "404"
        return JSON.parse('[{ "Job": "None" }]').to_json
      end
    end

    def self.sanitize_params(params)
      cparams = {}
      if params.key?(:posn)
        if params[:posn] =~ /^[a-zA-Z0-9]*$/
          cparams["posn"] = params[:posn]
        else
          raise InvalidParams
        end
      end
      if params.key?(:suffix)
        if params[:suffix] =~ /^[a-zA-Z0-9]*$/
          cparams["suffix"] = params[:suffix]
        else
          raise InvalidParams
        end
      end
      if params.key?(:end_date)
        cparams["end_date"] = validateInputDate(params[:end_date])
      end
      if params.key?(:start_date)
        cparams["start_date"] = validateInputDate(params[:start_date])
      end
      if params.key?(:pidm)
        if params[:pidm] =~ /^[0-9]*$/
          cparams["pidm"] = params[:pidm]
        else
          raise InvalidParams
        end
      end
      cparams
    rescue => e
      raise e
    end

    def self.lookup_url_from_params(clean_params)
      lookup_url = "#{ENV['HRPY_API_BASE']}/job/v1"
      lookup_url += query_string(clean_params)
      lookup_url += "?api_key=#{ENV['HRPY_API_KEY']}"
    end

    def self.query_string(params)
      qs = ""
      if params.key?("posn") && params.key?("suffix")
        qs += "/" + params["pidm"] + "/p/" + params["posn"] + "/" + params["suffix"]
      elsif params.key?("end_date") && params.key?("start_date")
        qs += "/" + params["pidm"] + "/" + params["start_date"] + "/" + params["end_date"]
      elsif params.key?("start_date")
        qs += "/" + params["pidm"] + "/" + params["start_date"]
      else
        raise InvalidParams
      end

      qs
    end

    private_class_method :sanitize_params, :lookup_url_from_params, :query_string
  end
end
