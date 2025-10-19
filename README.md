# OIC-Logs-in-APEX
As technical developer, it is one of the key requirement to look at the log when OIC executes the code developed for the integration.
Here’s an outline and a set of files for a code repository demonstrating how to use Oracle APEX to add Oracle Integration Cloud (OIC) logs into logging tables. The solution will include:

Oracle table definition for storing logs
APEX page/process example (PL/SQL) for inserting logs
Example of REST Source Setup for OIC integration
README documentation

Github dirctory Structure
oracle-apex-oic-logging/
├── db/
│   └── logging_table.sql
├── apex/
│   └── insert_log_example.sql
├── rest/
│   └── oic_log_sample.json
└── README.md

# Oracle APEX - OIC Logs to Logging Table Example

This repository demonstrates how to use Oracle APEX to receive and store Oracle Integration Cloud (OIC) logs in a database logging table.

## 1. Database Setup

Run the following SQL to create your logging table:

```sql
@db/logging_table.sql
```

## 2. APEX Setup

- Create an APEX page with fields for Integration ID, Log Level, and Log Message.
- Add a process (on submit or as a REST POST handler) using the PL/SQL in `apex/insert_log_example.sql`.
- Map page items (`:P1_INTEGRATION_ID`, etc.) to your form or REST input.

## 3. OIC Integration (Example)

- OIC can call your APEX REST endpoint with a JSON payload like `rest/oic_log_sample.json`.
- Make sure your APEX app or ORDS REST service is exposed for OIC to call.

## 4. Viewing Logs

Query the `OIC_LOGS` table in SQL Developer, APEX SQL Workshop, or make a report page in APEX to view logged entries.

---

## References

- [Oracle APEX Documentation](https://docs.oracle.com/en/database/oracle/application-express/23.1/)
- [Oracle Integration Cloud REST API](https://docs.oracle.com/en/cloud/paas/integration-cloud/integrations-rest-api/)
