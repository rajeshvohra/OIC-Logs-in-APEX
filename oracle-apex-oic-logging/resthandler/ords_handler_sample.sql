-- Enable REST on a table or PL/SQL for logging

-- Use APEX functions to Create a RESTful GET handler for logs
BEGIN
    ORDS.DEFINE_MODULE(
        p_module_name    => 'oic_logs',
        p_base_path      => '/oic/logs/',
        p_items_per_page => 25
    );

    ORDS.DEFINE_TEMPLATE(
        p_module_name    => 'oic_logs',
        p_pattern        => 'errors/',
        p_priority       => 0
    );

    ORDS.DEFINE_HANDLER(
        p_module_name    => 'oic_logs',
        p_pattern        => 'errors/',
        p_method         => 'GET',
        p_source_type    => ORDS.SOURCE_TYPE_QUERY,
        p_source         => q'!
            SELECT INTEGRATION_ID, LOG_LEVEL, LOG_MESSAGE, CREATED_BY 
            FROM OIC_LOGS
            WHERE LOG_LEVEL = 'ERROR'
        !'
    );
END;
/
