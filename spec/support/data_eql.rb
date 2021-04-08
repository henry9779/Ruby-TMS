private

  def expect_task_data_eql(task, fields)
    task.attributes.symbolize_keys.slice(fields.keys).each do |key, value|
      expect(value).to eq fields[key]
    end
  end
