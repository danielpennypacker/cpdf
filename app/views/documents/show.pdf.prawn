prawn_document(:margin => [20,20,20,20], :page_size => [500, 500]) do |pdf|

  #opacity square
  pdf.transparent( (@document.view_count%50).to_f/100) do
    pdf.rectangle [-20, 500], 500, 520
    pdf.fill
  end

  #text
  pdf.fill_color "000000"
  pdf.text @document.title
  pdf.text "view count: #{@document.view_count.to_s}"
  pdf.text "opacity: #{(@document.view_count%50).to_f/100}"
  pdf.move_down 20
  pdf.text @document.body
end
