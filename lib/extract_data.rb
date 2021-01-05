require 'creek'
require 'terminal-table'
require 'json'

Dir.glob("data/*.xlsx").each do |file|
  puts file
  date = file.match(/(\d\d\d\d-\d\d-\d\d)/)[1]
  puts date
  json = {'headers' => [], 'data' => {}, 'notes' => []}
  tty_table_rows = []

  creek = Creek::Book.new file
  
  creek.sheets.each do |sheet|
    if sheet.name =~ /\d?\d\.\d?\d\.\d?\d?\d\d/ 
      sheet.simple_rows.each_with_index do |row, index|
        if index == 0
          json['headers'] = row.values
        elsif row.size >= 6 
          json['data'][row['A']] = row.values.drop(1)
          tty_table_rows << [row['A'], row['B']]
        elsif row.size == 1 
          json['notes'] << row['A']
        end
      end
      break
    end
  end

  open("src/_data/impfquoten/#{date}.json", 'wb') do |file|
    file << json.to_json
  end

  table = Terminal::Table.new headings: ['Bundesland', 'Impfungen kumulativ'], rows: tty_table_rows
  puts table
end


