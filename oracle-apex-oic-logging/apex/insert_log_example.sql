-- Example APEX Process (PL/SQL) for inserting an OIC log into the table
-- This could be a process in an APEX page or a Web Source POST handler

DECLARE
    v_integration_id VARCHAR2(100) := :P1_INTEGRATION_ID;
    v_log_level      VARCHAR2(20)  := :P1_LOG_LEVEL;
    v_log_message    CLOB          := :P1_LOG_MESSAGE;
    v_created_by     VARCHAR2(100) := :APP_USER;
BEGIN
    INSERT INTO OIC_LOGS (
        INTEGRATION_ID,
        LOG_LEVEL,
        LOG_MESSAGE,
        CREATED_BY
    )
    VALUES (
        v_integration_id,
        v_log_level,
        v_log_message,
        v_created_by
    );
END;
