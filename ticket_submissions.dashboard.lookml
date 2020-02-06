- dashboard: ticket_submissions
  title: Ticket Submissions
  layout: newspaper
  elements:
  - title: Orgs Submitting
    name: Orgs Submitting
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: single_value
    fields: [tickets.count_orgs_submitting]
    sorts: [tickets.count_orgs_submitting desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Organizations Submitting Tickets
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name
    row: 0
    col: 8
    width: 8
    height: 3
  - title: Average Tickets per Org
    name: Average Tickets per Org
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: single_value
    fields: [tickets.count_distinct_organizations, tickets.count]
    sorts: [tickets.count_distinct_organizations desc]
    limit: 500
    dynamic_fields: [{table_calculation: average_tickets_per_org, label: Average tickets
          per org, expression: 'round(${tickets.count} / ${tickets.count_distinct_organizations},
          2)'}]
    hidden_fields: [tickets.count_distinct_organizations, tickets.count]
    show_comparison: false
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name
    row: 0
    col: 16
    width: 8
    height: 3
  - title: All Tickets
    name: All Tickets
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: single_value
    fields: [tickets.count]
    sorts: [tickets.count desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: All Time Tickets
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name
    row: 0
    col: 0
    width: 8
    height: 3
  - title: Ticket Submitted by Organization
    name: Ticket Submitted by Organization
    model: block_stitch_zendesk
    explore: tickets
    type: looker_area
    fields: [tickets.created_at_month, tickets.organization_name, tickets.count]
    pivots: [tickets.organization_name]
    fill_fields: [tickets.created_at_month]
    filters: {}
    sorts: [tickets.count desc 0, tickets.organization_name]
    limit: 1000
    column_limit: 20
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    colors: ["#FFCC00", "#1E2023", "#3399CC", "#CC3399", "#66CC66", "#999999", "#FF4E00",
      "#A2ECBA", "#9932CC", "#0000CD"]
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields:
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name
    row: 3
    col: 0
    width: 24
    height: 7
  - title: Ticket Stats by Organization
    name: Ticket Stats by Organization
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_grid
    fields: [organizations.name, tickets.count_open_tickets, tickets.count_solved_tickets,
      tickets.count, ticket_metrics.avg_full_resolution_time_in_days__business]
    filters:
      organizations.name: "-NULL"
    sorts: [tickets.count_open_tickets desc]
    limit: 500
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      tickets.count_open_tickets:
        is_active: true
        palette:
          palette_id: 5e8a5843-1633-1272-42da-68149f020d97
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#59afbd"
      tickets.count_solved_tickets:
        is_active: true
        palette:
          palette_id: ab2691d8-9a01-befa-a412-9d2a97b22d53
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#4ebdb8"
      tickets.count:
        is_active: true
        palette:
          palette_id: b4eac31d-574c-f599-fc32-e03f03953751
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#eb6543"
      ticket_metrics.avg_full_resolution_time_in_days__business:
        is_active: true
        palette:
          palette_id: 498dbac3-f22d-c038-52e2-01d2e8e5f490
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#9fed12"
      avg_resolution_days:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields:
    listen:
      date: ticket_metrics.created_date
      organization: ticket_metrics.organization_name
    row: 10
    col: 0
    width: 24
    height: 6
  - title: Peak Days
    name: Peak Days
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_column
    fields: [tickets.time_day_of_week, tickets.count]
    fill_fields: [tickets.time_day_of_week]
    sorts: [tickets.time_day_of_week]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: ''
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name
    row: 16
    col: 0
    width: 12
    height: 7
  - title: Peak Hours
    name: Peak Hours
    model: block_stitch_zendesk
    explore: ticket_metrics
    type: looker_column
    fields: [tickets.time_hour_of_day, tickets.count]
    fill_fields: [tickets.time_hour_of_day]
    sorts: [tickets.time_hour_of_day]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    point_style: none
    show_value_labels: true
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
      date: tickets.created_at_date
      organization: tickets.organization_name
    row: 16
    col: 12
    width: 12
    height: 7
  filters:
  - name: date
    title: Date
    type: date_filter
    default_value:
    allow_multiple_values: true
    required: false
  - name: organization
    title: Organization
    type: string_filter
    default_value:
    allow_multiple_values: true
    required: false
