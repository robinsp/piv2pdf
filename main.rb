require 'rubygems'

require 'lib/piv_2_pdf/csv'
require 'lib/piv_2_pdf/tracker_item'
require 'lib/piv_2_pdf/renderer'

csv = Piv2Pdf::Csv.new("/home/robin/src/piv2pdf/spec/res/sample.csv")

puts Piv2Pdf::Renderer.new(csv.items).render
