feature 'External request' do
  it 'queries HRPY API for a single job' do
    uri = URI("#{ENV['HRPY_API_BASE']}/job/v1/320891/p/R99994/00")
    response = JSON.load(Net::HTTP.get(uri))
    expect(response.first['primary']).to eq 'Primary'
    expect(response.first['title']).to eq 'Surviving Spouse Administrator'
    expect(response.first['status']).to eq 'A'
    expect(response.first['status_description']).to eq 'Active'
    expect(response.first['orgn_title']).to eq 'University'
    expect(response.first['employee_class']).to eq 'R2'
  end
  it 'queries HRPY API for two jobs (active/inactive)' do
    uri = URI("#{ENV['HRPY_API_BASE']}/job/v1/1197974/2016-05-16")
    response = JSON.load(Net::HTTP.get(uri))
    expect(response.count).to eq 2
    response.each do |j|
      expect(j['employee_class']).to eq 'G1'
      expect(j['posn']).to eq 'G99645'
      expect(j['title']).to eq 'GRAD Stipend-Biological Scienc'
      expect(j['orgn_title']).to eq 'Biological Sciences'
    end
    expect(response[0]['primary']).to eq 'Secondary'
    expect(response[1]['primary']).to eq 'Primary'
    expect(response[0]['status']).to eq 'A'
    expect(response[1]['status']).to eq 'T'
  end
  it 'queries HRPY API for one current grad stipend job' do
    uri = URI("#{ENV['HRPY_API_BASE']}/job/v1/1197974/2016-08-16")
    response = JSON.load(Net::HTTP.get(uri))
    expect(response.count).to eq 1
  end
  it 'queries HRPY API for a person with no job' do
    uri = URI("#{ENV['HRPY_API_BASE']}/job/v1/1194830/2016-08-15")
    response = JSON.load(Net::HTTP.get(uri))
    expect(response[0]['Job']).to eq 'None'
  end
  it 'queries HRPY API for a person with two jobs' do
    uri = URI("#{ENV['HRPY_API_BASE']}/job/v1/300055/2016-10-27")
    response = JSON.load(Net::HTTP.get(uri))
    expect(response[0].key? "Job").to be false
    expect(response.count).to eq 2
  end
end
