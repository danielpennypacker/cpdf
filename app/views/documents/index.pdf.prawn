prawn_document(:margin => [27,9,27,45], :page_size => [612, 792]) do |pdf|
@documents.each do | document |

  #opacity square
  pdf.transparent( (document.view_count%50).to_f/100) do
    pdf.rectangle [-45, 792], 612, 818
    pdf.fill
  end

  #text
  pdf.fill_color "000000"
  pdf.text document.title
  pdf.text "view count: #{document.view_count.to_s}"


  pdf.text "opacity: #{(document.view_count%50).to_f/100}"
  pdf.move_down 20


  pdf.text document.body

end

end
