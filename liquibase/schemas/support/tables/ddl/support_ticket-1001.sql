--liquibase formatted sql
--changeset cjs123:support.support_ticket-1001 labels:release-0.0.1
--comment Adds new table named support.support_ticket

CREATE TABLE IF NOT EXISTS support.support_ticket
(
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    user_email character varying(100) NOT NULL,
    description text NOT NULL,
    due_date TIMESTAMP WITHOUT TIME ZONE DEFAULT current_timestamp,
    is_complete boolean NOT NULL DEFAULT 'false',
    CONSTRAINT support_ticket_pk PRIMARY KEY (id)
);

COMMENT ON TABLE support.support_ticket IS 'stores support ticket requests';

--rollback DROP TABLE IF EXISTS support.support_ticket