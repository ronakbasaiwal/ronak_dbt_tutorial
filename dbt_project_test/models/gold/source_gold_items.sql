with dedup_query  as 
    ( select *, 
    row_number() over (partition by id order by updateDate desc) as dedup_key
     from {{ source('source','items') }} )

     Select id, name, category, updateDate from dedup_query where dedup_key = 1