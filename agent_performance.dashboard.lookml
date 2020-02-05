- dashboard: agent_performance
  title: Agent Performance
  layout: newspaper
  elements:
  - title: Tickets Solved
    name: Tickets Solved
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: single_value
    fields: [tickets.count_solved_tickets]
    limit: 500
    show_single_value_title: true
    show_comparison: false
    hidden_fields:
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email
    row: 0
    col: 0
    width: 8
    height: 3
  - title: Average Business Days to Resolution
    name: Average Business Days to Resolution
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: single_value
    fields: [ticket_metrics.avg_first_resolution_time_in_days__business]
    sorts: [ticket_metrics.avg_first_resolution_time_in_days__business desc]
    limit: 500
    show_single_value_title: true
    show_comparison: false
    hidden_fields:
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email
    row: 0
    col: 8
    width: 8
    height: 3
  - title: Average Business Hours to First Response
    name: Average Business Hours to First Response
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: single_value
    fields: [ticket_metrics.avg_reply_time_in_hours__business]
    sorts: [ticket_metrics.avg_reply_time_in_hours__business desc]
    limit: 500
    show_single_value_title: true
    show_comparison: false
    hidden_fields:
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email
    row: 0
    col: 16
    width: 8
    height: 3
  - title: Performance Over Time
    name: Performance Over Time
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_area
    fields: [ticket_metrics.created_week, ticket_metrics.count, ticket_metrics.avg_first_resolution_time_in_days__business,
      ticket_metrics.avg_reply_time_in_hours__business]
    sorts: [ticket_metrics.count desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: '', orientation: left, series: [{axisId: ticket_metrics.count,
            id: ticket_metrics.count, name: Ticket Metrics Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: ticket_metrics.avg_first_resolution_time_in_days__business,
            id: ticket_metrics.avg_first_resolution_time_in_days__business, name: Average
              Time To Resolution in Business Days}, {axisId: ticket_metrics.avg_reply_time_in_hours__business,
            id: ticket_metrics.avg_reply_time_in_hours__business, name: Average Reply
              Time in Hours}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    colors: ["#FFCC00", "#1E2023", "#3399CC", "#CC3399", "#66CC66", "#999999", "#FF4E00",
      "#A2ECBA", "#9932CC", "#0000CD"]
    series_types: {}
    point_style: none
    series_colors:
      average_reply_time_in_hours: "#3399CC"
      number_of_tickets: "#FFCC00"
      average_time_to_resolution_in_days: "#999999"
      ticket_metrics.avg_reply_time_in_hours__business: "#3399CC"
      ticket_metrics.avg_first_resolution_time_in_days__business: "#999999"
    series_labels:
      ticket_metrics.count: Ticket Metrics Count
      ticket_metrics.avg_reply_time_in_hours__business: Average Business Hours to
        First Response
      ticket_metrics.avg_first_resolution_time_in_days__business: Average Business
        Days to Resolution
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email
    row: 3
    col: 0
    width: 24
    height: 8
  - title: Performance by Group
    name: Performance by Group
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_column
    fields: [ticket_metrics.group_name, ticket_metrics.count, ticket_metrics.avg_first_resolution_time_in_days__business,
      ticket_metrics.avg_reply_time_in_hours__business]
    sorts: [ticket_metrics.count desc]
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: ticket_metrics.count,
            id: ticket_metrics.count, name: Ticket Metrics}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: '', orientation: right,
        series: [{axisId: ticket_metrics.avg_first_resolution_time_in_days__business,
            id: ticket_metrics.avg_first_resolution_time_in_days__business, name: Avg
              First Resolution Time In Days Business}, {axisId: ticket_metrics.avg_reply_time_in_hours__business,
            id: ticket_metrics.avg_reply_time_in_hours__business, name: Average Business
              Hours to First Response}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    colors: ["#FFCC00", "#1E2023", "#3399CC", "#CC3399", "#66CC66", "#999999", "#FF4E00",
      "#A2ECBA", "#9932CC", "#0000CD"]
    point_style: none
    series_colors:
      avg_first_resolution_time_in_business_days: "#999999"
      ticket_metrics.avg_reply_time_in_hours__business: "#3399CC"
      ticket_metrics.avg_first_resolution_time_in_days__business: "#999999"
    series_labels:
      ticket_metrics.avg_reply_time_in_hours__business: Average Business Hours to
        First Response
      ticket_metrics.avg_first_resolution_time_in_days__business: Average Business
        Days to Resolution
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email
    row: 11
    col: 0
    width: 24
    height: 8
  - title: Performance by Agent
    name: Performance by Agent
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_grid
    fields: [ticket_metrics.assignee_email, tickets.count_solved_tickets, ticket_metrics.avg_first_resolution_time_in_days__business,
      ticket_metrics.avg_reply_time_in_hours__business]
    filters: {}
    sorts: [tickets.count_solved_tickets desc]
    limit: 500
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      ticket_metrics.avg_first_resolution_time_in_days__business: Average Business
        Days to Resolution
      ticket_metrics.avg_reply_time_in_hours__business: Average Business Hours to
        First Response
    series_cell_visualizations:
      ticket_metrics.avg_reply_time_in_hours__business:
        is_active: true
        palette:
          palette_id: b192ed0f-c3f6-85f1-0a7f-10f0690eb541
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#3399CC"
      count_solved_tickets:
        is_active: true
        palette:
          palette_id: da4b3663-4de1-13fd-967d-8803ffde5c48
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#FFCC00"
      avg_reply_time_in_business_hours:
        is_active: true
        palette:
          palette_id: 958f5a69-bd3a-bfe0-22b7-481494cb9a16
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#3399CC"
      avg_first_resolution_time_in_business_days:
        is_active: true
        palette:
          palette_id: 68dea3a7-9598-4349-83cb-62fd549fbc85
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#999999"
      ticket_metrics.avg_first_resolution_time_in_days__business:
        is_active: true
        palette:
          palette_id: 19280636-052a-b11c-12cc-0e1d9302db09
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#999999"
      tickets.count_solved_tickets:
        is_active: true
        palette:
          palette_id: a8c2a41d-8c3b-6fb0-dcd2-2df0bfe333de
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#FFCC00"
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
    hidden_fields: []
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email
    row: 19
    col: 0
    width: 24
    height: 8
  filters:
  - name: date
    title: Date
    type: date_filter
    default_value:
    allow_multiple_values: true
    required: false
  - name: group
    title: Group
    type: string_filter
    default_value:
    allow_multiple_values: true
    required: false
  - name: agent
    title: Agent
    type: string_filter
    default_value:
    allow_multiple_values: true
    required: false
