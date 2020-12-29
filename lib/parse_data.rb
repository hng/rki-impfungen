require 'creek'
require 'terminal-table'
tty_table_rows = []

Dir.glob("data/*.xlsx").each do |file|
  puts file
  creek = Creek::Book.new file
  
  creek.sheets.each do |sheet|
    if sheet.name == "Presse" 
      sheet.simple_rows.each do |row|
        if row.size >= 6 && (row['A'] != "Bundesland" && row['A'] != "Gesamt")
          #puts row
        end
  
        if row.size >= 6 && row['A'] != "Bundesland"
          tty_table_rows << [row['A'], row['B']]
        end
      end
    end
  end
end

table = Terminal::Table.new headings: ['Bundesland', 'Impfungen kumulativ'], rows: tty_table_rows
puts table
