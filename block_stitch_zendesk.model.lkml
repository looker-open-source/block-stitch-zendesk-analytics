connection: "@{CONNECTION_NAME}"

include: "*.view.lkml"
include: "*.explore.lkml"
include: "*.dashboard.lookml"
include: "//@{CONFIG_PROJECT_NAME}/*.view.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.model.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.dashboard"

explore: audits {
  extends: [audits_config]
}

# explore: audits__events {
#    extends: [audits__events_config]
# }


explore: organizations {
  extends: [organizations_config]
}

explore: ticket_fields {
  extends: [ticket_fields_config]
}

explore: tickets {
  extends: [tickets_config]
}


explore: ticket__tags {
  extends: [ticket__tags_config]
}

explore: users {
  extends: [users_config]
}

explore: groups {
  extends: [groups_config]
}


explore: ticket_metrics {
  extends: [ticket_metrics_config]
}
