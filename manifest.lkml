project_name: "block-stitch-zendesk-analytics"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-stitch-zendesk-config"
  export:  override_required
}

constant: CONNECTION_NAME {
  value: "zendesk connection name"
  export: override_required
}

constant: ZENDESK_SCHEMA_NAME {
  value: "zendesk"
  export: override_required
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: ZENDESK_SCHEMA_NAME {
    value: "@{ZENDESK_SCHEMA_NAME}"
  }

}
