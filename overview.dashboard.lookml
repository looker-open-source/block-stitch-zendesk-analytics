- dashboard: overview
  title: Overview
  layout: newspaper
  elements:
  - title: Top 20 Organizations by Tickets Submitted
    name: Top 20 Organizations by Tickets Submitted
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_grid
    fields: [organizations.name, tickets.count]
    filters:
      organizations.name: "-NULL"
    sorts: [tickets.count desc]
    limit: 20
    show_totals: true
    show_row_totals: true
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    series_types: {}
    listen:
      Date: tickets.created_at_date
    row: 19
    col: 0
    width: 8
    height: 8
  - title: New, Open, Solved, and Pending Ticket Count
    name: New, Open, Solved, and Pending Ticket Count
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_column
    fields: [tickets.count_solved_tickets, tickets.count_new_tickets, tickets.count_open_tickets,
      tickets.count_pending_tickets]
    sorts: [tickets.count_solved_tickets desc]
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_labels: false
    colors: ["#FFCC00", "#1E2023", "#3399CC", "#CC3399", "#66CC66", "#999999", "#FF4E00",
      "#A2ECBA", "#9932CC", "#0000CD"]
    hidden_fields: []
    listen:
      Date: tickets.created_at_date
    row: 11
    col: 12
    width: 12
    height: 8
  - title: New Open Tickets
    name: New Open Tickets
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: single_value
    fields: [tickets.count]
    filters:
      tickets.status: new,open
    sorts: [tickets.count desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: New and Open Tickets
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen:
      Date: tickets.created_at_date
    row: 0
    col: 0
    width: 8
    height: 3
  - title: Pending Tickets
    name: Pending Tickets
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: single_value
    fields: [tickets.status, tickets.count]
    filters:
      tickets.status: pending
    sorts: [tickets.count desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Pending Tickets
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen:
      Date: tickets.created_at_date
    row: 0
    col: 8
    width: 8
    height: 3
  - title: Untitled Visualization
    name: Untitled Visualization
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: single_value
    fields: [tickets.count]
    filters:
      tickets.status: closed,solved
    sorts: [tickets.count desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Closed and Solved Tickets
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen:
      Date: tickets.created_at_date
    row: 0
    col: 16
    width: 8
    height: 3
  - title: Ticket Submissions Over Time
    name: Ticket Submissions Over Time
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_area
    fields: [tickets.created_at_week, tickets.count, tickets.count_distinct_organizations]
    sorts: [tickets.created_at_week desc]
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    colors: ["#FFCC00", "#1E2023", "#3399CC", "#CC3399", "#66CC66", "#999999", "#FF4E00",
      "#A2ECBA", "#9932CC", "#0000CD"]
    hidden_fields:
    series_types: {}
    listen:
      Date: tickets.created_at_date
    row: 3
    col: 0
    width: 24
    height: 8
  - title: Tickets Submitted By Channel
    name: Tickets Submitted By Channel
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_pie
    fields: [tickets.via__channel, tickets.count]
    sorts: [tickets.count desc]
    limit: 500
    value_labels: legend
    colors: ["#FFCC00", "#1E2023", "#3399CC", "#CC3399", "#66CC66", "#999999", "#FF4E00",
      "#A2ECBA", "#9932CC", "#0000CD"]
    show_view_names: true
    hidden_fields:
    listen:
      Date: tickets.created_at_date
    row: 11
    col: 0
    width: 12
    height: 8
  - title: Top 20 Agents by All Time Tickets
    name: Top 20 Agents by All Time Tickets
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_grid
    fields: [tickets.assignee_email, tickets.count]
    filters:
      tickets.assignee_email: "-NULL"
    sorts: [tickets.count desc]
    limit: 20
    show_totals: true
    show_row_totals: true
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    series_types: {}
    hidden_fields:
    listen:
      Date: tickets.created_at_date
    row: 19
    col: 16
    width: 8
    height: 8
  - title: Top 20 Requesters by Tickets Submitted
    name: Top 20 Requesters by Tickets Submitted
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_grid
    fields: [tickets.requester_email, tickets.count]
    filters:
      tickets.requester_email: "-NULL"
    sorts: [tickets.count desc]
    limit: 20
    show_totals: true
    show_row_totals: true
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    series_types: {}
    listen:
      Date: tickets.created_at_date
    row: 19
    col: 8
    width: 8
    height: 8
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: ''
    allow_multiple_values: true
    required: false
