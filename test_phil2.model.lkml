connection: "qa-quest"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: aging_data {}

explore: category_recycling {
  join: service_category {
    type: left_outer
    sql_on: ${category_recycling.service_category_id} = ${service_category.id} ;;
    relationship: many_to_one
  }

  join: recycling_method {
    type: left_outer
    sql_on: ${category_recycling.recycling_method_id} = ${recycling_method.id} ;;
    relationship: many_to_one
  }

  join: line_of_business {
    type: left_outer
    sql_on: ${service_category.line_of_business_id} = ${line_of_business.id} ;;
    relationship: many_to_one
  }
}

explore: container {
  join: customer {
    type: left_outer
    sql_on: ${container.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }

  join: service_category {
    type: left_outer
    sql_on: ${container.service_category_id} = ${service_category.id} ;;
    relationship: many_to_one
  }

  join: customer_profile {
    type: left_outer
    sql_on: ${customer.customer_profile_id} = ${customer_profile.id} ;;
    relationship: many_to_one
  }

  join: customer_segment {
    type: left_outer
    sql_on: ${customer.customer_segment_id} = ${customer_segment.id} ;;
    relationship: many_to_one
  }

  join: customer_type {
    type: left_outer
    sql_on: ${customer.customer_type_id} = ${customer_type.id} ;;
    relationship: many_to_one
  }

  join: line_of_business {
    type: left_outer
    sql_on: ${service_category.line_of_business_id} = ${line_of_business.id} ;;
    relationship: many_to_one
  }
}

explore: client_monthly_totals {
  join: client_facts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${client_monthly_totals.client_name} = ${client_facts.clientname} ;;
  }
}

explore: customer {
  label: "Locations-Sites"

  join: customer_profile {
    type: left_outer
    sql_on: ${customer.customer_profile_id} = ${customer_profile.id} ;;
    relationship: many_to_one
  }

  join: customer_segment {
    type: left_outer
    sql_on: ${customer.customer_segment_id} = ${customer_segment.id} ;;
    relationship: many_to_one
  }

  join: customer_type {
    type: left_outer
    sql_on: ${customer.customer_type_id} = ${customer_type.id} ;;
    relationship: many_to_one
  }
}

# - explore: customer_categories
#   joins:
#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer_categories.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: service_category
#       type: left_outer
#       sql_on: ${customer_categories.service_category_id} = ${service_category.id}
#       relationship: many_to_one

#     - join: line_of_business
#       type: left_outer
#       sql_on: ${service_category.line_of_business_id} = ${line_of_business.id}
#       relationship: many_to_one


# - explore: customer_documents
#   joins:
#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer_documents.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one


explore: customer_profile {
  label: "Customer Name"
}

explore: customer_segment {
  join: customer_profile {
    type: left_outer
    sql_on: ${customer_segment.customer_profile_id} = ${customer_profile.id} ;;
    relationship: many_to_one
  }
}

# - explore: customer_segment_label
#   joins:
#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer_segment_label.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one


explore: customer_type {
  join: customer_profile {
    type: left_outer
    sql_on: ${customer_type.customer_profile_id} = ${customer_profile.id} ;;
    relationship: many_to_one
  }
}

# - explore: customer_type_categories
#   joins:
#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer_type_categories.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one

#     - join: service_category
#       type: left_outer
#       sql_on: ${customer_type_categories.service_category_id} = ${service_category.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer_type.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: line_of_business
#       type: left_outer
#       sql_on: ${service_category.line_of_business_id} = ${line_of_business.id}
#       relationship: many_to_one


# - explore: customer_type_customer_segments
#   joins:
#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer_type_customer_segments.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one

#     - join: customer_segment
#       type: left_outer
#       sql_on: ${customer_type_customer_segments.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer_type.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one


# - explore: exception
#   joins:
#     - join: service_category
#       type: left_outer
#       sql_on: ${exception.service_category_id} = ${service_category.id}
#       relationship: many_to_one

