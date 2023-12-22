select 
    ho.load_datetime, 
    ho.order_id, 
    sto.price as price_per_item,
    sto.quantity,
    sto.product_id,
    sp.brand_id,
    pb.brand_name,
    sp.product_description,
    sp.price as total_price,
    sp.discount_percent,
    scc.category_name,
    sc.customer_id,
    sc.email,
    sc.name,
    caa.country,
    caa.city

from {{ ref('hub_orders') }} ho
left join {{ ref('link_order_customer') }}  oc
    on ho.order_hk = oc.order_hk
left join {{ ref('link_customer_address') }} ca
    on oc.customer_address_hk = ca.customer_address_hk 
left join {{ ref('link_order_item') }} oi
    on ho.order_hk = oi.order_hk
left join {{ ref('hub_product') }} hp
    on hp.product_hk = oi.product_hk
left join {{ ref('sat_customer') }} sc
    on oc.customer_hk = sc.customer_hk
left join {{ ref('sat_product') }} sp
    on sp.product_hk = oi.product_hk
    and sp.effective_to::date = '9999-12-31'::date
left join {{ ref('sat_customer_address') }} caa
    on caa.customer_address_hk = ca.customer_address_hk
left join {{ ref('sat_order_item') }}  sto
    on sto.order_hk = ho.order_hk
left join {{ ref('link_product_brand') }} lp
    on hp.product_hk = lp.product_hk
left join {{ ref('sat_product_brand') }} pb
    on lp.brand_hk = pb.brand_hk
left join {{ ref('link_product_category') }} pc
    on pc.product_hk = lp.product_hk
    and pc.effective_to::date ='9999-12-31'::date
left join {{ ref('sat_category') }} scc
    on pc.category_hk = scc.category_hk
where ho.order_id = 417 --check just how the output would be
