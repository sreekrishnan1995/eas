json.extract! employee, :id, :emp_id, :name, :designation, :superior_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
