prawn_document(:page_size => [ 392, 612], :margin => [ 37, 55, 37, 55]) do |p|

p.font "Helvetica"
p.fill_color "000000"

#cover image
image_number = (@issue.view_count%10)
p.image Rails.root.join('app', 'assets', 'images', 'issues', "#{image_number}.jpg"), :fit => [392, 612]

p.start_new_page

p.text "Contents"
page = 2
@documents.each do | document |
  p.text document.title, :style => :bold
  page = page + 1
  p.text page.to_s  
end

p.start_new_page

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
    p.draw_text "Source Book • Volume 1", 
    :at => [320,311],
    :width => 100,
    :rotate => 270, 
    :rotate_around => :center
  end

  #big letter
  p.font_size 40
  p.text document.title[0], :style => :bold

  #code for keeping track of little number next to letter
  if index != 0
    prev_letter = @documents[index -1].title[0]
    if prev_letter == document.title[0]
      letter_count += 1
    else
      letter_count = 1
    end
  end

  p.font_size 20
  #little number
  p.text_box letter_count.to_s,
             :at => [10, p.cursor + 40 ],
             :width => 39,
             :height => 50,
             :align => :right

  #title
  p.font_size 12
  p.text document.title, :style => :bold

  y_position = p.cursor - 70

  #page number
  p.font_size 5
  num = "%02d" % page
  num = num[0] + "\n" + num[1]
  p.text_box num,
             :at => [-60, y_position],
             :width => 39,
             :height => 50,
             :align => :right

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
  if document.image_name
    p.image Rails.root.join('app', 'assets', 'images', 'documents', document.image_name), :fit => [268, 176]
  end

  p.start_new_page

  end

end