require "prawn/measurement_extensions"

prawn_document(:margin => [27,9,27,45], :page_size => [612, 792]) do |pdf|


  #opacity square
  pdf.transparent( (@document.view_count%50).to_f/100) do
    pdf.rectangle [-45, 792], 612, 818
    pdf.fill
  end

  #text
  pdf.fill_color "000000"
  pdf.text @document.title
  pdf.text "view count: #{@document.view_count.to_s}"


  pdf.text_box @document.body,
  :at => [100, 250],
  :height => 100,
  :width => 100,
  :rotate => 90, 
  :rotate_around => :center


  pdf.text "opacity: #{(@document.view_count%50).to_f/100}"
  pdf.move_down 20


  pdf.text @document.body

end

