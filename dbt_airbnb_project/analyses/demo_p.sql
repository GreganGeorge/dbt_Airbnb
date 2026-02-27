{% set flag = 12 %}
{% set columns = ['NIGHTS_BOOKED','BOOKING_ID','BOOKING_AMOUNT'] %}

SELECT 
{% for col in columns %}
    {{col}}
    {% if not loop.last %}
        ,        
    {% endif %}
{% endfor %}
FROM {{ref('bronze_bookings')}} 
{% if flag==1 %}
    WHERE NIGHTS_BOOKED=1
{% elif flag==2 %}
    WHERE NIGHTS_BOOKED=2
{% else %}
    WHERE NIGHTS_BOOKED>2
{% endif %}