class GetUrlInCsv
  require 'csv'

  def initialize
  end

  def  printCsv
    CSV.foreach("moz_places.csv") do |row|
      p row[1]
    end
  end

end

