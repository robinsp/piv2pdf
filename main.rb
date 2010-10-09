require 'rubygems'
require 'bundler/setup'

require 'pdfkit'

require 'lib/piv_2_pdf/csv'
require 'lib/piv_2_pdf/tracker_item'
require 'lib/piv_2_pdf/renderer'

PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'A5'
  }
end



csv = Piv2Pdf::Csv.new("/home/robin/src/piv2pdf/spec/res/sample.csv")

html = Piv2Pdf::Renderer.new(csv.items).render
kit = PDFKit.new(html)
#kit.stylesheets << '/path/to/pdf.css'
kit.to_pdf # inline PDF
kit.to_file('/home/robin/tmp/rs.pdf')


