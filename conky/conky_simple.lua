require 'cairo'

COLOR_FONT_R = 0.933
COLOR_FONT_G = 0.905
COLOR_FONT_B = 0.894

COLOR_PRIMARY_R = 0.132
COLOR_PRIMARY_G = 0.730
COLOR_PRIMARY_B = 0.398

COLOR_SECONDARY_R = 0.000
COLOR_SECONDARY_G = 0.664
COLOR_SECONDARY_B = 0.507

function init_cairo()
  if conky_window == nil then
    return false
  end

  cs = cairo_xlib_surface_create(
    conky_window.display,
    conky_window.drawable,
    conky_window.visual,
    conky_window.width,
    conky_window.height)

  cr = cairo_create(cs)

  font = "Quinze"

  cairo_select_font_face(cr, font, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
  cairo_set_source_rgba(cr, COLOR_FONT_R, COLOR_FONT_G, COLOR_FONT_B, 1)

  WINDOW_WIDTH = conky_window.width
  WINDOW_HEIGHT = conky_window.height

  return true
end

function conky_main()
  if (not init_cairo()) then
    return
  end

  -- CPU GRAPH
  -- Non-linear (sqrt instead) so graph area approximatly matches usage

  local cx,cy = 0.142 * WINDOW_WIDTH, 0.515 * WINDOW_HEIGHT
  local radius = 0.065 * WINDOW_WIDTH
  local half_radius = 0.05 + radius * math.sqrt(0.5) * 0.95

  cairo_set_source_rgba(cr, COLOR_PRIMARY_R, COLOR_PRIMARY_G, COLOR_PRIMARY_B, 1)
  local cpu1 = 0.05 + math.sqrt(tonumber(conky_parse("${cpu cpu1}")) / 100.0) * 0.95
  local cpu2 = 0.05 + math.sqrt(tonumber(conky_parse("${cpu cpu2}")) / 100.0) * 0.95
  local cpu3 = 0.05 + math.sqrt(tonumber(conky_parse("${cpu cpu3}")) / 100.0) * 0.95
  local cpu4 = 0.05 + math.sqrt(tonumber(conky_parse("${cpu cpu4}")) / 100.0) * 0.95
  cairo_set_line_width(cr, 1)
  cairo_move_to(cr, cx + radius * cpu1, cy)
  cairo_line_to(cr, cx, cy + radius * cpu2)
  cairo_line_to(cr, cx - radius * cpu3, cy)
  cairo_line_to(cr, cx, cy - radius * cpu4)
  cairo_fill(cr)

  cairo_set_source_rgba(cr, COLOR_FONT_R, COLOR_FONT_G, COLOR_FONT_B,0.4)
  cairo_set_line_width(cr, 1)
  cairo_move_to(cr, cx + radius, cy)
  cairo_rel_line_to(cr, -radius, radius)
  cairo_rel_line_to(cr, -radius, -radius)
  cairo_rel_line_to(cr, radius, -radius)
  cairo_rel_line_to(cr, radius, radius)
  cairo_stroke(cr)

  cairo_move_to(cr, cx + half_radius, cy)
  cairo_rel_line_to(cr, -half_radius, half_radius)
  cairo_rel_line_to(cr, -half_radius, -half_radius)
  cairo_rel_line_to(cr, half_radius, -half_radius)
  cairo_rel_line_to(cr, half_radius, half_radius)
  cairo_stroke(cr)

  cairo_move_to(cr, cx + radius, cy)
  cairo_rel_line_to(cr, - 2*radius, 0)
  cairo_stroke(cr)

  cairo_move_to(cr, cx, cy + radius)
  cairo_rel_line_to(cr, 0, - 2*radius)
  cairo_stroke(cr)


  -- PROCESSES

  cairo_set_source_rgba(cr, COLOR_FONT_R, COLOR_FONT_G, COLOR_FONT_B, 1)
  cairo_set_font_size(cr, 0.017 * WINDOW_HEIGHT)
  local ps_str = conky_parse("${exec ps -Ao comm,pcpu,%mem  --sort=-pcpu | head -n 15}")
  local processes = {}
  for line in string.gmatch(ps_str, '([^\n]+)') do
    table.insert(processes, line)
  end
  for line = 1,table.getn(processes) do
    cairo_move_to(cr, 0.213 * WINDOW_WIDTH, 0.39 * WINDOW_HEIGHT + line * 0.017 * WINDOW_HEIGHT)
    cairo_show_text(cr, processes[line])
  end
  cairo_stroke(cr)


  -- MEMORY

  local memperc = tonumber(conky_parse("$memperc"))

  local row,col = 0,0
  local rows = 5
  local cols = 8
  local perc = 0.0
  local perc_incr = 100.0 / 40.0
  local cx,cy = 0.858 * WINDOW_WIDTH, 0.459 * WINDOW_HEIGHT
  local grid_width = 0.017 * WINDOW_WIDTH
  for i = 1,40 do
    if (memperc > perc) then
      cairo_set_source_rgba(cr, COLOR_PRIMARY_R, COLOR_PRIMARY_G, COLOR_PRIMARY_B, 1)
      cairo_arc(cr, cx, cy, grid_width / 2.7, 0, 2*math.pi)
    else
      cairo_set_source_rgba(cr, COLOR_SECONDARY_R, COLOR_SECONDARY_G, COLOR_SECONDARY_B, 1)
      cairo_arc(cr, cx, cy, grid_width / 8.0, 0, 2*math.pi)
    end
    cairo_fill(cr)

    -- row major implementation
    col = col + 1
    cx = cx + grid_width
    if (col >= cols) then
        col = col - cols
        cx = cx - cols*grid_width
        row = row + 1
        cy = cy + grid_width
    end
    
    -- column major implementation
    -- row = row + 1
    -- cy = cy + grid_width
    -- if (row >= rows) then
    --     row = row - rows
    --     cy = cy - rows*grid_width
    --     col = col + 1
    --     cx = cx + grid_width
    -- end


    perc = perc + perc_incr
  end

end

function draw_volume(name, used, cx)
  local cy = 0.609 * WINDOW_HEIGHT
  local width,height = 0.038 * WINDOW_WIDTH, 0.014 * WINDOW_HEIGHT
  local volume_height = 0.132 * WINDOW_HEIGHT
  local filled_height = volume_height * used / 100
  local line_width = 0.003 * WINDOW_WIDTH

  cairo_set_line_width(cr, line_width)

  cairo_set_source_rgba(cr, COLOR_FONT_R, COLOR_FONT_G, COLOR_FONT_B, 1)
  draw_ellipse(cx, cy, width, height);
  cairo_stroke(cr)

  cairo_set_source_rgba(cr, COLOR_FONT_R, COLOR_FONT_G, COLOR_FONT_B, 1)
  draw_ellipse(cx, cy, width, height);
  cairo_stroke(cr)

  cairo_set_line_width(cr, line_width / 2)

  cairo_set_source_rgba(cr, COLOR_FONT_R, COLOR_FONT_G, COLOR_FONT_B, 1)
  cairo_move_to(cr, cx - line_width/2 + 1, cy + height/2)
  cairo_rel_line_to(cr, 0, -volume_height)
  cairo_stroke(cr)

  cairo_move_to(cr, cx + width + line_width/2 - 1, cy + height/2)
  cairo_rel_line_to(cr, 0, -volume_height)
  cairo_stroke(cr)

  cairo_set_line_width(cr, line_width)

  cairo_set_source_rgba(cr, COLOR_SECONDARY_R, COLOR_SECONDARY_G, COLOR_SECONDARY_B, 1)
  cairo_rectangle(cr, cx, cy+height/2, width, -filled_height)
  cairo_fill(cr)

  cairo_set_source_rgba(cr, COLOR_SECONDARY_R, COLOR_SECONDARY_G, COLOR_SECONDARY_B, 1)
  draw_ellipse(cx, cy, width, height);
  cairo_fill(cr)

  cairo_set_source_rgba(cr, COLOR_FONT_R, COLOR_FONT_G, COLOR_FONT_B, 1)
  draw_ellipse(cx, cy-filled_height, width, height);
  cairo_stroke(cr)

  cairo_set_source_rgba(cr, COLOR_SECONDARY_R, COLOR_SECONDARY_G, COLOR_SECONDARY_B, 1)
  draw_ellipse(cx, cy-filled_height, width, height);
  cairo_fill(cr)

  cairo_set_source_rgba(cr, COLOR_FONT_R, COLOR_FONT_G, COLOR_FONT_B, 1)
  draw_ellipse(cx, cy-volume_height, width, height);
  cairo_stroke(cr)

  cairo_set_source_rgba(cr, COLOR_PRIMARY_R, COLOR_PRIMARY_G, COLOR_PRIMARY_B, 1)
  draw_ellipse(cx, cy-volume_height, width, height);
  cairo_fill(cr)

  cairo_set_source_rgba(cr, COLOR_FONT_R, COLOR_FONT_G, COLOR_FONT_B, 1)
  cairo_move_to(cr, cx, cy + 0.038 * WINDOW_HEIGHT)
  cairo_show_text(cr, name)
  cairo_stroke(cr)
end

function draw_ellipse(cx, cy, width, height)
  cairo_save (cr);
  cairo_translate (cr, cx + width / 2., cy + height / 2.);
  cairo_scale (cr, width / 2., height / 2.);

  cairo_arc (cr, 0., 0., 1., 0., 2 * math.pi);
  cairo_restore (cr);
end
