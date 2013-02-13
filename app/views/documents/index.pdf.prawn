
prawn_document(:page_size => [ 392, 612]) do |p|

p.font "Helvetica"
p.fill_color "000000"

@documents.each do | document |

  #opacity square
  p.transparent( (document.view_count%50).to_f/100) do
    p.rectangle [-45, 792], 612, 818
    p.fill
  end


  #big letter
  p.font_size 42
  p.text document.title[0], :style => :bold


  #little letter


  #title
  p.font_size 14
  p.text document.title, :style => :bold

  y_position = p.cursor - 40

  #tag list
  p.font_size 8
  if document.tags
    p.text_box document.tags,
      :at => [0, y_position],
      :width => 39,
      :align => :right,
      :rotate_around => :center
  end

  p.font_size 12
  if document.body
    p.text_box document.body,
               :at => [50, y_position],
               :width => 268,
               :height => 232,
               :align => :left,
               :rotate_around => :center
  end


  p.move_down( y_position - 232 )
  p.image Rails.root.join('app', 'assets', 'images', 'weed_cat.jpg'), :width => 268, :height => 176

  p.start_new_page

end

end
