prawn_document(:page_size => [ 392, 612], :margin => [ 37, 55, 37, 55]) do |p|

p.font "Helvetica"
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
    :at => [340,311],
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
  p.font_size 7
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