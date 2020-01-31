include: "//@{CONFIG_PROJECT_NAME}/ticket_history_audit.view"

view: ticket_history_audit {
  extends: [ticket_history_audit_config]
}

view: ticket_history_audit_core {
  derived_table: {
sql:
with ignore_nulls as (
select ticket_id,@{ZENDESK_SCHEMA_NAME}.ticket_audits__events.id, created_at, value
from@{ZENDESK_SCHEMA_NAME}.ticket_audits__events
inner join @{ZENDESK_SCHEMA_NAME}.ticket_audits on@{ZENDESK_SCHEMA_NAME}.ticket_audits__events._sdc_source_key_id =@{ZENDESK_SCHEMA_NAME}.ticket_audits.id
where value is not null
)

select
ticket_id,
value,
id,
count(*) over (partition by ticket_id) as ticket_actions,
last_value(value) over (partition by ticket_id order by id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_value
from ignore_nulls
group by 1, 2, 3
       ;;
  }

  dimension: ticket_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: ticket_actions {
    description: "Number of actions per ticket"
    type: number
    sql: ${TABLE}.ticket_actions ;;
  }

  dimension: last_value {
    sql: ${TABLE}.last_value ;;
  }

  dimension: is_last_history_entry {
    type: yesno
    sql: ${last_value} = 'closed' ;;
  }

  set: detail {
    fields: [ticket_id, ticket_actions, last_value]
  }
}