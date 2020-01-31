include: "//@{CONFIG_PROJECT_NAME}/groups.view"

view: groups {
  extends: [groups_config]
}

view: groups_core {
  sql_table_name:@{ZENDESK_SCHEMA_NAME}.groups ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: deleted {
      type: yesno
      sql: ${TABLE}.deleted ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}