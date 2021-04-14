private

def fill_data(title, content, end_at)
  fill_in 'task_title', with: title
  fill_in 'task_content', with: content
  fill_in 'task_end_at', with: end_at
end
