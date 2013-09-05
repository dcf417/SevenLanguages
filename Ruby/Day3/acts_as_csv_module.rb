module ActsAsCsv
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    def each
      @csv_contents.each do |content|
        yield CsvRow.new(@headers, content)
      end
    end
    
    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end
  end
  
  class CsvRow
    attr_accessor :header_row, :content_row
  
    def initialize(header_row, content_row)
      @header_row = header_row
      @content_row = content_row
    end
  
    def method_missing name, *args
      @content_row[@header_row.index(name.to_s)]
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

puts
m.each {|row| puts row.one }
puts 
m.each {|row| puts row.four }