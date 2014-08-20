-- 20 Aug 2014
 -- Fix the document nr number sequency
DROP SEQUENCE document.document_nr_seq;

CREATE SEQUENCE document.document_nr_seq
  INCREMENT 1
  MINVALUE 1000
  MAXVALUE 99999999
  START 1000
  CACHE 1
  CYCLE;
COMMENT ON SEQUENCE document.document_nr_seq
  IS 'Sequence number used as the basis for the document Nr field. This sequence is used by the Digital Archive EJB.';
