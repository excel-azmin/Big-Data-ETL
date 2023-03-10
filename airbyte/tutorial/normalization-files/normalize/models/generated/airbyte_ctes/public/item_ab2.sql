{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('item_ab1') }}
select
    cast(_id as {{ dbt_utils.type_string() }}) as _id,
    cast(idx as {{ dbt_utils.type_float() }}) as idx,
    cast(mrp as {{ dbt_utils.type_float() }}) as mrp,
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    uoms,
    cast(uuid as {{ dbt_utils.type_string() }}) as uuid,
    cast(brand as {{ dbt_utils.type_string() }}) as brand,
    cast(image as {{ dbt_utils.type_string() }}) as image,
    cast({{ adapter.quote('owner') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('owner') }},
    taxes,
    cast(doctype as {{ dbt_utils.type_string() }}) as doctype,
    barcodes,
    cast(creation as {{ dbt_utils.type_string() }}) as creation,
    cast(disabled as {{ dbt_utils.type_float() }}) as disabled,
    {{ cast_to_boolean('issynced') }} as issynced,
    cast(modified as {{ dbt_utils.type_string() }}) as modified,
    cast(docstatus as {{ dbt_utils.type_float() }}) as docstatus,
    cast(item_code as {{ dbt_utils.type_string() }}) as item_code,
    cast(item_name as {{ dbt_utils.type_string() }}) as item_name,
    cast(stock_uom as {{ dbt_utils.type_string() }}) as stock_uom,
    cast(thumbnail as {{ dbt_utils.type_string() }}) as thumbnail,
    cast(weightage as {{ dbt_utils.type_float() }}) as weightage,
    {{ adapter.quote('attributes') }},
    cast(item_group as {{ dbt_utils.type_string() }}) as item_group,
    cast(description as {{ dbt_utils.type_string() }}) as description,
    cast(end_of_life as {{ dbt_utils.type_string() }}) as end_of_life,
    cast(modified_by as {{ dbt_utils.type_string() }}) as modified_by,
    bundle_items,
    cast(has_batch_no as {{ dbt_utils.type_float() }}) as has_batch_no,
    cast(has_variants as {{ dbt_utils.type_float() }}) as has_variants,
    cast(max_discount as {{ dbt_utils.type_float() }}) as max_discount,
    cast(minimumprice as {{ dbt_utils.type_float() }}) as minimumprice,
    cast(no_of_months as {{ dbt_utils.type_float() }}) as no_of_months,
    cast(safety_stock as {{ dbt_utils.type_float() }}) as safety_stock,
    cast(customer_code as {{ dbt_utils.type_string() }}) as customer_code,
    cast(has_serial_no as {{ dbt_utils.type_float() }}) as has_serial_no,
    cast(is_sales_item as {{ dbt_utils.type_float() }}) as is_sales_item,
    cast(is_stock_item as {{ dbt_utils.type_float() }}) as is_stock_item,
    item_defaults,
    cast(min_order_qty as {{ dbt_utils.type_float() }}) as min_order_qty,
    cast(naming_series as {{ dbt_utils.type_string() }}) as naming_series,
    cast(opening_stock as {{ dbt_utils.type_float() }}) as opening_stock,
    cast(retain_sample as {{ dbt_utils.type_float() }}) as retain_sample,
    cast(website_image as {{ dbt_utils.type_string() }}) as website_image,
    cast(asset_category as {{ dbt_utils.type_string() }}) as asset_category,
    customer_items,
    cast(is_fixed_asset as {{ dbt_utils.type_float() }}) as is_fixed_asset,
    cast(lead_time_days as {{ dbt_utils.type_float() }}) as lead_time_days,
    cast(publish_in_hub as {{ dbt_utils.type_float() }}) as publish_in_hub,
    reorder_levels,
    supplier_items,
    cast(has_expiry_date as {{ dbt_utils.type_float() }}) as has_expiry_date,
    cast(sample_quantity as {{ dbt_utils.type_float() }}) as sample_quantity,
    cast(show_in_website as {{ dbt_utils.type_float() }}) as show_in_website,
    cast(synced_with_hub as {{ dbt_utils.type_float() }}) as synced_with_hub,
    cast(warranty_period as {{ dbt_utils.type_string() }}) as warranty_period,
    cast(weight_per_unit as {{ dbt_utils.type_float() }}) as weight_per_unit,
    cast(create_new_batch as {{ dbt_utils.type_float() }}) as create_new_batch,
    cast(is_item_from_hub as {{ dbt_utils.type_float() }}) as is_item_from_hub,
    cast(is_purchase_item as {{ dbt_utils.type_float() }}) as is_purchase_item,
    cast(no_of_months_exp as {{ dbt_utils.type_float() }}) as no_of_months_exp,
    cast(valuation_method as {{ dbt_utils.type_string() }}) as valuation_method,
    cast(variant_based_on as {{ dbt_utils.type_string() }}) as variant_based_on,
    cast(country_of_origin as {{ dbt_utils.type_string() }}) as country_of_origin,
    cast(has_excel_serials as {{ dbt_utils.type_string() }}) as has_excel_serials,
    cast(auto_create_assets as {{ dbt_utils.type_float() }}) as auto_create_assets,
    cast(shelf_life_in_days as {{ dbt_utils.type_float() }}) as shelf_life_in_days,
    cast(asset_naming_series as {{ dbt_utils.type_string() }}) as asset_naming_series,
    cast(saleswarrantymonths as {{ dbt_utils.type_float() }}) as saleswarrantymonths,
    cast(total_projected_qty as {{ dbt_utils.type_float() }}) as total_projected_qty,
    website_item_groups,
    cast(delivered_by_supplier as {{ dbt_utils.type_float() }}) as delivered_by_supplier,
    cast(allow_alternative_item as {{ dbt_utils.type_float() }}) as allow_alternative_item,
    cast(is_sub_contracted_item as {{ dbt_utils.type_float() }}) as is_sub_contracted_item,
    cast(over_billing_allowance as {{ dbt_utils.type_float() }}) as over_billing_allowance,
    cast(purchasewarrantymonths as {{ dbt_utils.type_float() }}) as purchasewarrantymonths,
    website_specifications,
    cast(enable_deferred_expense as {{ dbt_utils.type_float() }}) as enable_deferred_expense,
    cast(enable_deferred_revenue as {{ dbt_utils.type_float() }}) as enable_deferred_revenue,
    cast(show_variant_in_website as {{ dbt_utils.type_float() }}) as show_variant_in_website,
    cast(is_customer_provided_item as {{ dbt_utils.type_float() }}) as is_customer_provided_item,
    cast(default_material_request_type as {{ dbt_utils.type_string() }}) as default_material_request_type,
    cast(include_item_in_manufacturing as {{ dbt_utils.type_float() }}) as include_item_in_manufacturing,
    cast(standard_rate_aibyte_transform as {{ dbt_utils.type_string() }}) as standard_rate_aibyte_transform,
    cast(over_delivery_receipt_allowance as {{ dbt_utils.type_float() }}) as over_delivery_receipt_allowance,
    cast(valuation_rate_aibyte_transform as {{ dbt_utils.type_string() }}) as valuation_rate_aibyte_transform,
    cast(inspection_required_before_delivery as {{ dbt_utils.type_float() }}) as inspection_required_before_delivery,
    cast(inspection_required_before_purchase as {{ dbt_utils.type_float() }}) as inspection_required_before_purchase,
    cast(last_purchase_rate_aibyte_transform as {{ dbt_utils.type_string() }}) as last_purchase_rate_aibyte_transform,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('item_ab1') }}
-- item
where 1 = 1

