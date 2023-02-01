{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "public",
    post_hook = ["
                    {%
                        set scd_table_relation = adapter.get_relation(
                            database=this.database,
                            schema=this.schema,
                            identifier='item_scd'
                        )
                    %}
                    {%
                        if scd_table_relation is not none
                    %}
                    {%
                            do adapter.drop_relation(scd_table_relation)
                    %}
                    {% endif %}
                        "],
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('item_ab3') }}
select
    _id,
    idx,
    mrp,
    {{ adapter.quote('name') }},
    uoms,
    uuid,
    brand,
    image,
    {{ adapter.quote('owner') }},
    taxes,
    doctype,
    barcodes,
    creation,
    disabled,
    issynced,
    modified,
    docstatus,
    item_code,
    item_name,
    stock_uom,
    thumbnail,
    weightage,
    {{ adapter.quote('attributes') }},
    item_group,
    description,
    end_of_life,
    modified_by,
    bundle_items,
    has_batch_no,
    has_variants,
    max_discount,
    minimumprice,
    no_of_months,
    safety_stock,
    customer_code,
    has_serial_no,
    is_sales_item,
    is_stock_item,
    item_defaults,
    min_order_qty,
    naming_series,
    opening_stock,
    retain_sample,
    website_image,
    asset_category,
    customer_items,
    is_fixed_asset,
    lead_time_days,
    publish_in_hub,
    reorder_levels,
    supplier_items,
    has_expiry_date,
    sample_quantity,
    show_in_website,
    synced_with_hub,
    warranty_period,
    weight_per_unit,
    create_new_batch,
    is_item_from_hub,
    is_purchase_item,
    no_of_months_exp,
    valuation_method,
    variant_based_on,
    country_of_origin,
    has_excel_serials,
    auto_create_assets,
    shelf_life_in_days,
    asset_naming_series,
    saleswarrantymonths,
    total_projected_qty,
    website_item_groups,
    delivered_by_supplier,
    allow_alternative_item,
    is_sub_contracted_item,
    over_billing_allowance,
    purchasewarrantymonths,
    website_specifications,
    enable_deferred_expense,
    enable_deferred_revenue,
    show_variant_in_website,
    is_customer_provided_item,
    default_material_request_type,
    include_item_in_manufacturing,
    standard_rate_aibyte_transform,
    over_delivery_receipt_allowance,
    valuation_rate_aibyte_transform,
    inspection_required_before_delivery,
    inspection_required_before_purchase,
    last_purchase_rate_aibyte_transform,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_item_hashid
from {{ ref('item_ab3') }}
-- item from {{ source('public', '_airbyte_raw_item') }}
where 1 = 1

