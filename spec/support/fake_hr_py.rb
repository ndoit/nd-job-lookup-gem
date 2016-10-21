require 'sinatra/base'
require 'date'

class FakeHrPy < Sinatra::Base
  # get '/employee/v1/l/:last_name' do
  #   json_response 200, 'employees.json'
  # end

  get '/job/v1/:pidm/p/:posn/:suffix' do
    pidm = params['pidm']
    posn = params['posn']
    suffix = params['suffix']

    if "320891" == pidm && "R99994" == posn && "00" == suffix
      json_response 200, 'retiree_spouse.json'
    else
      json_response 404, 'none.json'
    end
  end

  get '/job/v1/:pidm/:start_date/:end_date' do
    pidm = params['pidm']
    start = Date.parse(params['start_date'])
    finish = Date.parse(params['end_date'])

    case pidm
    when "320891"
      if start <= finish && finish >= Date.new(2005,7,1)
        json_response 200, 'retiree_spouse.json'
      else
        json_response 404, 'none.json'
      end
    when "1197974"
      if start >= Date.new(2016,8,16) && finish >= start
        json_response 200, 'grad_stipend_single.json'
      elsif start < Date.new(2016,8,16) && finish >= Date.new(2016,8,16)
        json_response 200, 'grad_stipend_history.json'
      elsif finish >= Date.new(2016,5,15) && finish <= Date.new(2016,8,15) && start <= finish
        json_response 200, 'grad_stipend_terminated.json'
      else
        json_response 404, 'none.json'
      end
    else
      json_response 404, 'none.json'
    end
  end

  get '/job/v1/:pidm/:start_date' do
    pidm = params['pidm']
    start = Date.parse(params['start_date'])

    case pidm
    when "320891"
      if start.kind_of?(Date)
        json_response 200, 'retiree_spouse.json'
      else
        json_response 404, 'none.json'
      end
    when "1197974"
      if start >= Date.new(2016,8,16)
        json_response 200, 'grad_stipend_single.json'
      elsif start.kind_of?(Date)
        json_response 200, 'grad_stipend_history.json'
      end
    else
      json_response 404, 'none.json'
    end
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