#     - join: line_of_business
#       type: left_outer
#       sql_on: ${service_category.line_of_business_id} = ${line_of_business.id}
#       relationship: many_to_one


# - explore: file_import_log
#   joins:
#     - join: customer_profile
#       type: left_outer
#       sql_on: ${file_import_log.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: data_source
#       type: left_outer
#       sql_on: ${file_import_log.data_source_id} = ${data_source.id}
#       relationship: many_to_one


# - explore: file_validation

# - explore: food_rescue
#   joins:
#     - join: customer
#       type: left_outer
#       sql_on: ${food_rescue.customer_id} = ${customer.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: customer_segment
#       type: left_outer
#       sql_on: ${customer.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one


explore: line_of_business {}

# - explore: net_suite_item_mapping
#   joins:
#     - join: vendor
#       type: left_outer
#       sql_on: ${net_suite_item_mapping.vendor_id} = ${vendor.id}
#       relationship: many_to_one



explore: recycle_center {}

explore: recycling_method {}

# - explore: recycling_method_summary
#   joins:
#      - join: customer
#        type: left_outer
#        sql_on: ${recycling_method_summary.customer_id} = ${customer.id}
#        relationship: many_to_one
#
#      - join: recycling_method
#        type: left_outer
#        sql_on: ${recycling_method_summary.recycling_method_id} = ${recycling_method.id}
#        relationship: many_to_one
#
#      - join: service_category
#        type: left_outer
#        sql_on: ${recycling_method_summary.service_category_id} = ${service_category.id}
#        relationship: many_to_one
#
#      - join: customer_profile
#        type: left_outer
#        sql_on: ${customer.customer_profile_id} = ${customer_profile.id}
#        relationship: many_to_one
#
#      - join: customer_segment
#        type: left_outer
#        sql_on: ${customer.customer_segment_id} = ${customer_segment.id}
#        relationship: many_to_one
#
#      - join: customer_type
#        type: left_outer
#        sql_on: ${customer.customer_type_id} = ${customer_type.id}
#        relationship: many_to_one
#
#      - join: line_of_business
#        type: left_outer
#        sql_on: ${service_category.line_of_business_id} = ${line_of_business.id}
#        relationship: many_to_one


