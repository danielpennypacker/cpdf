prawn_document(:page_size => [ 392, 612], :margin => [ 37, 55, 37, 55]) do |p|

#p.font "Helvetica"
p.fill_color "000000"


p.font_families.update("Maison-Book" => {
:normal => "#{Rails.root}/app/assets/fonts/MaisonNeue-Mono.otf"
})

#p.font("Maison-Book")

p.image Rails.root.join('app', 'assets', 'images', 'cover-01.png'), :at => [-55, 575], :fit => [392, 612]


p.start_new_page

#TOC

p.fill_color "000000"
p.rectangle [-55, 575], 392, 612
p.fill

p.fill_color "ffffff"

page = 2
p.text "Contents"
@documents.each do | document |
  page = page + 1
  p.text page.to_s  
  p.text document.title, :style => :bold
end

p.start_new_page

#about page
p.fill_color "000000"
p.rectangle [-55, 575], 392, 612
p.fill

p.fill_color "ffffff"

p.font_size 8

p.draw_text "Source Book • Vol 1", :style => :bold, :at => [50, p.cursor], :leading => 2

p.move_down( p.cursor - 500 )

p.text_box "An up-to-date graphic design reference book. Each Issue acts as a snapshot of the booklets corresponding website. And is published in a limited edition of 50 copies through on-demand printers. As copies are printed, 1% black is added across the document. Once 50% black is reached, issue 2 is released for another 50 copies, and resets the cycle.

This 23rd printed itteration contains 16 references, in 16 pages. It was created for the Winter 2012 Thesis Research workshop with Leonardo Sonnoli. Quotes describing references are set in Arhem, my notes on the subject are set in Aperçu.An up-to-date graphic design reference book. Each Issue acts as a snapshot of the booklets corresponding website. And is published in a limited edition of 50 copies through on-demand printers. As copies are printed, 1% black is added across the document. Once 50% black is reached, issue 2 is released for another 50 copies, and resets the cycle.

This 23rd printed itteration contains 16 references, in 16 pages. It was created for the Winter 2012 Thesis Research workshop with Leonardo Sonnoli. Quotes describing references are set in Arhem, my notes on the subject are set in Aperçu.", :at => [50, p.cursor], :leading => 2

#running side
p.font_size 6  
p.draw_text "Source Book • Volume 1", 
:at => [320,311],
:width => 100,
:rotate => 270, 
:rotate_around => :center


p.start_new_page

p.fill_color "000000"

@documents.each do | document |

  #opacity square
  p.transparent( (document.view_count%50).to_f/100) do
    p.rectangle [-55, 575], 392, 612
    p.fill
  end

  #running side
  p.repeat(:odd) do
    p.font_size 6  
    p.draw_text "Source Book • Volume 1", 
    :at => [310,311],
    :width => 100,
    :rotate => 270, 
    :rotate_around => :center
  end

  #big letter
  p.font_size 40
  p.text document.title[0], :style => :bold


  #little letter


  #title
  p.font_size 12
  p.text document.title, :style => :bold

  y_position = p.cursor - 70

  #tag list
  p.font_size 5
  if document.tags
    p.text_box document.tags,
      :at => [0, y_position],
      :width => 39,
      :align => :right,
      :rotate_around => :center
  end

  #body
  p.font_size 8
  if document.body
    p.text_box document.body,
       :at => [50, y_position],
       :leading => 2,
       :width => 238,
       :height => 300,
       :align => :left
  end

  #image
  p.move_down( y_position - 106 )
  p.image Rails.root.join('app', 'assets', 'images', 'weed_cat.jpg'), :fit => [268, 176]

  p.start_new_page

  end

end