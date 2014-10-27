--- ***  Drop and create the public display tables
DROP TABLE IF EXISTS administrative.valuation;
DROP TABLE IF EXISTS administrative.valuation_historic;
DROP TABLE IF EXISTS administrative.source_describes_valuation;
DROP TABLE IF EXISTS administrative.source_describes_valuation_historic;
DROP TABLE IF EXISTS administrative.valuation_type;

CREATE TABLE administrative.valuation
(
  id character varying(40) NOT NULL,
  nr character varying(40) NOT NULL, 
  ba_unit_id character varying(40) NOT NULL, 
  amount numeric(20, 2) DEFAULT 0,
  valuation_date timestamp without time zone DEFAULT now(),
  type_code character varying(20),
  description text,
  transaction_id character varying(20),
  classification_code character varying(20),
  redact_code character varying(20), 
  rowidentifier,
  rowversion integer NOT NULL DEFAULT 0,
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar,
  change_user character varying(50),
  change_time timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT valuation_pkey PRIMARY KEY (id),
  CONSTRAINT public_display_item_type_code_fk FOREIGN KEY (type_code)
      REFERENCES administrative.valuation_type (code) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE administrative.valuation_type
(
  code character varying(20) NOT NULL, 
  valuation_value character varying(250) NOT NULL, 
  description text, 
  status character(1) NOT NULL, 
  CONSTRAINT valuation_type_pkey PRIMARY KEY (code),
  CONSTRAINT valuation_type_valuation_value_unique UNIQUE (valuation_value)
);