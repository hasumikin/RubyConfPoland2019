# puts font_families.sort
@xx_large_font_size = screen_size(10 * Pango::SCALE)
@x_large_font_size = screen_size(7.5 * Pango::SCALE)
@large_font_size = screen_size(6 * Pango::SCALE)
@normal_font_size = screen_size(4.5 * Pango::SCALE)
@small_font_size = screen_size(4 * Pango::SCALE)
@x_small_font_size = screen_size(3.5 * Pango::SCALE)
@xx_small_font_size = screen_size(2.8 * Pango::SCALE)

@default_headline_line_color = '#888888'
@font_family = find_font_family('Rockwell')
@foreground = "#d9333f" # タイトルスライドの文字色
#@background = "#000000"

@table_frame_color = "#ffffff"
@table_fill_color = "#0f0428"
@table_body_frame_color = "#ffffff"
@table_body_fill_color = "#3f3468"
@table_head_frame_color = "#ffffff"
@table_head_fill_color = "#rf0428"

@monospace_font_family = 'Ricty Discord'
@preformatted_fill_color = '#000000'
# @preformatted_centering = true
@space = screen_y(1)

include_theme('default')

match(Slide, HeadLine) do |heads|
  heads.prop_set("size", @large_font_size)
  heads.prop_set("weight", "normal")
  set_font_family(heads)
end

match Slide do |slides|
  slides.each do |slide|
    # スライドの文字色
    slide.prop_set("foreground", "#fef263")
  end
end

#@title_background_color = "red"
#include_theme("title-background-color")
@title_slide_background_image = 'images/krkrb-main.png'
include_theme("title-slide-background-image")

#@slide_logo_image = 'images/NEW_ML_LOGO.png'
#include_theme('slide-logo')

@slide_background_image = 'images/slide-background.png'
include_theme("slide-background-image")

@item_image = 'images/mark32.png'

include_theme("default-item-mark")

add_image_path("rabbit-images")

slide_body = [Slide, Body]
item_list_item = [ItemList, ItemListItem]

indent = 30

match(*(slide_body + (item_list_item * 1))) do |items|
  name = "item1"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image, name, indent: indent)
end

match(*(slide_body + (item_list_item * 2))) do |items|
  name = "item2"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image, name, indent: indent)
end

match(*(slide_body + (item_list_item * 3))) do |items|
  name = "item3"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image, name, indent: indent)
end

enum_list_item = [EnumList, EnumListItem]

match(*(slide_body + enum_list_item + item_list_item)) do |items|
  name = "enum-item1"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image, name, indent: indent)
end

match(*(slide_body + enum_list_item + (item_list_item * 2))) do |items|
  name = "enum-item2"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image, name, indent: indent)
end