explore: recycling_percentage {
  join: customer {
    type: left_outer
    sql_on: ${recycling_percentage.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }

  join: category_recycling {
    type: left_outer
    sql_on: ${recycling_percentage.category_recycling_id} = ${category_recycling.id} ;;
    relationship: many_to_one
  }

  join: customer_profile {
    type: left_outer
    sql_on: ${customer.customer_profile_id} = ${customer_profile.id} ;;
    relationship: many_to_one
  }

  join: customer_segment {
    type: left_outer
    sql_on: ${customer.customer_segment_id} = ${customer_segment.id} ;;
    relationship: many_to_one
  }

  join: customer_type {
    type: left_outer
    sql_on: ${customer.customer_type_id} = ${customer_type.id} ;;
    relationship: many_to_one
  }

  join: service_category {
    type: left_outer
    sql_on: ${category_recycling.service_category_id} = ${service_category.id} ;;
    relationship: many_to_one
  }

  join: recycling_method {
    type: left_outer
    sql_on: ${category_recycling.recycling_method_id} = ${recycling_method.id} ;;
    relationship: many_to_one
  }

  join: line_of_business {
    type: left_outer
    sql_on: ${service_category.line_of_business_id} = ${line_of_business.id} ;;
    relationship: many_to_one
  }
}

explore: service_category {
  join: line_of_business {
    type: left_outer
    sql_on: ${service_category.line_of_business_id} = ${line_of_business.id} ;;
    relationship: many_to_one
  }
}

# - explore: service_category_attribute
#   joins:
#     - join: service_category
#       type: left_outer
#       sql_on: ${service_category_attribute.service_category_id} = ${service_category.id}
#       relationship: many_to_one

#     - join: line_of_business
#       type: left_outer
#       sql_on: ${service_category.line_of_business_id} = ${line_of_business.id}
#       relationship: many_to_one


# - explore: service_category_attribute_value
#   joins:
#     - join: vendor_service
#       type: left_outer
#       sql_on: ${service_category_attribute_value.vendor_service_id} = ${vendor_service.id}
#       relationship: many_to_one

#     - join: service_category_attribute
#       type: left_outer
#       sql_on: ${service_category_attribute_value.service_category_attribute_id} = ${service_category_attribute.id}
#       relationship: many_to_one

#     - join: customer
#       type: left_outer
#       sql_on: ${vendor_service.customer_id} = ${customer.id}
#       relationship: many_to_one

#     - join: customer_segment
#       type: left_outer
#       sql_on: ${vendor_service.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: vendor
#       type: left_outer
#       sql_on: ${vendor_service.vendor_id} = ${vendor.id}
#       relationship: many_to_one

#     - join: service_category
#       type: left_outer
#       sql_on: ${vendor_service.service_category_id} = ${service_category.id}
#       relationship: many_to_one

#     - join: recycle_center
#       type: left_outer
#       sql_on: ${vendor_service.recycle_center_id} = ${recycle_center.id}
#       relationship: many_to_one

#     - join: exception
#       type: left_outer
#       sql_on: ${vendor_service.exception_id} = ${exception.id}
#       relationship: many_to_one

#     - join: data_source
#       type: left_outer
#       sql_on: ${vendor_service.data_source_id} = ${data_source.id}
#       relationship: many_to_one

#     - join: file_import_log
#       type: left_outer
#       sql_on: ${vendor_service.file_import_log_id} = ${file_import_log.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one

#     - join: line_of_business
#       type: left_outer
#       sql_on: ${service_category.line_of_business_id} = ${line_of_business.id}
#       relationship: many_to_one


# - explore: service_category_attribute_value_bk
#   joins:
#     - join: vendor_service
#       type: left_outer
#       sql_on: ${service_category_attribute_value_bk.vendor_service_id} = ${vendor_service.id}
#       relationship: many_to_one

#     - join: service_category_attribute
#       type: left_outer
#       sql_on: ${service_category_attribute_value_bk.service_category_attribute_id} = ${service_category_attribute.id}
#       relationship: many_to_one

#     - join: customer
#       type: left_outer
#       sql_on: ${vendor_service.customer_id} = ${customer.id}
#       relationship: many_to_one

#     - join: customer_segment
#       type: left_outer
#       sql_on: ${vendor_service.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: vendor
#       type: left_outer
#       sql_on: ${vendor_service.vendor_id} = ${vendor.id}
#       relationship: many_to_one

#     - join: service_category
#       type: left_outer
#       sql_on: ${vendor_service.service_category_id} = ${service_category.id}
#       relationship: many_to_one

#     - join: recycle_center
#       type: left_outer
#       sql_on: ${vendor_service.recycle_center_id} = ${recycle_center.id}
#       relationship: many_to_one

#     - join: exception
#       type: left_outer
#       sql_on: ${vendor_service.exception_id} = ${exception.id}
#       relationship: many_to_one

#     - join: data_source
#       type: left_outer
#       sql_on: ${vendor_service.data_source_id} = ${data_source.id}
#       relationship: many_to_one

#     - join: file_import_log
#       type: left_outer
#       sql_on: ${vendor_service.file_import_log_id} = ${file_import_log.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one

#     - join: line_of_business
#       type: left_outer
#       sql_on: ${service_category.line_of_business_id} = ${line_of_business.id}
#       relationship: many_to_one


explore: service_request {
  join: customer {
    type: left_outer
    sql_on: ${service_request.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }

  #     - join: data_source
  #       type: left_outer
  #       sql_on: ${service_request.data_source_id} = ${data_source.id}
  #       relationship: many_to_one

  #     - join: file_import_log
  #       type: left_outer
  #       sql_on: ${service_request.file_import_log_id} = ${file_import_log.id}
  #       relationship: many_to_one

  join: customer_profile {
    type: left_outer
    sql_on: ${customer.customer_profile_id} = ${customer_profile.id} ;;
    relationship: many_to_one
  }

  join: customer_segment {
    type: left_outer
    sql_on: ${customer.customer_segment_id} = ${customer_segment.id} ;;
    relationship: many_to_one
  }

  join: customer_type {
    type: left_outer
    sql_on: ${customer.customer_type_id} = ${customer_type.id} ;;
    relationship: many_to_one
  }
}

explore: service_type_mapping {
  join: service_category {
    type: left_outer
    sql_on: ${service_type_mapping.service_category_id} = ${service_category.id} ;;
    relationship: many_to_one
  }

  join: line_of_business {
    type: left_outer
    sql_on: ${service_category.line_of_business_id} = ${line_of_business.id} ;;
    relationship: many_to_one
  }
}

# - explore: sharepoint_user

# - explore: staging_file_load
#   joins:
#     - join: vendor
#       type: left_outer
#       sql_on: ${staging_file_load.vendor_id} = ${vendor.id}
#       relationship: many_to_one


# - explore: staging_fleet_raw

# - explore: staging_msw
#   joins:
#     - join: staging_mswraw
#       type: left_outer
#       sql_on: ${staging_msw.staging_mswraw_id} = ${staging_mswraw.id}
#       relationship: many_to_one

#     - join: customer
#       type: left_outer
#       sql_on: ${staging_msw.customer_id} = ${customer.id}
#       relationship: many_to_one

#     - join: vendor
#       type: left_outer
#       sql_on: ${staging_msw.vendor_id} = ${vendor.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: customer_segment
#       type: left_outer
#       sql_on: ${customer.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one


# - explore: staging_mswraw
#   joins:
#     - join: customer
#       type: left_outer
#       sql_on: ${staging_mswraw.customer_id} = ${customer.id}
#       relationship: many_to_one

#     - join: vendor
#       type: left_outer
#       sql_on: ${staging_mswraw.vendor_id} = ${vendor.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: customer_segment
#       type: left_outer
#       sql_on: ${customer.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one


# - explore: staging_occ

# - explore: staging_raw_unmapped

# - explore: staging_ucoraw

# - explore: staging_walmart_tmg

# - explore: stg_mr

# - explore: stg_mswmaster

# - explore: stg_organics

# - explore: stg_organics_bak

# - explore: stg_organics_fmqfc

# - explore: stg_orgmaster

# - explore: stg_syte_type

# - explore: stg_uco

# - explore: stg_ucosummary

explore: sustainability {
  join: customer {
    type: left_outer
    sql_on: ${sustainability.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }

  join: customer_profile {
    type: left_outer
    sql_on: ${customer.customer_profile_id} = ${customer_profile.id} ;;
    relationship: many_to_one
  }

  join: customer_segment {
    type: left_outer
    sql_on: ${customer.customer_segment_id} = ${customer_segment.id} ;;
    relationship: many_to_one
  }

  join: customer_type {
    type: left_outer
    sql_on: ${customer.customer_type_id} = ${customer_type.id} ;;
    relationship: many_to_one
  }
}

# - explore: sysdiagrams

# - explore: system_quest_error_handling

# - explore: tires

# - explore: tmp_insert_recycle_centers

# - explore: tmpupdaterecycle

# - explore: tp_1

# - explore: tp_2

# - explore: tpkroger_orgs

# - explore: uco

# - explore: user_activity
#   joins:
#     - join: asp_net_users
#       type: left_outer
#       sql_on: ${user_activity.asp_net_user_id} = ${asp_net_users.id}
#       relationship: many_to_one


# - explore: user_activity_detail
#   joins:
#     - join: user_activity
#       type: left_outer
#       sql_on: ${user_activity_detail.user_activity_id} = ${user_activity.id}
#       relationship: many_to_one

#     - join: asp_net_users
#       type: left_outer
#       sql_on: ${user_activity.asp_net_user_id} = ${asp_net_users.id}
#       relationship: many_to_one


# - explore: user_customers
#   joins:
#     - join: asp_net_users
#       type: left_outer
#       sql_on: ${user_customers.asp_net_user_id} = ${asp_net_users.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${user_customers.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one


# - explore: user_data_access
#   joins:
#     - join: line_of_business
#       type: left_outer
#       sql_on: ${user_data_access.line_of_business_id} = ${line_of_business.id}
#       relationship: many_to_one

#     - join: service_category
#       type: left_outer
#       sql_on: ${user_data_access.service_category_id} = ${service_category.id}
#       relationship: many_to_one


# - explore: user_geoaccess
#   joins:
#     - join: customer_segment
#       type: left_outer
#       sql_on: ${user_geoaccess.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: customer
#       type: left_outer
#       sql_on: ${user_geoaccess.customer_id} = ${customer.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer_segment.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one


explore: vendor {}

# explore: vendor_bak

explore: vendor_service {
  join: customer {
    view_label: "location-site"
    type: left_outer
    sql_on: ${vendor_service.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }

  join: customer_segment {
    type: left_outer
    sql_on: ${vendor_service.customer_segment_id} = ${customer_segment.id} ;;
    relationship: many_to_one
  }

  join: vendor {
    type: left_outer
    sql_on: ${vendor_service.vendor_id} = ${vendor.id} ;;
    relationship: many_to_one
  }

  join: service_category {
    type: left_outer
    sql_on: ${vendor_service.service_category_id} = ${service_category.id} ;;
    relationship: many_to_one
  }

  join: recycle_center {
    type: left_outer
    sql_on: ${vendor_service.recycle_center_id} = ${recycle_center.id} ;;
    relationship: many_to_one
  }

  #    - join: exception
  #      type: left_outer
  #      sql_on: ${vendor_service.exception_id} = ${exception.id}
  #      relationship: many_to_one

  #    - join: data_source
  #      type: left_outer
  #      sql_on: ${vendor_service.data_source_id} = ${data_source.id}
  #      relationship: many_to_one

  #     - join: file_import_log
  #       type: left_outer
  #       sql_on: ${vendor_service.file_import_log_id} = ${file_import_log.id}
  #       relationship: many_to_one

  join: customer_profile {
    view_label: "Customer"
    type: left_outer
    sql_on: ${customer.customer_profile_id} = ${customer_profile.id} ;;
    relationship: many_to_one
  }

  join: customer_type {
    type: left_outer
    sql_on: ${customer.customer_type_id} = ${customer_type.id} ;;
    relationship: many_to_one
  }

  join: line_of_business {
    type: left_outer
    sql_on: ${service_category.line_of_business_id} = ${line_of_business.id} ;;
    relationship: many_to_one
  }

  join: category_recycling {
    type: left_outer
    sql_on: ${service_category.id} = ${category_recycling.service_category_id} ;;
    relationship: many_to_one
  }

  join: recycling_method {
    type: left_outer
    sql_on: ${category_recycling.recycling_method_id} = ${recycling_method.id} ;;
    relationship: many_to_one
  }

  join: recycling_percentage {
    type: left_outer
    sql_on: ${category_recycling.id} = ${recycling_percentage.category_recycling_id} and ${customer.id} = ${recycling_percentage.customer_id} ;;
    relationship: one_to_many
  }
}

# - explore: vendor_service_bak
#   joins:
#     - join: customer
#       type: left_outer
#       sql_on: ${vendor_service_bak.customer_id} = ${customer.id}
#       relationship: many_to_one

#     - join: vendor
#       type: left_outer
#       sql_on: ${vendor_service_bak.vendor_id} = ${vendor.id}
#       relationship: many_to_one

#     - join: service_category
#       type: left_outer
#       sql_on: ${vendor_service_bak.service_category_id} = ${service_category.id}
#       relationship: many_to_one

#     - join: recycle_center
#       type: left_outer
#       sql_on: ${vendor_service_bak.recycle_center_id} = ${recycle_center.id}
#       relationship: many_to_one

#     - join: exception
#       type: left_outer
#       sql_on: ${vendor_service_bak.exception_id} = ${exception.id}
#       relationship: many_to_one

#     - join: data_source
#       type: left_outer
#       sql_on: ${vendor_service_bak.data_source_id} = ${data_source.id}
#       relationship: many_to_one

#     - join: file_import_log
#       type: left_outer
#       sql_on: ${vendor_service_bak.file_import_log_id} = ${file_import_log.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: customer_segment
#       type: left_outer
#       sql_on: ${customer.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one

#     - join: line_of_business
#       type: left_outer
#       sql_on: ${service_category.line_of_business_id} = ${line_of_business.id}
#       relationship: many_to_one


# - explore: vendor_service_excess_columns
#   joins:
#     - join: vendor_service
#       type: left_outer
#       sql_on: ${vendor_service_excess_columns.vendor_service_id} = ${vendor_service.id}
#       relationship: many_to_one

#     - join: customer
#       type: left_outer
#       sql_on: ${vendor_service.customer_id} = ${customer.id}
#       relationship: many_to_one

#     - join: customer_segment
#       type: left_outer
#       sql_on: ${vendor_service.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: vendor
#       type: left_outer
#       sql_on: ${vendor_service.vendor_id} = ${vendor.id}
#       relationship: many_to_one

#     - join: service_category
#       type: left_outer
#       sql_on: ${vendor_service.service_category_id} = ${service_category.id}
#       relationship: many_to_one

#     - join: recycle_center
#       type: left_outer
#       sql_on: ${vendor_service.recycle_center_id} = ${recycle_center.id}
#       relationship: many_to_one

#     - join: exception
#       type: left_outer
#       sql_on: ${vendor_service.exception_id} = ${exception.id}
#       relationship: many_to_one

#     - join: data_source
#       type: left_outer
#       sql_on: ${vendor_service.data_source_id} = ${data_source.id}
#       relationship: many_to_one

#     - join: file_import_log
#       type: left_outer
#       sql_on: ${vendor_service.file_import_log_id} = ${file_import_log.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one

#     - join: line_of_business
#       type: left_outer
#       sql_on: ${service_category.line_of_business_id} = ${line_of_business.id}
#       relationship: many_to_one


# - explore: vendor_service_summary
#   joins:
#     - join: customer
#       type: left_outer
#       sql_on: ${vendor_service_summary.customer_id} = ${customer.id}
#       relationship: many_to_one

#     - join: service_category
#       type: left_outer
#       sql_on: ${vendor_service_summary.service_category_id} = ${service_category.id}
#       relationship: many_to_one

#     - join: customer_profile
#       type: left_outer
#       sql_on: ${customer.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: customer_segment
#       type: left_outer
#       sql_on: ${customer.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: customer_type
#       type: left_outer
#       sql_on: ${customer.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one

#     - join: line_of_business
#       type: left_outer
#       sql_on: ${service_category.line_of_business_id} = ${line_of_business.id}
#       relationship: many_to_one


# - explore: wal_org

# - explore: wal_rendering

# - explore: wal_tires

# - explore: wal_uco

# - explore: wal_umo

# - explore: wal_uof

# - explore: wal_uomdiy

# - explore: walmart_master
#   joins:
#     - join: customer_profile
#       type: left_outer
#       sql_on: ${walmart_master.customer_profile_id} = ${customer_profile.id}
#       relationship: many_to_one

#     - join: customer_segment
#       type: left_outer
#       sql_on: ${walmart_master.customer_segment_id} = ${customer_segment.id}
#       relationship: many_to_one

#     - join: customer_type
#       type: left_outer
#       sql_on: ${walmart_master.customer_type_id} = ${customer_type.id}
#       relationship: many_to_one
