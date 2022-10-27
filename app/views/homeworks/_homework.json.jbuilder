json.extract! homework, :id, :title, :due_date, :category, :subject, :status, :created_at, :updated_at
json.url homework_url(homework, format: :json)
