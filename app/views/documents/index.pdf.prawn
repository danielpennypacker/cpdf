prawn_document(:page_size => [ 392, 612], :margin => [ 37, 55, 37, 55]) do |p|

#p.font "Helvetica"
p.fill_color "000000"

#cover image
image_number = (@issue.view_count%10)
p.image Rails.root.join('app', 'assets', 'images', 'issues', "#{image_number}.jpg"), :at => [-55, 575], :fit => [392, 612]

p.font_families.update("Maison" => {
:normal => "#{Rails.root}/app/assets/fonts/maisonneuebook.ttf",
:italic => "#{Rails.root}/app/assets/fonts/maisonneuebookitalic.ttf",
:bold => "#{Rails.root}/app/assets/fonts/maisonneuebold.ttf",
:bold_italic => "#{Rails.root}/app/assets/fonts/maisonneuebolditalic.ttf",
:mono => "#{Rails.root}/app/assets/fonts/maisonneuemono.ttf",
:mono_italic => "#{Rails.root}/app/assets/fonts/maisonneuemonoitalic.ttf"

})

p.font "Maison"

p.start_new_page

#TOC
p.fill_color "000000"
p.rectangle [-55, 575], 392, 612
p.fill

p.fill_color "ffffff"

p.font_size 7

page = 2
p.text "Contents", :style => :bold

p.move_down 5

@documents.each do | document |
  page = page + 1
  p.text page.to_s, :style => :mono

  p.move_down 2

  p.text document.title, :style => :bold, :leading => 2

  p.move_down 5

end

p.start_new_page

#about page
p.fill_color "000000"
p.rectangle [-55, 575], 392, 612
p.fill

p.fill_color "ffffff"
p.draw_text "Book Book • 1st Edition", :style => :bold, :at => [50, p.cursor], :leading => 2

p.move_down( p.cursor - 500 )

p.text_box "An up-to-date graphic design reference book. Each Issue acts as a snapshot of the booklets corresponding website. And is published in a limited edition of 50 copies through on-demand printers. As copies are printed, 1% black is added across the document. Once 50% black is reached, issue 2 is released for another 50 copies, and resets the cycle.

This 23rd printed itteration contains 16 references, in 16 pages. It was created for the Winter 2012 Thesis Research workshop with Leonardo Sonnoli. Quotes describing references are set in Arhem, my notes on the subject are set in Aperçu.An up-to-date graphic design reference book. Each Issue acts as a snapshot of the booklets corresponding website. And is published in a limited edition of 50 copies through on-demand printers. As copies are printed, 1% black is added across the document. Once 50% black is reached, issue 2 is released for another 50 copies, and resets the cycle.

This 23rd printed itteration contains 16 references, in 16 pages. It was created for the Winter 2012 Thesis Research workshop with Leonardo Sonnoli. Quotes describing references are set in Arhem, my notes on the subject are set in Aperçu.", :at => [50, p.cursor], :leading => 2

p.start_new_page

#blank page
p.start_new_page

p.fill_color "000000"

#used
letter_count = 1

#for printing out the page number
page = 2
@documents.each_with_index do | document, index |
  page = page + 1

  #opacity square
  p.transparent( (@issue.view_count%50).to_f/100) do
    p.rectangle [-55, 575], 392, 612
    p.fill
  end

  #running side
  p.repeat(:odd) do
    p.font_size 6  
    p.draw_text "1st Edition, #{image_number}/50", 
    :at => [310,311],
    :width => 100,
    :rotate => 270,
    :style => :mono, 
    :rotate_around => :center
  end

  #page number
  p.font_size 6
  num = "%02d" % page
  num = num[0] + "\n" + num[1]

  p.text_box num,
    :at => [-60, 537],
    :width => 59,
    :height => 50,
    :align => :center,
    :style => :mono  

  #line above big letter
  
  p.stroke_color "999999"

  p.line [0, 540], [88, 540]
  p.stroke
  
  p.move_down 2

  #big letter
  p.font_size 32
  p.draw_text document.title[0], :style => :mono, :at => [ -3, p.cursor + -24  ]

  #code for keeping track of little number next to letter
  if index != 0
    prev_letter = @documents[index -1].title[0]
    if prev_letter == document.title[0]
      letter_count += 1
    else
      letter_count = 1
    end
  end

  p.font_size 12
  #little number
  p.text_box letter_count.to_s,
   :at => [0, p.cursor + 0 ],
   :width => 28,
   :height => 50,
   :align => :right,
   :style => :mono,
   :leading => 2

  p.move_down 28

  #title
  p.font_size 12
  p.text document.title, :style => :bold

  y_position = p.cursor - 85


  #tag list
  p.font_size 5
  if document.tags
    p.text_box document.tags,
      :at => [0, y_position + -10],
      :width => 39,
      :align => :right,
      :rotate_around => :center
  end


  # short line above text
  p.line [50, y_position+5], [60, y_position+5]
  p.stroke

  #category
  if document.category
    p.font_size 6
    p.text_box document.category,
       :at => [50, y_position],
       :width => 238,
       :height => 10,
       :align => :left,
       :style => :bold,
       :character_spacing => 0.5
  end
  #body
  p.font_size 7
  if document.body
    p.text_box document.body,
       :at => [50, y_position + -10],
       :leading => 2,
       :width => 238,
       :height => 300,
       :align => :left
  end

  #image
  p.move_down( y_position - 116 )
  if document.image_name
    p.image Rails.root.join('app', 'assets', 'images', 'documents', document.image_name), :fit => [288, 176]
  end

  p.start_new_page

  end

end