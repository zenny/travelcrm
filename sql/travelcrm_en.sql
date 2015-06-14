--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: currency; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE currency (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    iso_code character varying(3) NOT NULL
);


ALTER TABLE public.currency OWNER TO mazvv;

--
-- Name: _currencies_rid_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE _currencies_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._currencies_rid_seq OWNER TO mazvv;

--
-- Name: _currencies_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE _currencies_rid_seq OWNED BY currency.id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE employee (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    second_name character varying(32),
    itn character varying(32),
    dismissal_date date,
    photo character varying
);


ALTER TABLE public.employee OWNER TO mazvv;

--
-- Name: _employees_rid_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE _employees_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._employees_rid_seq OWNER TO mazvv;

--
-- Name: _employees_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE _employees_rid_seq OWNED BY employee.id;


--
-- Name: region; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE region (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    country_id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.region OWNER TO mazvv;

--
-- Name: _regions_rid_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE _regions_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._regions_rid_seq OWNER TO mazvv;

--
-- Name: _regions_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE _regions_rid_seq OWNED BY region.id;


--
-- Name: resource_log; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE resource_log (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    employee_id integer NOT NULL,
    comment character varying(512),
    modifydt timestamp with time zone
);


ALTER TABLE public.resource_log OWNER TO mazvv;

--
-- Name: _resources_logs_rid_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE _resources_logs_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._resources_logs_rid_seq OWNER TO mazvv;

--
-- Name: _resources_logs_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE _resources_logs_rid_seq OWNED BY resource_log.id;


--
-- Name: resource; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE resource (
    id integer NOT NULL,
    resource_type_id integer NOT NULL,
    structure_id integer NOT NULL,
    protected boolean
);


ALTER TABLE public.resource OWNER TO mazvv;

--
-- Name: _resources_rid_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE _resources_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._resources_rid_seq OWNER TO mazvv;

--
-- Name: _resources_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE _resources_rid_seq OWNED BY resource.id;


--
-- Name: resource_type; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE resource_type (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL,
    humanize character varying(32) NOT NULL,
    resource_name character varying(32) NOT NULL,
    module character varying(128) NOT NULL,
    descr character varying(128),
    settings json,
    status smallint NOT NULL
);


ALTER TABLE public.resource_type OWNER TO mazvv;

--
-- Name: _resources_types_rid_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE _resources_types_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._resources_types_rid_seq OWNER TO mazvv;

--
-- Name: _resources_types_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE _resources_types_rid_seq OWNED BY resource_type.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    username character varying(32) NOT NULL,
    email character varying(128),
    password character varying(128) NOT NULL,
    employee_id integer NOT NULL
);


ALTER TABLE public."user" OWNER TO mazvv;

--
-- Name: _users_rid_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE _users_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._users_rid_seq OWNER TO mazvv;

--
-- Name: _users_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE _users_rid_seq OWNED BY "user".id;


--
-- Name: accomodation; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE accomodation (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.accomodation OWNER TO mazvv;

--
-- Name: accomodation_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE accomodation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accomodation_id_seq OWNER TO mazvv;

--
-- Name: accomodation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE accomodation_id_seq OWNED BY accomodation.id;


--
-- Name: account; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE account (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    currency_id integer NOT NULL,
    account_type smallint NOT NULL,
    name character varying(255) NOT NULL,
    display_text character varying(255) NOT NULL,
    descr character varying(255),
    status smallint NOT NULL
);


ALTER TABLE public.account OWNER TO mazvv;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO mazvv;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE account_id_seq OWNED BY account.id;


--
-- Name: account_item; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE account_item (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(128) NOT NULL,
    parent_id integer,
    type integer NOT NULL,
    status integer NOT NULL,
    descr character varying(128)
);


ALTER TABLE public.account_item OWNER TO mazvv;

--
-- Name: account_item_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE account_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_item_id_seq OWNER TO mazvv;

--
-- Name: account_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE account_item_id_seq OWNED BY account_item.id;


--
-- Name: address; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE address (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    location_id integer NOT NULL,
    zip_code character varying(12) NOT NULL,
    address character varying(255) NOT NULL
);


ALTER TABLE public.address OWNER TO mazvv;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO mazvv;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE address_id_seq OWNED BY address.id;


--
-- Name: advsource; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE advsource (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.advsource OWNER TO mazvv;

--
-- Name: advsource_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE advsource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.advsource_id_seq OWNER TO mazvv;

--
-- Name: advsource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE advsource_id_seq OWNED BY advsource.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO mazvv;

--
-- Name: appointment; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE appointment (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    currency_id integer NOT NULL,
    employee_id integer NOT NULL,
    position_id integer NOT NULL,
    salary numeric(16,2) NOT NULL,
    date date
);


ALTER TABLE public.appointment OWNER TO mazvv;

--
-- Name: apscheduler_jobs; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE apscheduler_jobs (
    id character varying(191) NOT NULL,
    next_run_time double precision,
    job_state bytea NOT NULL
);


ALTER TABLE public.apscheduler_jobs OWNER TO mazvv;

--
-- Name: bank; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE bank (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.bank OWNER TO mazvv;

--
-- Name: bank_address; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE bank_address (
    bank_id integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.bank_address OWNER TO mazvv;

--
-- Name: bank_detail; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE bank_detail (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    currency_id integer NOT NULL,
    bank_id integer NOT NULL,
    beneficiary character varying(255),
    account character varying(32) NOT NULL,
    swift_code character varying(32) NOT NULL
);


ALTER TABLE public.bank_detail OWNER TO mazvv;

--
-- Name: bank_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE bank_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_detail_id_seq OWNER TO mazvv;

--
-- Name: bank_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE bank_detail_id_seq OWNED BY bank_detail.id;


--
-- Name: bank_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE bank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_id_seq OWNER TO mazvv;

--
-- Name: bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE bank_id_seq OWNED BY bank.id;


--
-- Name: bperson; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE bperson (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32),
    second_name character varying(32),
    position_name character varying(64),
    descr character varying(255),
    status smallint NOT NULL
);


ALTER TABLE public.bperson OWNER TO mazvv;

--
-- Name: bperson_contact; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE bperson_contact (
    bperson_id integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE public.bperson_contact OWNER TO mazvv;

--
-- Name: bperson_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE bperson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bperson_id_seq OWNER TO mazvv;

--
-- Name: bperson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE bperson_id_seq OWNED BY bperson.id;


--
-- Name: calculation; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE calculation (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    currency_id integer NOT NULL,
    price numeric(16,2) NOT NULL,
    base_price numeric(16,2) NOT NULL,
    order_item_id integer
);


ALTER TABLE public.calculation OWNER TO mazvv;

--
-- Name: calculation_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE calculation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calculation_id_seq OWNER TO mazvv;

--
-- Name: calculation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE calculation_id_seq OWNED BY calculation.id;


--
-- Name: cashflow; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE cashflow (
    id integer NOT NULL,
    subaccount_from_id integer,
    subaccount_to_id integer,
    account_item_id integer NOT NULL,
    sum numeric(16,2) NOT NULL,
    date date NOT NULL,
    vat numeric(16,2)
);


ALTER TABLE public.cashflow OWNER TO mazvv;

--
-- Name: commission; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE commission (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    service_id integer NOT NULL,
    percentage numeric(5,2) NOT NULL,
    price numeric(16,2) NOT NULL,
    currency_id integer NOT NULL,
    descr character varying(255),
    CONSTRAINT chk_commission_percentage CHECK (((percentage >= (0)::numeric) AND (percentage <= (100)::numeric)))
);


ALTER TABLE public.commission OWNER TO mazvv;

--
-- Name: commission_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE commission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commission_id_seq OWNER TO mazvv;

--
-- Name: commission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE commission_id_seq OWNED BY commission.id;


--
-- Name: position; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE "position" (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    structure_id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public."position" OWNER TO mazvv;

--
-- Name: companies_positions_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE companies_positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_positions_id_seq OWNER TO mazvv;

--
-- Name: companies_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE companies_positions_id_seq OWNED BY "position".id;


--
-- Name: company; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE company (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL,
    currency_id integer NOT NULL,
    settings json,
    email character varying(32) NOT NULL
);


ALTER TABLE public.company OWNER TO mazvv;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_id_seq OWNER TO mazvv;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE company_id_seq OWNED BY company.id;


--
-- Name: company_subaccount; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE company_subaccount (
    company_id integer NOT NULL,
    subaccount_id integer NOT NULL
);


ALTER TABLE public.company_subaccount OWNER TO mazvv;

--
-- Name: contact; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE contact (
    id integer NOT NULL,
    contact character varying NOT NULL,
    resource_id integer NOT NULL,
    contact_type integer NOT NULL,
    descr character varying(255),
    status smallint NOT NULL
);


ALTER TABLE public.contact OWNER TO mazvv;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO mazvv;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- Name: contract; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE contract (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    date date NOT NULL,
    num character varying NOT NULL,
    descr character varying(255),
    status smallint NOT NULL
);


ALTER TABLE public.contract OWNER TO mazvv;

--
-- Name: contract_commission; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE contract_commission (
    contract_id integer NOT NULL,
    commission_id integer NOT NULL
);


ALTER TABLE public.contract_commission OWNER TO mazvv;

--
-- Name: country; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE country (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    iso_code character varying(2) NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.country OWNER TO mazvv;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO mazvv;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE country_id_seq OWNED BY country.id;


--
-- Name: crosspayment; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE crosspayment (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    cashflow_id integer NOT NULL,
    descr character varying(255)
);


ALTER TABLE public.crosspayment OWNER TO mazvv;

--
-- Name: crosspayment_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE crosspayment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crosspayment_id_seq OWNER TO mazvv;

--
-- Name: crosspayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE crosspayment_id_seq OWNED BY crosspayment.id;


--
-- Name: currency_rate; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE currency_rate (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    date date NOT NULL,
    currency_id integer NOT NULL,
    rate numeric(16,2) NOT NULL,
    supplier_id integer NOT NULL
);


ALTER TABLE public.currency_rate OWNER TO mazvv;

--
-- Name: currency_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE currency_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currency_rate_id_seq OWNER TO mazvv;

--
-- Name: currency_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE currency_rate_id_seq OWNED BY currency_rate.id;


--
-- Name: email_campaign; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE email_campaign (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL,
    plain_content text NOT NULL,
    html_content text NOT NULL,
    start_dt timestamp with time zone NOT NULL,
    subject character varying(128) NOT NULL
);


ALTER TABLE public.email_campaign OWNER TO mazvv;

--
-- Name: email_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE email_campaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_campaign_id_seq OWNER TO mazvv;

--
-- Name: email_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE email_campaign_id_seq OWNED BY email_campaign.id;


--
-- Name: employee_address; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE employee_address (
    employee_id integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.employee_address OWNER TO mazvv;

--
-- Name: employee_contact; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE employee_contact (
    employee_id integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE public.employee_contact OWNER TO mazvv;

--
-- Name: employee_notification; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE employee_notification (
    employee_id integer NOT NULL,
    notification_id integer NOT NULL,
    status smallint NOT NULL
);


ALTER TABLE public.employee_notification OWNER TO mazvv;

--
-- Name: employee_passport; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE employee_passport (
    employee_id integer NOT NULL,
    passport_id integer NOT NULL
);


ALTER TABLE public.employee_passport OWNER TO mazvv;

--
-- Name: employee_subaccount; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE employee_subaccount (
    employee_id integer NOT NULL,
    subaccount_id integer NOT NULL
);


ALTER TABLE public.employee_subaccount OWNER TO mazvv;

--
-- Name: employees_appointments_h_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE employees_appointments_h_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_appointments_h_id_seq OWNER TO mazvv;

--
-- Name: employees_appointments_h_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE employees_appointments_h_id_seq OWNED BY appointment.id;


--
-- Name: foodcat; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE foodcat (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.foodcat OWNER TO mazvv;

--
-- Name: foodcat_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE foodcat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodcat_id_seq OWNER TO mazvv;

--
-- Name: foodcat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE foodcat_id_seq OWNED BY foodcat.id;


--
-- Name: hotel; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE hotel (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    hotelcat_id integer NOT NULL,
    name character varying(32) NOT NULL,
    location_id integer
);


ALTER TABLE public.hotel OWNER TO mazvv;

--
-- Name: hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE hotel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotel_id_seq OWNER TO mazvv;

--
-- Name: hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE hotel_id_seq OWNED BY hotel.id;


--
-- Name: hotelcat; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE hotelcat (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.hotelcat OWNER TO mazvv;

--
-- Name: hotelcat_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE hotelcat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotelcat_id_seq OWNER TO mazvv;

--
-- Name: hotelcat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE hotelcat_id_seq OWNED BY hotelcat.id;


--
-- Name: income; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE income (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    invoice_id integer NOT NULL,
    account_item_id integer NOT NULL,
    date date NOT NULL,
    sum numeric(16,2) NOT NULL,
    descr character varying(255)
);


ALTER TABLE public.income OWNER TO mazvv;

--
-- Name: income_cashflow; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE income_cashflow (
    income_id integer NOT NULL,
    cashflow_id integer NOT NULL
);


ALTER TABLE public.income_cashflow OWNER TO mazvv;

--
-- Name: income_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE income_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.income_id_seq OWNER TO mazvv;

--
-- Name: income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE income_id_seq OWNED BY income.id;


--
-- Name: invoice; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE invoice (
    id integer NOT NULL,
    date date NOT NULL,
    resource_id integer NOT NULL,
    account_id integer NOT NULL,
    active_until date NOT NULL,
    order_id integer NOT NULL,
    descr character varying(255)
);


ALTER TABLE public.invoice OWNER TO mazvv;

--
-- Name: invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_id_seq OWNER TO mazvv;

--
-- Name: invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE invoice_id_seq OWNED BY invoice.id;


--
-- Name: invoice_item; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE invoice_item (
    id integer NOT NULL,
    invoice_id integer NOT NULL,
    price numeric(16,2) NOT NULL,
    vat numeric(16,2) NOT NULL,
    discount numeric(16,2) NOT NULL,
    descr character varying(255),
    order_item_id integer NOT NULL
);


ALTER TABLE public.invoice_item OWNER TO mazvv;

--
-- Name: invoice_item_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE invoice_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_item_id_seq OWNER TO mazvv;

--
-- Name: invoice_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE invoice_item_id_seq OWNED BY invoice_item.id;


--
-- Name: lead; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE lead (
    id integer NOT NULL,
    lead_date date NOT NULL,
    resource_id integer NOT NULL,
    advsource_id integer NOT NULL,
    customer_id integer NOT NULL,
    status smallint NOT NULL,
    descr character varying(255)
);


ALTER TABLE public.lead OWNER TO mazvv;

--
-- Name: lead_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE lead_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lead_id_seq OWNER TO mazvv;

--
-- Name: lead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE lead_id_seq OWNED BY lead.id;


--
-- Name: lead_item; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE lead_item (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    lead_id integer,
    service_id integer NOT NULL,
    currency_id integer,
    price_from numeric(16,2),
    price_to numeric(16,2),
    descr character varying
);


ALTER TABLE public.lead_item OWNER TO mazvv;

--
-- Name: lead_item_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE lead_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lead_item_id_seq OWNER TO mazvv;

--
-- Name: lead_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE lead_item_id_seq OWNED BY lead_item.id;


--
-- Name: lead_offer; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE lead_offer (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    lead_id integer,
    service_id integer NOT NULL,
    currency_id integer NOT NULL,
    supplier_id integer NOT NULL,
    price numeric(16,2) NOT NULL,
    status smallint NOT NULL,
    descr character varying
);


ALTER TABLE public.lead_offer OWNER TO mazvv;

--
-- Name: lead_offer_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE lead_offer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lead_offer_id_seq OWNER TO mazvv;

--
-- Name: lead_offer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE lead_offer_id_seq OWNED BY lead_offer.id;


--
-- Name: licence_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE licence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.licence_id_seq OWNER TO mazvv;

--
-- Name: licence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE licence_id_seq OWNED BY contract.id;


--
-- Name: location; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE location (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.location OWNER TO mazvv;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO mazvv;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE location_id_seq OWNED BY location.id;


--
-- Name: navigation; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE navigation (
    id integer NOT NULL,
    position_id integer,
    parent_id integer,
    name character varying(32) NOT NULL,
    url character varying(128) NOT NULL,
    icon_cls character varying(32),
    sort_order integer NOT NULL,
    resource_id integer NOT NULL,
    separator_before boolean,
    action character varying(32)
);


ALTER TABLE public.navigation OWNER TO mazvv;

--
-- Name: note; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE note (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    title character varying(255) NOT NULL,
    descr character varying
);


ALTER TABLE public.note OWNER TO mazvv;

--
-- Name: note_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.note_id_seq OWNER TO mazvv;

--
-- Name: note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE note_id_seq OWNED BY note.id;


--
-- Name: note_resource; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE note_resource (
    note_id integer NOT NULL,
    resource_id integer NOT NULL
);


ALTER TABLE public.note_resource OWNER TO mazvv;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE notification (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    title character varying NOT NULL,
    descr character varying NOT NULL,
    created timestamp with time zone,
    url character varying
);


ALTER TABLE public.notification OWNER TO mazvv;

--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_id_seq OWNER TO mazvv;

--
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE notification_id_seq OWNED BY notification.id;


--
-- Name: notification_resource; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE notification_resource (
    notification_id integer NOT NULL,
    resource_id integer NOT NULL
);


ALTER TABLE public.notification_resource OWNER TO mazvv;

--
-- Name: order; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE "order" (
    id integer NOT NULL,
    deal_date date NOT NULL,
    resource_id integer NOT NULL,
    customer_id integer NOT NULL,
    advsource_id integer NOT NULL,
    descr character varying(255),
    lead_id integer,
    status smallint NOT NULL
);


ALTER TABLE public."order" OWNER TO mazvv;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO mazvv;

--
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- Name: order_item; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE order_item (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    order_id integer,
    service_id integer NOT NULL,
    currency_id integer NOT NULL,
    price numeric(16,2) NOT NULL,
    status smallint NOT NULL,
    status_date date,
    status_info character varying(128),
    supplier_id integer NOT NULL,
    discount_sum numeric(16,2) NOT NULL,
    discount_percent numeric(16,2) NOT NULL
);


ALTER TABLE public.order_item OWNER TO mazvv;

--
-- Name: order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_item_id_seq OWNER TO mazvv;

--
-- Name: order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE order_item_id_seq OWNED BY order_item.id;


--
-- Name: outgoing; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE outgoing (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    account_item_id integer NOT NULL,
    date date NOT NULL,
    subaccount_id integer NOT NULL,
    sum numeric(16,2) NOT NULL,
    descr character varying(255)
);


ALTER TABLE public.outgoing OWNER TO mazvv;

--
-- Name: outgoing_cashflow; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE outgoing_cashflow (
    outgoing_id integer NOT NULL,
    cashflow_id integer NOT NULL
);


ALTER TABLE public.outgoing_cashflow OWNER TO mazvv;

--
-- Name: outgoing_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE outgoing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.outgoing_id_seq OWNER TO mazvv;

--
-- Name: outgoing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE outgoing_id_seq OWNED BY outgoing.id;


--
-- Name: passport; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE passport (
    id integer NOT NULL,
    country_id integer NOT NULL,
    num character varying(32) NOT NULL,
    descr character varying(255),
    resource_id integer NOT NULL,
    end_date date,
    passport_type integer NOT NULL
);


ALTER TABLE public.passport OWNER TO mazvv;

--
-- Name: passport_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE passport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passport_id_seq OWNER TO mazvv;

--
-- Name: passport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE passport_id_seq OWNED BY passport.id;


--
-- Name: permision; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE permision (
    id integer NOT NULL,
    resource_type_id integer NOT NULL,
    position_id integer NOT NULL,
    permisions character varying[],
    structure_id integer,
    scope_type character varying(12)
);


ALTER TABLE public.permision OWNER TO mazvv;

--
-- Name: person; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE person (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32),
    second_name character varying(32),
    birthday date,
    subscriber boolean,
    gender integer
);


ALTER TABLE public.person OWNER TO mazvv;

--
-- Name: person_address; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE person_address (
    person_id integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.person_address OWNER TO mazvv;

--
-- Name: person_contact; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE person_contact (
    person_id integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE public.person_contact OWNER TO mazvv;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO mazvv;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- Name: person_order_item; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE person_order_item (
    order_item_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.person_order_item OWNER TO mazvv;

--
-- Name: person_passport; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE person_passport (
    person_id integer NOT NULL,
    passport_id integer NOT NULL
);


ALTER TABLE public.person_passport OWNER TO mazvv;

--
-- Name: person_subaccount; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE person_subaccount (
    person_id integer NOT NULL,
    subaccount_id integer NOT NULL
);


ALTER TABLE public.person_subaccount OWNER TO mazvv;

--
-- Name: positions_navigations_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE positions_navigations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_navigations_id_seq OWNER TO mazvv;

--
-- Name: positions_navigations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE positions_navigations_id_seq OWNED BY navigation.id;


--
-- Name: positions_permisions_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE positions_permisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_permisions_id_seq OWNER TO mazvv;

--
-- Name: positions_permisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE positions_permisions_id_seq OWNED BY permision.id;


--
-- Name: roomcat; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE roomcat (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.roomcat OWNER TO mazvv;

--
-- Name: roomcat_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE roomcat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roomcat_id_seq OWNER TO mazvv;

--
-- Name: roomcat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE roomcat_id_seq OWNED BY roomcat.id;


--
-- Name: service; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE service (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL,
    descr character varying(256),
    display_text character varying(256) NOT NULL,
    resource_type_id integer NOT NULL
);


ALTER TABLE public.service OWNER TO mazvv;

--
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_id_seq OWNER TO mazvv;

--
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE service_id_seq OWNED BY service.id;


--
-- Name: spassport; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE spassport (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    photo_done boolean NOT NULL,
    docs_receive_date date,
    docs_transfer_date date,
    passport_receive_date date,
    descr character varying(255)
);


ALTER TABLE public.spassport OWNER TO mazvv;

--
-- Name: spassport_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE spassport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spassport_id_seq OWNER TO mazvv;

--
-- Name: spassport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE spassport_id_seq OWNED BY spassport.id;


--
-- Name: spassport_order_item; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE spassport_order_item (
    order_item_id integer NOT NULL,
    spassport_id integer NOT NULL
);


ALTER TABLE public.spassport_order_item OWNER TO mazvv;

--
-- Name: structure; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE structure (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    parent_id integer,
    name character varying(32) NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.structure OWNER TO mazvv;

--
-- Name: structure_address; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE structure_address (
    structure_id integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.structure_address OWNER TO mazvv;

--
-- Name: structure_bank_detail; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE structure_bank_detail (
    structure_id integer NOT NULL,
    bank_detail_id integer NOT NULL
);


ALTER TABLE public.structure_bank_detail OWNER TO mazvv;

--
-- Name: structure_contact; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE structure_contact (
    structure_id integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE public.structure_contact OWNER TO mazvv;

--
-- Name: structures_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE structures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structures_id_seq OWNER TO mazvv;

--
-- Name: structures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE structures_id_seq OWNED BY structure.id;


--
-- Name: subaccount; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE subaccount (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    account_id integer NOT NULL,
    name character varying(255) NOT NULL,
    descr character varying(255),
    status smallint NOT NULL
);


ALTER TABLE public.subaccount OWNER TO mazvv;

--
-- Name: subaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE subaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subaccount_id_seq OWNER TO mazvv;

--
-- Name: subaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE subaccount_id_seq OWNED BY subaccount.id;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE supplier (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL,
    status smallint NOT NULL,
    descr character varying(255),
    supplier_type_id integer NOT NULL
);


ALTER TABLE public.supplier OWNER TO mazvv;

--
-- Name: supplier_bank_detail; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE supplier_bank_detail (
    supplier_id integer NOT NULL,
    bank_detail_id integer NOT NULL
);


ALTER TABLE public.supplier_bank_detail OWNER TO mazvv;

--
-- Name: supplier_bperson; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE supplier_bperson (
    supplier_id integer NOT NULL,
    bperson_id integer NOT NULL
);


ALTER TABLE public.supplier_bperson OWNER TO mazvv;

--
-- Name: supplier_contract; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE supplier_contract (
    supplier_id integer NOT NULL,
    contract_id integer NOT NULL
);


ALTER TABLE public.supplier_contract OWNER TO mazvv;

--
-- Name: supplier_subaccount; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE supplier_subaccount (
    supplier_id integer NOT NULL,
    subaccount_id integer NOT NULL
);


ALTER TABLE public.supplier_subaccount OWNER TO mazvv;

--
-- Name: supplier_type; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE supplier_type (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(32) NOT NULL,
    descr character varying(255)
);


ALTER TABLE public.supplier_type OWNER TO mazvv;

--
-- Name: supplier_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE supplier_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_type_id_seq OWNER TO mazvv;

--
-- Name: supplier_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE supplier_type_id_seq OWNED BY supplier_type.id;


--
-- Name: task; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE task (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    employee_id integer NOT NULL,
    title character varying(128) NOT NULL,
    deadline timestamp with time zone NOT NULL,
    descr character varying,
    status smallint NOT NULL,
    reminder integer
);


ALTER TABLE public.task OWNER TO mazvv;

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO mazvv;

--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE task_id_seq OWNED BY task.id;


--
-- Name: task_resource; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE task_resource (
    task_id integer NOT NULL,
    resource_id integer NOT NULL
);


ALTER TABLE public.task_resource OWNER TO mazvv;

--
-- Name: ticket; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE ticket (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    start_location_id integer NOT NULL,
    end_location_id integer NOT NULL,
    ticket_class_id integer NOT NULL,
    transport_id integer NOT NULL,
    start_dt timestamp with time zone NOT NULL,
    start_additional_info character varying(128),
    end_dt timestamp with time zone NOT NULL,
    end_additional_info character varying(128),
    adults integer NOT NULL,
    children integer NOT NULL,
    descr character varying(255)
);


ALTER TABLE public.ticket OWNER TO mazvv;

--
-- Name: ticket_class; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE ticket_class (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.ticket_class OWNER TO mazvv;

--
-- Name: ticket_class_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE ticket_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ticket_class_id_seq OWNER TO mazvv;

--
-- Name: ticket_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE ticket_class_id_seq OWNED BY ticket_class.id;


--
-- Name: ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ticket_id_seq OWNER TO mazvv;

--
-- Name: ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE ticket_id_seq OWNED BY ticket.id;


--
-- Name: ticket_order_item; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE ticket_order_item (
    order_item_id integer NOT NULL,
    ticket_id integer NOT NULL
);


ALTER TABLE public.ticket_order_item OWNER TO mazvv;

--
-- Name: tour; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE tour (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    start_location_id integer NOT NULL,
    end_location_id integer NOT NULL,
    hotel_id integer,
    accomodation_id integer,
    foodcat_id integer,
    roomcat_id integer,
    adults integer NOT NULL,
    children integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    descr character varying(255),
    end_transport_id integer NOT NULL,
    start_transport_id integer NOT NULL,
    transfer_id integer,
    end_additional_info character varying(128),
    start_additional_info character varying(128)
);


ALTER TABLE public.tour OWNER TO mazvv;

--
-- Name: tour_id_seq1; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE tour_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tour_id_seq1 OWNER TO mazvv;

--
-- Name: tour_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE tour_id_seq1 OWNED BY tour.id;


--
-- Name: tour_order_item; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE tour_order_item (
    order_item_id integer NOT NULL,
    tour_id integer NOT NULL
);


ALTER TABLE public.tour_order_item OWNER TO mazvv;

--
-- Name: touroperator_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE touroperator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.touroperator_id_seq OWNER TO mazvv;

--
-- Name: touroperator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE touroperator_id_seq OWNED BY supplier.id;


--
-- Name: transfer; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE transfer (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.transfer OWNER TO mazvv;

--
-- Name: transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE transfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transfer_id_seq OWNER TO mazvv;

--
-- Name: transfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE transfer_id_seq OWNED BY cashflow.id;


--
-- Name: transfer_id_seq1; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE transfer_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transfer_id_seq1 OWNER TO mazvv;

--
-- Name: transfer_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE transfer_id_seq1 OWNED BY transfer.id;


--
-- Name: transport; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE transport (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.transport OWNER TO mazvv;

--
-- Name: transport_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE transport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transport_id_seq OWNER TO mazvv;

--
-- Name: transport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE transport_id_seq OWNED BY transport.id;


--
-- Name: visa; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE visa (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    country_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    type smallint NOT NULL,
    descr character varying(255)
);


ALTER TABLE public.visa OWNER TO mazvv;

--
-- Name: visa_id_seq; Type: SEQUENCE; Schema: public; Owner: mazvv
--

CREATE SEQUENCE visa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visa_id_seq OWNER TO mazvv;

--
-- Name: visa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mazvv
--

ALTER SEQUENCE visa_id_seq OWNED BY visa.id;


--
-- Name: visa_order_item; Type: TABLE; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE TABLE visa_order_item (
    order_item_id integer NOT NULL,
    visa_id integer NOT NULL
);


ALTER TABLE public.visa_order_item OWNER TO mazvv;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY accomodation ALTER COLUMN id SET DEFAULT nextval('accomodation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY account_item ALTER COLUMN id SET DEFAULT nextval('account_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY advsource ALTER COLUMN id SET DEFAULT nextval('advsource_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY appointment ALTER COLUMN id SET DEFAULT nextval('employees_appointments_h_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bank ALTER COLUMN id SET DEFAULT nextval('bank_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bank_detail ALTER COLUMN id SET DEFAULT nextval('bank_detail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bperson ALTER COLUMN id SET DEFAULT nextval('bperson_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY calculation ALTER COLUMN id SET DEFAULT nextval('calculation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY cashflow ALTER COLUMN id SET DEFAULT nextval('transfer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY commission ALTER COLUMN id SET DEFAULT nextval('commission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY company ALTER COLUMN id SET DEFAULT nextval('company_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY contract ALTER COLUMN id SET DEFAULT nextval('licence_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY country ALTER COLUMN id SET DEFAULT nextval('country_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY crosspayment ALTER COLUMN id SET DEFAULT nextval('crosspayment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY currency ALTER COLUMN id SET DEFAULT nextval('_currencies_rid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY currency_rate ALTER COLUMN id SET DEFAULT nextval('currency_rate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY email_campaign ALTER COLUMN id SET DEFAULT nextval('email_campaign_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee ALTER COLUMN id SET DEFAULT nextval('_employees_rid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY foodcat ALTER COLUMN id SET DEFAULT nextval('foodcat_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY hotel ALTER COLUMN id SET DEFAULT nextval('hotel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY hotelcat ALTER COLUMN id SET DEFAULT nextval('hotelcat_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY income ALTER COLUMN id SET DEFAULT nextval('income_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY invoice ALTER COLUMN id SET DEFAULT nextval('invoice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY invoice_item ALTER COLUMN id SET DEFAULT nextval('invoice_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead ALTER COLUMN id SET DEFAULT nextval('lead_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_item ALTER COLUMN id SET DEFAULT nextval('lead_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_offer ALTER COLUMN id SET DEFAULT nextval('lead_offer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY location ALTER COLUMN id SET DEFAULT nextval('location_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY navigation ALTER COLUMN id SET DEFAULT nextval('positions_navigations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY note ALTER COLUMN id SET DEFAULT nextval('note_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY notification ALTER COLUMN id SET DEFAULT nextval('notification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY order_item ALTER COLUMN id SET DEFAULT nextval('order_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY outgoing ALTER COLUMN id SET DEFAULT nextval('outgoing_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY passport ALTER COLUMN id SET DEFAULT nextval('passport_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY permision ALTER COLUMN id SET DEFAULT nextval('positions_permisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "position" ALTER COLUMN id SET DEFAULT nextval('companies_positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY region ALTER COLUMN id SET DEFAULT nextval('_regions_rid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY resource ALTER COLUMN id SET DEFAULT nextval('_resources_rid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY resource_log ALTER COLUMN id SET DEFAULT nextval('_resources_logs_rid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY resource_type ALTER COLUMN id SET DEFAULT nextval('_resources_types_rid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY roomcat ALTER COLUMN id SET DEFAULT nextval('roomcat_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY service ALTER COLUMN id SET DEFAULT nextval('service_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY spassport ALTER COLUMN id SET DEFAULT nextval('spassport_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY structure ALTER COLUMN id SET DEFAULT nextval('structures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY subaccount ALTER COLUMN id SET DEFAULT nextval('subaccount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier ALTER COLUMN id SET DEFAULT nextval('touroperator_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier_type ALTER COLUMN id SET DEFAULT nextval('supplier_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY task ALTER COLUMN id SET DEFAULT nextval('task_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY ticket ALTER COLUMN id SET DEFAULT nextval('ticket_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY ticket_class ALTER COLUMN id SET DEFAULT nextval('ticket_class_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour ALTER COLUMN id SET DEFAULT nextval('tour_id_seq1'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY transfer ALTER COLUMN id SET DEFAULT nextval('transfer_id_seq1'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY transport ALTER COLUMN id SET DEFAULT nextval('transport_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('_users_rid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY visa ALTER COLUMN id SET DEFAULT nextval('visa_id_seq'::regclass);


--
-- Name: _currencies_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('_currencies_rid_seq', 57, true);


--
-- Name: _employees_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('_employees_rid_seq', 30, true);


--
-- Name: _regions_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('_regions_rid_seq', 38, true);


--
-- Name: _resources_logs_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('_resources_logs_rid_seq', 7204, true);


--
-- Name: _resources_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('_resources_rid_seq', 2467, true);


--
-- Name: _resources_types_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('_resources_types_rid_seq', 147, true);


--
-- Name: _users_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('_users_rid_seq', 31, true);


--
-- Data for Name: accomodation; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY accomodation (id, resource_id, name) FROM stdin;
1	957	MB
2	958	HV
3	959	BGL
4	960	BG
5	961	Chale
6	962	Cabana
7	963	Cottage
8	964	Executive floor
9	965	SGL
10	966	DBL
11	967	TRPL
12	968	QDPL
13	969	ExB
14	970	Chld
15	971	ВО
\.


--
-- Name: accomodation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('accomodation_id_seq', 17, true);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY account (id, resource_id, currency_id, account_type, name, display_text, descr, status) FROM stdin;
2	1438	56	0	Main Bank Account	some display text	\N	0
3	1439	56	1	Main Cash Account	cash payment	\N	0
4	1507	54	1	Main Cash EUR Account	Main Cash EUR Account	\N	0
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('account_id_seq', 4, true);


--
-- Data for Name: account_item; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY account_item (id, resource_id, name, parent_id, type, status, descr) FROM stdin;
3	1432	Taxes	\N	0	0	\N
4	1608	Operating charges	\N	0	0	\N
5	1609	Internal cash flow	\N	0	0	\N
6	1769	Profit distribution	\N	0	0	\N
7	1780	Rent	2	0	0	\N
8	1873	POF	2	0	0	\N
9	1898	Communication	2	0	0	\N
10	2199	Marketing, Sales	2	0	0	\N
11	2246	Software	2	0	0	Sales of any type of tickets
13	2277	Other operating	2	0	0	\N
1	1426	Income Tax	3	0	0	\N
14	2389	VAT	3	0	0	\N
15	2390	Other taxes, fees	3	0	0	\N
17	2392	Return to the buyer	4	0	0	\N
18	2393	Payment of the tour operator	4	0	0	\N
19	2394	Return the tour operator	4	0	0	\N
20	2395	Other operating income	4	0	0	\N
21	2396	Other operating expenses	4	0	0	\N
22	2397	The money from bank to bank	5	0	0	\N
23	2398	The money from the cash to the account	5	0	0	\N
24	2399	Money from the account in cash	5	0	0	\N
25	2400	Conversion	5	0	0	\N
26	2401	Acquisition of fixed assets	6	0	0	\N
27	2402	The withdrawal of capital	6	0	0	\N
28	2403	Rental fee	7	0	0	\N
29	2404	Utility payments	7	0	0	\N
30	2405	POF payable	8	0	0	\N
31	2406	PIT	8	0	0	\N
32	2407	ERUs	8	0	0	\N
33	2408	Bonuses (bonus)	8	0	0	\N
34	2409	Telephone landline	9	0	0	\N
35	2410	Mobile Phones	9	0	0	\N
36	2411	Internet	9	0	0	\N
37	2412	Other	9	0	0	\N
38	2413	Outdoor advertising	10	0	0	\N
39	2414	Advertising in print media	10	0	0	\N
40	2415	Advertising on TV, radio	10	0	0	\N
41	2416	Promotions and presentations	10	0	0	\N
42	2417	Exhibitions	10	0	0	\N
43	2418	Advertising on the Internet	10	0	0	\N
44	2419	 Website Promotion	10	0	0	\N
45	2420	Mailing lists	10	0	0	\N
46	2421	Other marketing	10	0	0	\N
47	2422	The costs for the modernization of the local software	11	0	0	\N
48	2423	The cost of upgrading the website	11	0	0	\N
49	2424	Bank charges	12	0	0	\N
50	2425	Other cash and settlement services	12	0	0	\N
51	2426	Office supplies, office software	13	0	0	\N
52	2427	Representation	13	0	0	\N
53	2428	Staff Missions	13	0	0	\N
54	2429	Postage, courier services	13	0	0	\N
55	2430	Minor repairs of machinery	13	0	0	\N
56	2431	Purchase low-value goods	13	0	0	\N
57	2432	Other (not included in any of the articles)	13	0	0	\N
2	1431	Administrative expensive	\N	2	0	Group of items
12	2269	Cash and Settlement Services	2	2	0	\N
16	2391	Payment by the buyer	4	1	0	\N
\.


--
-- Name: account_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('account_item_id_seq', 57, true);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY address (id, resource_id, location_id, zip_code, address) FROM stdin;
10	1288	14	02312	Bogdana Hmelnickogo Str
13	1308	5	12354	asdf asdf asdfsadf
14	1309	14	12345	dsfg sdfg sdfg sdfgsdfgdsf
15	1370	14	11111	Polyarnaya str., 18 A, 181
16	1374	14	11111	Polyarnaya str. 18 A, 181
17	1382	14	11111	Chavdar Elisabet, 13
18	1388	14	11111	Chavdar Elisabet, 13
19	1391	14	1111	Chavdar Elisabeth, 13
20	1407	14	11111	Radujnaya str., 56 a, 153
21	1414	14	01011	Leskova str., 9
22	1418	33	12345	Naberegnaya Pobedy, 50
23	1469	34	09909	Lavrska, str 34
24	1585	14	08967	Solomii Krushelnickoi, 34/3, ap. 45
25	1614	14	678565	Pobedy, 56/2, ap.67
26	1623	14	8934	Artema 8d, 47
27	1644	34	67234	Sichovih Strilciv, 2.
28	1652	14	54415	Vasilkovskaya 45/56, 19
29	1807	14	02121	Dekabristov str, filial #239
30	1926	14	123432	Arsenalna str
31	1951	14	02121	Gmiry str
32	2015	14	09878	Kikvidze 29, 56
33	2119	14	02121	Bazhana str.3
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('address_id_seq', 33, true);


--
-- Data for Name: advsource; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY advsource (id, resource_id, name) FROM stdin;
2	904	Google.com
3	905	Yahoo.com
4	906	Recommendation
5	907	Second appeal
1	903	Internet Search Engines
6	1283	Undefined
\.


--
-- Name: advsource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('advsource_id_seq', 6, true);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY alembic_version (version_num) FROM stdin;
250bc21d98ef
\.


--
-- Data for Name: appointment; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY appointment (id, resource_id, currency_id, employee_id, position_id, salary, date) FROM stdin;
1	789	54	2	4	1000.00	2014-02-02
6	892	54	7	5	4500.00	2014-02-22
8	1542	54	2	4	6500.00	2014-03-01
\.


--
-- Data for Name: apscheduler_jobs; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY apscheduler_jobs (id, next_run_time, job_state) FROM stdin;
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY bank (id, resource_id, name) FROM stdin;
1	1214	Bank of America
4	1415	Raiffaisen Bank Aval
5	1419	PrivatBank
\.


--
-- Data for Name: bank_address; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY bank_address (bank_id, address_id) FROM stdin;
5	29
5	33
\.


--
-- Data for Name: bank_detail; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY bank_detail (id, resource_id, currency_id, bank_id, beneficiary, account, swift_code) FROM stdin;
5	1420	56	4	LuxTravel, Inc	123456789	123456
6	1510	54	1	Coral Travel	12345	1234
7	1511	57	1	Coral LLC	98765	0987
8	1512	57	1	Coral LLc	0987654	12234
9	1513	56	5	Coral Travel Ukraine	567990	54343
10	1514	44	5	Coral LLc	123232321312	`12
11	1515	54	4	Coral LLC	1223456	55667
12	1554	56	5	Intertelecom	12345678	09876
13	1556	56	5	Intertelecom	12345678	09876
14	1564	56	4	Lun Real Estate	78900909	12343434
15	1569	56	5	Lun Real Estate Agency	987456152	671283
16	1570	56	4	Intertelecom Internet Service Provider	9878723847	84758GH
18	2120	57	4	sdghsdgh	sghsgh	dfghdfhgdfh
\.


--
-- Name: bank_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('bank_detail_id_seq', 18, true);


--
-- Name: bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('bank_id_seq', 6, true);


--
-- Data for Name: bperson; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY bperson (id, resource_id, first_name, last_name, second_name, position_name, descr, status) FROM stdin;
1	1009	Alexandro	Riak		Sales Manager	\N	0
2	1010	Umberto			Accounting	\N	0
6	1560	Ivan	Gonchar		Account Manager	\N	0
5	1553	Sergey	Vlasov		Main account manager	\N	0
7	1563	Alexander	Tkachuk		manager		0
8	1578	Anna			Manager		0
\.


--
-- Data for Name: bperson_contact; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY bperson_contact (bperson_id, contact_id) FROM stdin;
1	54
1	55
1	56
1	57
5	61
5	62
6	63
7	64
7	65
8	66
\.


--
-- Name: bperson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('bperson_id_seq', 8, true);


--
-- Data for Name: calculation; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY calculation (id, resource_id, currency_id, price, base_price, order_item_id) FROM stdin;
\.


--
-- Name: calculation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('calculation_id_seq', 32, true);


--
-- Data for Name: cashflow; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY cashflow (id, subaccount_from_id, subaccount_to_id, account_item_id, sum, date, vat) FROM stdin;
186	\N	22	16	1400.73	2015-06-13	\N
187	22	18	16	1400.73	2015-06-13	0.00
188	\N	21	16	35500.00	2015-06-14	\N
189	21	19	16	35500.00	2015-06-14	10292.13
190	\N	21	16	5000.00	2015-06-14	\N
191	21	19	16	5000.00	2015-06-14	10292.13
192	\N	22	16	380.00	2015-06-14	\N
193	22	18	16	272.00	2015-06-14	0.00
215	22	\N	17	108.00	2015-06-14	\N
216	19	\N	27	500.00	2015-06-14	\N
217	19	23	18	15000.00	2015-06-14	\N
218	23	\N	18	15000.00	2015-06-14	\N
\.


--
-- Data for Name: commission; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY commission (id, resource_id, service_id, percentage, price, currency_id, descr) FROM stdin;
\.


--
-- Name: commission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('commission_id_seq', 35, true);


--
-- Name: companies_positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('companies_positions_id_seq', 8, true);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY company (id, resource_id, name, currency_id, settings, email) FROM stdin;
1	1970	LuxTravel, Inc	56	{"locale": "en", "timezone": "Europe/Kiev", "tax": "20"}	lux.travel@gmai.com
\.


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('company_id_seq', 1, true);


--
-- Data for Name: company_subaccount; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY company_subaccount (company_id, subaccount_id) FROM stdin;
1	18
1	19
1	20
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY contact (id, contact, resource_id, contact_type, descr, status) FROM stdin;
27	+380681983869	1193	0	\N	0
29	+380681983869	1195	0	\N	0
30	+380681983869	1201	0	\N	0
32	+380681983869	1204	0	\N	0
36	+380681983869	1244	0	\N	0
37	+380681983869	1257	0	\N	0
39	+380681983869	1259	0	\N	0
41	+380682523645	1263	0	\N	0
44	+380675625353	1282	0	\N	0
45	+380502355565	1285	0	\N	0
47	+380673566789	1371	0	\N	0
48	+380502314567	1373	0	\N	0
51	+380502232233	1387	0	\N	0
52	+380502354235	1404	0	\N	0
53	+380503435512	1464	0	\N	0
54	+380976543565	1516	0	\N	0
55	+380675643623	1517	0	\N	0
58	+380681983800	1543	0	\N	0
61	+380681234567	1551	0	\N	0
64	+380953434358	1561	0	\N	0
67	+380672568976	1581	0	\N	0
68	+380672346534	1591	0	\N	0
69	+380500567765	1610	0	\N	0
71	+380503435436	1620	0	\N	0
73	+380975642876	1624	0	\N	0
74	+380665638900	1640	0	\N	0
76	+380502235686	1650	0	\N	0
77	+380674523123	1927	0	\N	0
79	+380923435643	2013	0	\N	0
80	+380505674534	2018	0	\N	0
81	+380671238943	2050	0	\N	0
28	asdasd@mail.com	1194	1	\N	0
35	vitalii.mazur@gmail.com	1243	1	\N	0
38	vitalii.mazur@gmail.com	1258	1	\N	0
40	vitalii.mazur@gmail.com	1260	1	\N	0
42	a.koff@gmail.com	1264	1	\N	0
46	n.voevoda@gmail.com	1304	1	\N	0
57	ravak@myemail.com	1519	1	\N	0
60	info@travelcrm.org.ua	1545	1	\N	0
63	i_gonchar@i-tele.com	1559	1	\N	0
65	mega_tkach@ukr.net	1562	1	\N	0
70	artyuh87@gmail.com	1611	1	\N	0
72	grach18@ukr.net	1621	1	\N	0
75	karpuha1990@ukr.net	1641	1	\N	0
78	vitalii.mazur@gmail.com	1956	1	\N	0
49	travelcrm	1379	2	\N	0
56	ravak_skype	1518	2	\N	0
59	dorianyats	1544	2	\N	0
62	serge_vlasov	1552	2	\N	0
50	+380682345688	1380	0	\N	0
82	+380676775643	2089	0	\N	0
83	nikolay1987@mail.ru	2095	1	\N	0
66	AnnaNews	1577	2		1
84	+380672334345	2307	0		0
85	+380503435676	2308	0		1
86	+380674252212	2327	0		0
87	+380678521452	2338	0		0
88	+380502356543	2366	0		0
\.


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('contact_id_seq', 88, true);


--
-- Data for Name: contract; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY contract (id, resource_id, date, num, descr, status) FROM stdin;
48	2210	2015-05-09	1234/56	Test contract	0
49	2213	2015-05-09	12345/67	Test agent contract for supplier	0
50	2215	2014-01-10	12/34	First contract	1
\.


--
-- Data for Name: contract_commission; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY contract_commission (contract_id, commission_id) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY country (id, resource_id, iso_code, name) FROM stdin;
3	878	UA	Ukraine
4	880	EG	Egypt
5	881	TR	Turkey
6	882	GB	United Kingdom
7	883	US	United States
8	884	TH	Thailand
9	1095	RU	Russian Federation
12	1164	HR	Croatia
13	1169	AE	United Arab Emirates
14	1178	ES	Spain
16	1339	CY	Cyprus
17	1343	IT	Italy
11	1100	DE	Germany
18	1351	GR	Greece
19	1646	FR	France
21	2270	PL	Poland
\.


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('country_id_seq', 21, true);


--
-- Data for Name: crosspayment; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY crosspayment (id, resource_id, cashflow_id, descr) FROM stdin;
10	2465	216	The capital withdraw by CEO
\.


--
-- Name: crosspayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('crosspayment_id_seq', 10, true);


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY currency (id, resource_id, iso_code) FROM stdin;
44	849	RUB
50	1060	KZT
52	1168	BYR
54	1240	EUR
56	1310	UAH
57	1311	USD
\.


--
-- Data for Name: currency_rate; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY currency_rate (id, resource_id, date, currency_id, rate, supplier_id) FROM stdin;
19	2281	2015-05-15	57	23.00	87
20	2289	2015-05-17	57	22.70	102
21	2290	2015-04-29	57	23.05	102
22	2319	2015-06-01	54	24.20	87
23	2334	2015-06-02	57	21.50	93
24	2335	2015-06-02	54	23.65	93
25	2336	2015-06-02	57	21.66	100
26	2337	2015-06-02	54	23.70	100
27	2383	2015-06-06	54	24.30	102
28	2384	2015-06-06	54	24.25	92
29	2385	2015-06-06	57	21.50	92
\.


--
-- Name: currency_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('currency_rate_id_seq', 29, true);


--
-- Data for Name: email_campaign; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY email_campaign (id, resource_id, name, plain_content, html_content, start_dt, subject) FROM stdin;
1	1955	Egypt HOT!!!	Hello.<p>Look at this</p>	      <meta content="text/html; charset=utf-8" http-equiv="Content-Type">    <title>      Boutique    </title><style type="text/css">a:hover { text-decoration: none !important; }.header h1 {color: #ede6cb !important; font: normal 24px Georgia, serif; margin: 0; padding: 0; line-height: 28px;}.header p {color: #645847; font: bold 11px Georgia, serif; margin: 0; padding: 0; line-height: 12px; text-transform: uppercase;}.content h2 {color:#393023 !important; font-weight: bold; margin: 0; padding: 0; line-height: 30px; font-size: 17px;font-family: Helvetica, Arial, sans-serif; }.content p {color:#767676; font-weight: normal; margin: 0; padding: 0; line-height: 20px; font-size: 12px; font-family: Helvetica, Arial, sans-serif;}.content a {color: #0fa2e6; text-decoration: none;}.footer p {font-size: 11px; color:#bfbfbf; margin: 0; padding: 0;font-family: Helvetica, Arial, sans-serif;}.footer a {color: #0fa2e6; text-decoration: none;}</style>      <table cellpadding="0" cellspacing="0" border="0" align="center" width="100%" style="background: url('images/bg_email.jpg') no-repeat center top; padding: 85px 0 35px">  <tbody><tr>  <td align="center">    <table cellpadding="0" cellspacing="0" border="0" align="center" width="599" style="font-family: Georgia, serif; background: url('images/bg_header.jpg') no-repeat center top" height="142">      <tbody><tr>        <td style="margin: 0; padding: 40px 0 0; background: #c89c22 url('images/bg_header.jpg') no-repeat center top" align="center" valign="top"><h1 style="color: #ede6cb !important; font: normal 24px Georgia, serif; margin: 0; padding: 0; line-height: 28px;">Grandma's Sweets &amp; Cookies</h1>    </td>      </tr>  <tr>        <td style="margin: 0; padding: 25px 0 0;" align="center" valign="top"><p style="color: #645847; font: bold 11px Georgia, serif; margin: 0; padding: 0; line-height: 12px; text-transform: uppercase;">ESTABLISHED 1405</p>        </td>      </tr>  <tr>  <td style="font-size: 1px; height: 15px; line-height: 1px;" height="15">&nbsp;</td>  </tr></tbody></table><!-- header--><table cellpadding="0" cellspacing="0" border="0" align="center" width="599" style="font-family: Georgia, serif;">      <tbody><tr>        <td width="599" valign="top" align="left" bgcolor="#ffffff" style="font-family: Georgia, serif; background: #fff; border-top: 5px solid #e5bd5f"><table cellpadding="0" cellspacing="0" border="0" style="color: #717171; font: normal 11px Georgia, serif; margin: 0; padding: 0;" width="599"><tbody><tr><td width="15" style="font-size: 1px; line-height: 1px; width: 15px;"><img src="images/spacer.gif" alt="space" width="15"></td><td style="padding: 15px 0 5px; font-family: Georgia, serif;" valign="top" align="center" width="569"><img src="images/divider_top_full.png" alt="divider"><br></td><td width="15" style="font-size: 1px; line-height: 1px; width: 15px;"><img src="images/spacer.gif" alt="space" width="15"></td></tr><tr><td width="15" style="font-size: 1px; line-height: 1px; width: 15px;"><img src="images/spacer.gif" alt="space" width="15"></td><td style="padding: 10px 0 0; font-family: Helvetica, Arial, sans-serif;" align="left"><h2 style="color:#393023 !important; font-weight: bold; margin: 0; padding: 0; line-height: 30px; font-size: 17px;font-family: Helvetica, Arial, sans-serif;">Meet Jack — a brown cow.</h2><p style="color:#767676; font-weight: normal; margin: 0; padding: 0; line-height: 20px; font-size: 12px;">Suspendisse potenti--Fusce eu ante in sapien vestibulum sagittis. Cras purus. Nunc rhoncus. <a href="#" style="color: #0fa2e6; text-decoration: none;">Donec imperdiet</a>, nibh sit amet pharetra placerat, tortor purus condimentum lectus.</p></td><td width="15" style="font-size: 1px; line-height: 1px; width: 15px;"><img src="images/spacer.gif" alt="space" width="15"></td></tr><tr><td width="15" style="font-size: 1px; line-height: 1px; width: 15px;"><img src="images/spacer.gif" alt="space" width="15"></td><td style="padding: 10px 0 0; font-family: Helvetica, Arial, sans-serif;" align="left"><img src="images/img.jpg" alt="Cow" style="border: 5px solid #f7f7f4;"></td></tr><tr><td width="15" style="font-size: 1px; line-height: 1px; width: 15px;"><img src="images/spacer.gif" alt="space" width="15"></td><td style="padding: 10px 0 0; font-family: Helvetica, Arial, sans-serif;" align="left"><p style="color:#767676; font-weight: normal; margin: 0; padding: 0; line-height: 20px; font-size: 12px;">Suspendisse potenti--Fusce eu <a href="#" style="color: #0fa2e6; text-decoration: none;">ante in sapien</a> vestibulum sagittis.</p></td></tr><tr><td width="15" style="font-size: 1px; line-height: 1px; width: 15px;"><img src="images/spacer.gif" alt="space" width="15"></td><td style="padding: 10px 0 0; font-family: Helvetica, Arial, sans-serif;" align="left"><img src="images/divider_full.png" alt="divider"></td><td width="15" style="font-size: 1px; line-height: 1px; width: 15px;"><img src="images/spacer.gif" alt="space" width="15"></td></tr><tr><td width="15" style="font-size: 1px; line-height: 1px; width: 15px;"><img src="images/spacer.gif" alt="space" width="15"></td><td style="padding: 10px 0 55px; font-family: Helvetica, Arial, sans-serif;" align="left"><h2 style="color:#393023 !important; font-weight: bold; margin: 0; padding: 0; line-height: 30px; font-size: 17px;font-family: Helvetica, Arial, sans-serif;">Cookies feels more valuable now than before</h2><p style="color:#767676; font-weight: normal; margin: 0; padding: 0; line-height: 20px; font-size: 12px;">Suspendisse potenti--Fusce eu ante in sapien vestibulum sagittis. Cras purus. Nunc rhoncus. Donec imperdiet, nibh sit amet pharetra placerat, tortor purus condimentum lectus. Says Doctor Lichtenstein in an interview done after last nights press conference in Belgium.<a href="#" style="color: #0fa2e6; text-decoration: none;">Dr. Lichtenstein</a> also states his concerns regarding chocolate now suddenly turning yellow the last couple of years. </p></td></tr>  </tbody></table></td>      </tr> <tr>  <td style="font-size: 1px; height: 10px; line-height: 1px;" height="10"><img src="images/spacer.gif" alt="space" width="15"></td>  </tr></tbody></table><!-- body --><table cellpadding="0" cellspacing="0" border="0" align="center" width="599" style="font-family: Georgia, serif; line-height: 10px;" bgcolor="#464646" class="footer">      <tbody><tr>        <td bgcolor="#464646" align="center" style="padding: 15px 0 10px; font-size: 11px; color:#bfbfbf; margin: 0; line-height: 1.2;font-family: Helvetica, Arial, sans-serif;" valign="top"><p style="font-size: 11px; color:#bfbfbf; margin: 0; padding: 0;font-family: Helvetica, Arial, sans-serif;">You're receiving this newsletter because you bought widgets from us. </p><p style="font-size: 11px; color:#bfbfbf; margin: 0 0 10px 0; padding: 0;font-family: Helvetica, Arial, sans-serif;">Having trouble reading this? <webversion style="color: #0fa2e6; text-decoration: none;">View it in your browser</webversion>. Not interested anymore? <unsubscribe style="color: #0fa2e6; text-decoration: none;">Unsubscribe</unsubscribe> Instantly.</p></td>      </tr>  </tbody></table><!-- footer-->  </td></tr>    </tbody></table>  	2014-12-28 19:18:00+02	Hot New Year in Egypt
\.


--
-- Name: email_campaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('email_campaign_id_seq', 1, true);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY employee (id, resource_id, first_name, last_name, second_name, itn, dismissal_date, photo) FROM stdin;
4	786	Oleg	Pogorelov		\N	\N	\N
8	893	Oleg	Mazur	V.	\N	\N	\N
9	1040	Halyna	Sereda		\N	\N	\N
10	1041	Andrey	Shabanov		\N	\N	\N
11	1042	Dymitrii	Veremeychuk		\N	\N	\N
13	1044	Alexandra	Koff	\N	\N	\N	\N
12	1043	Denis	Yurin	\N	\N	2014-04-01	\N
14	1045	Dima	Shkreba	\N	\N	2013-04-30	\N
7	885	Irina	Mazur	V.	\N	\N	employee/f8ce7007-df56-471c-a330-c43b678ed2ae.jpg
2	784	John	Doe	\N	\N	\N	employee/e588d949-e13f-43cc-aa0f-115354289850.jpg
15	1046	Viktoriia	Lastovets	\N	\N	2014-04-29	\N
30	2053	Igor	Mazur	\N	\N	\N	employee/5a83ffee-5bd2-4ba8-a82a-cea9a88c4d82.jpg
\.


--
-- Data for Name: employee_address; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY employee_address (employee_id, address_id) FROM stdin;
\.


--
-- Data for Name: employee_contact; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY employee_contact (employee_id, contact_id) FROM stdin;
13	42
13	41
2	60
2	58
2	59
\.


--
-- Data for Name: employee_notification; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY employee_notification (employee_id, notification_id, status) FROM stdin;
2	18	1
2	20	1
2	19	1
2	21	0
2	22	0
2	23	0
2	24	0
\.


--
-- Data for Name: employee_passport; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY employee_passport (employee_id, passport_id) FROM stdin;
13	7
\.


--
-- Data for Name: employee_subaccount; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY employee_subaccount (employee_id, subaccount_id) FROM stdin;
2	1
\.


--
-- Name: employees_appointments_h_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('employees_appointments_h_id_seq', 9, true);


--
-- Data for Name: foodcat; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY foodcat (id, resource_id, name) FROM stdin;
1	973	ОВ
3	975	BB
4	976	HB
5	977	HB+
6	978	FB
7	979	FB+
8	980	EXTFB
9	981	Mini all inclusive
10	982	ALL
11	983	Continental Breakfast
12	984	English breakfast
13	985	American breakfast
15	987	UAL
16	988	UAI
\.


--
-- Name: foodcat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('foodcat_id_seq', 17, true);


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY hotel (id, resource_id, hotelcat_id, name, location_id) FROM stdin;
10	1292	5	Hotel View Novi Vindolski	16
11	1320	5	PGS Kiris Resort	17
12	1322	5	Justiniano Club Park Conti	18
13	1323	5	PGS World Palace	17
14	1324	5	Concordia Celes Hotel	18
15	1325	5	Akka Alinda Hotel	17
16	1327	5	Grand Haber Hotel	19
17	1330	5	Belconti Resort	20
18	1331	3	Asdem Park	19
19	1334	4	Saphir	21
20	1335	4	Justiniano Club Alanya	18
21	1338	6	Euphoria Palm Beach	22
22	1342	4	Avlida	23
23	1346	3	Calypso	24
24	1349	4	Citta Del Mare	25
25	1350	4	Villa Adriatica	24
26	1354	4	Aldemar Cretan Village	26
27	1357	4	Estival Park Salou Hotel	27
28	1358	3	Playa Park	27
29	1360	4	Best Negresco	28
30	1362	4	Oasis Park & SPA	29
31	1364	5	The Desert Rose Resort	30
32	1367	4	Rehana Sharm Resort	31
33	1386	4	Fantasia	32
34	1470	5	Villa Augusto	21
35	1590	5	Lindos Blue	36
36	1649	5	Sezz Saint-Tropez	37
38	2111	5	Spirit of the Knights Boutique	36
39	2375	5	Radisson Blu Resort & Spa	39
\.


--
-- Name: hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('hotel_id_seq', 39, true);


--
-- Data for Name: hotelcat; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY hotelcat (id, resource_id, name) FROM stdin;
1	912	1*
2	913	2*
3	914	3*
4	915	4*
5	916	5*
6	917	HV-1
7	918	HV-2
8	919	De Luxe
\.


--
-- Name: hotelcat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('hotelcat_id_seq', 8, true);


--
-- Data for Name: income; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY income (id, resource_id, invoice_id, account_item_id, date, sum, descr) FROM stdin;
60	2451	31	16	2015-06-13	1400.73	\N
66	2458	30	16	2015-06-14	35500.00	\N
67	2459	30	16	2015-06-14	5000.00	\N
65	2457	31	16	2015-06-14	380.00	\N
\.


--
-- Data for Name: income_cashflow; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY income_cashflow (income_id, cashflow_id) FROM stdin;
60	186
60	187
66	188
66	189
67	190
67	191
65	192
65	193
\.


--
-- Name: income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('income_id_seq', 67, true);


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY invoice (id, date, resource_id, account_id, active_until, order_id, descr) FROM stdin;
30	2015-06-06	2388	3	2015-06-09	9	\N
31	2015-06-13	2450	4	2015-06-16	7	\N
\.


--
-- Name: invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('invoice_id_seq', 31, true);


--
-- Data for Name: invoice_item; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY invoice_item (id, invoice_id, price, vat, discount, descr, order_item_id) FROM stdin;
29	30	7290.00	1215.00	0.00	\N	43
30	30	57090.00	9077.13	2627.25	Advance payment for travel services	42
31	31	1672.73	0.00	0.00	Tour booking service	39
\.


--
-- Name: invoice_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('invoice_item_id_seq', 31, true);


--
-- Data for Name: lead; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY lead (id, lead_date, resource_id, advsource_id, customer_id, status, descr) FROM stdin;
2	2015-02-04	2088	5	46	1	Test lead description
1	2015-02-04	2052	6	47	2	Cant to offer any proposition for customer
3	2015-05-24	2312	4	48	1	\N
4	2015-06-02	2333	2	50	0	\N
5	2015-06-06	2372	6	53	1	\N
6	2015-06-10	2434	6	53	3	\N
\.


--
-- Name: lead_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('lead_id_seq', 6, true);


--
-- Data for Name: lead_item; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY lead_item (id, resource_id, lead_id, service_id, currency_id, price_from, price_to, descr) FROM stdin;
1	2293	\N	5	57	\N	3001.00	Tour in Turkey for 2 adult persons and one children for 7 days in 5*
2	2294	\N	4	57	\N	70.00	A visa for Schengen for one person
3	2295	\N	5	57	\N	3000.00	Turkey, 5*, 2 persons adult
4	2297	\N	5	57	\N	2500.00	Turkey, 10 days, 2 persons, 5*
5	2300	2	5	57	\N	2500.00	Turkey, 5*, 2 persons, the middle of Jule, 10 days
6	2305	1	4	\N	\N	\N	Schengen
7	2310	3	5	57	\N	1600.00	For 2 persons into Egypt or Turkey, exelent 4* or 5* with AI, 7 days, in the middle of JUNE
8	2313	3	1	\N	\N	\N	Need a foreign passport for two persons very QUICK!
9	2329	4	5	57	2500.00	3500.00	Turkey, 5* AI, 2 adults and child, Kemer prefered
10	2330	4	4	54	\N	70.00	EU visa for 2 persons
11	2368	5	5	57	2000.00	3000.00	Croatia for 2 persons, 5* on June or July beginings
12	2433	6	5	\N	\N	\N	Turkey or Egypt on the end of July, 5* with UAI for 3 persons
\.


--
-- Name: lead_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('lead_item_id_seq', 12, true);


--
-- Data for Name: lead_offer; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY lead_offer (id, resource_id, lead_id, service_id, currency_id, supplier_id, price, status, descr) FROM stdin;
2	2299	\N	5	57	87	2450.00	0	\N
3	2301	2	5	57	87	2250.00	0	Turkey, 5*, UAI, Kemer, 2 persons, 10 - 20 of Jule
4	2306	1	4	57	90	100.00	2	This price only
5	2331	4	5	57	93	3300.00	1	Turkey Kemer, 5* UAI for 2 persons and child
6	2332	4	4	54	100	65.00	1	for 2 person single visa
7	2369	5	5	56	92	57090.00	1	Radisson Blu Resort & Spa Dubrovnik Sun Gardens 5*, Croatia, Orashac, for 2 persons
9	2437	6	5	57	99	1400.00	1	Egypt, Sharm El Sheih, 5 UAI, 10 days for 2 adult persons and 1 child
8	2435	6	5	57	100	1800.00	2	Turkey Kemer for 7 days with AI for 2 adults and single child. Hotel is uknown this is hot tour with caurosel.\r\n\r\nThis offer was not approved by customer, its too expensive
\.


--
-- Name: lead_offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('lead_offer_id_seq', 9, true);


--
-- Name: licence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('licence_id_seq', 50, true);


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY location (id, resource_id, name, region_id) FROM stdin;
1	1091	Kestel	12
3	1093	Airport Julyany (Kiev)	7
5	1097	Simferopol	13
6	1102	Munich	15
14	1287	Kiev	7
15	1289	Borispol Airport	7
16	1291	Opatiya	23
17	1319	Kirish	10
18	1321	Okurcalar	12
19	1326	Kemer	10
20	1329	Belek	24
21	1333	Konacli	25
22	1337	Kizilagac	26
23	1341	Paphos	27
24	1345	Marino Centro	28
25	1348	Terrasini	29
26	1353	Hersonissos	30
27	1356	La Pineda	31
28	1359	Salou	31
29	1361	Lorett de Marr	18
30	1363	Hurgada	9
31	1366	Nabk Bey	32
32	1385	Svalyava	33
33	1417	Dnepropetrovsk	34
34	1468	Lviv	22
35	1588	Diagoras Airport	35
36	1589	Rhodos	35
37	1648	Saint-Tropez	36
39	2374	Orashac	38
\.


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('location_id_seq', 39, true);


--
-- Data for Name: navigation; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY navigation (id, position_id, parent_id, name, url, icon_cls, sort_order, resource_id, separator_before, action) FROM stdin;
41	5	\N	Home	/	fa fa-home	1	1079	f	\N
47	5	\N	For Test	/	fa fa-credit-card	2	1253	f	\N
48	6	\N	Home	/	fa fa-home	1	1079	f	\N
49	6	\N	For Test	/	fa fa-credit-card	2	1253	f	\N
53	4	\N	Finance	/	fa fa-credit-card	7	1394	f	\N
156	4	53	Billing	/	\N	10	1905	f	\N
107	4	\N	Home	/	fa fa-home	1	1777	f	\N
32	4	\N	Sales	/	fa fa-legal	2	998	f	\N
21	4	\N	Clientage	/	fa fa-briefcase	3	864	f	\N
26	4	\N	Marketing	/	fa fa-bullhorn	4	900	f	\N
10	4	\N	HR	/	fa fa-group	5	780	f	\N
18	4	\N	Company	/	fa fa-building-o	6	837	f	\N
23	4	\N	Directories	/	fa fa-book	8	873	f	\N
152	4	\N	Reports	/	fa fa-pie-chart	9	1895	f	\N
8	4	\N	System	/	fa fa-cog	10	778	f	\N
155	4	53	Payments	/	\N	12	1904	f	\N
158	4	23	Geography	/	\N	13	1907	f	\N
160	4	152	Billing	/	\N	2	1909	f	\N
157	4	53	Currencies		\N	7	1906	t	\N
159	4	23	Hotels	/	\N	12	1908	t	\N
42	4	159	Hotels List	/hotels	\N	5	1080	f	\N
43	4	158	Locations	/locations	\N	3	1089	f	\N
50	4	53	Services List	/services	\N	6	1312	f	\N
45	4	53	Banks	/banks	\N	6	1212	f	tab_open
51	4	32	Invoices	/invoices	\N	5	1368	t	tab_open
9	4	8	Resource Types	/resources_types	\N	1	779	f	\N
13	4	10	Employees	/employees	\N	1	790	f	\N
54	4	157	Currencies Rates	/currencies_rates	\N	8	1395	f	\N
55	4	156	Accounts Items	/accounts_items	\N	3	1425	f	\N
56	4	155	Income Payments	/incomes	\N	9	1434	f	\N
57	4	156	Accounts	/accounts	\N	1	1436	f	\N
14	4	10	Employees Appointments	/appointments	\N	2	791	f	\N
60	4	23	Suppliers	/suppliers	\N	5	1550	f	tab_open
15	4	8	Users	/users	\N	3	792	f	\N
17	4	157	Currencies List	/currencies	\N	7	802	f	\N
19	4	18	Structures	/structures	\N	1	838	f	\N
20	4	18	Positions	/positions	\N	2	863	f	\N
22	4	21	Persons	/persons	\N	1	866	f	\N
24	4	158	Countries	/countries	\N	4	874	f	\N
25	4	158	Regions	/regions	\N	3	879	f	\N
27	4	26	Advertising Sources	/advsources	\N	1	902	f	\N
28	4	159	Hotels Categories	/hotelcats	\N	6	910	f	\N
29	4	159	Rooms Categories	/roomcats	\N	7	911	f	\N
30	4	159	Accomodations	/accomodations	\N	10	955	f	tab_open
31	4	159	Food Categories	/foodcats	\N	9	956	f	\N
36	4	23	Business Persons	/bpersons	\N	8	1008	f	tab_open
61	4	155	Outgoing Payments	/outgoings	\N	10	1571	f	\N
150	4	156	Subaccounts	/subaccounts	\N	2	1798	f	\N
151	4	155	Cross Payments	/crosspayments	\N	11	1885	f	\N
153	4	160	Turnovers	/turnovers	\N	1	1896	f	\N
162	4	160	Debts	/debts	\N	2	1921	f	\N
163	4	26	Email Campaigns	/emails_campaigns	\N	2	1953	t	\N
165	4	8	Company	/companies/edit	\N	4	1975	t	dialog_open
166	4	32	Leads	/leads	\N	2	2048	f	tab_open
168	4	32	Orders	/orders	\N	4	2101	f	tab_open
169	4	23	Transfers	/transfers	\N	9	2128	t	tab_open
170	4	23	Transport	/transports	\N	10	2136	f	tab_open
171	4	23	Suppliers Types	/suppliers_types	\N	7	2219	f	tab_open
172	4	23	Contracts	/contracts	\N	6	2222	f	tab_open
173	4	23	Ticket Class	/tickets_classes	\N	11	2245	f	tab_open
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY note (id, resource_id, title, descr) FROM stdin;
1	1800	Для тестирования	\N
2	1801	For testing purpose	\N
3	1802	This resource type is under qustion	<b>Seems we need new schema for accounting.</b>
4	1803	I had asked questions for expert in accounting	Alexander said that the most appopriate schema is to use accounts for each object such as persons, touroperators and so on
5	1804	Need to ask questions to expert	\N
18	1833	Main Developer of TravelCRM	The main developer of TravelCRM
24	1872	For users	This subaccount is for Person Garkaviy Andrew
25	1924	Passport detalized	There is no information about passport
26	1931	Resource Task	This is for resource only
27	1979	Test Note	Description to test note
28	1981	VIP User	This user is for VIP
29	2012	Good Hotel	Edit description for Hotels note
30	2065	Note without source resource	This note was created directly from Tools Panel
31	2087	Good customer	Good customer in any case
32	2092	Failure	Customer failure from offers
33	2096	For test purpose only	\N
34	2097	Failure 2	\N
35	2098	New property SERVICE_TYPE	Add new property for services - SERVICE_TYPE. There is 2 types - common and tour.
36	2132	New note for Lastovec	Test Note for User
42	2302	Cant call	\N
43	2370	Very promissed	Very promised client, redy to make business
\.


--
-- Name: note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('note_id_seq', 43, true);


--
-- Data for Name: note_resource; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY note_resource (note_id, resource_id) FROM stdin;
3	1797
5	1797
24	1868
28	3
18	784
29	1470
26	1930
27	1980
33	970
36	2126
42	2075
31	2088
32	2052
34	2052
43	2372
35	1413
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY notification (id, resource_id, title, descr, created, url) FROM stdin;
3	1945	A reminder of the task #42	Do not forget about task!	2014-12-14 19:51:00.013635+02	\N
4	1946	A reminder of the task #42	Do not forget about task!	2014-12-14 20:31:00.012771+02	\N
5	1947	A reminder of the task #40	Do not forget about task!	2014-12-14 20:32:00.061386+02	\N
6	1948	A reminder of the task #42	Do not forget about task!	2014-12-14 20:34:00.011181+02	\N
7	1949	A reminder of the task #42	Do not forget about task!	2014-12-14 20:35:00.011903+02	\N
8	1950	A reminder of the task #42	Do not forget about task!	2014-12-14 20:38:00.01699+02	\N
9	1959	A reminder of the task #44	Do not forget about task!	2014-12-21 19:21:00.016784+02	\N
10	1961	Task: #44	Test new scheduler realization	2014-12-21 19:44:00.016315+02	\N
11	1963	Task: Test	Test	2014-12-24 21:33:00.014126+02	\N
12	1965	Task: For testing	For testing	2014-12-25 21:06:00.013657+02	\N
13	1972	Task: Check Payments	Check Payments	2015-01-04 12:46:00.019127+02	\N
14	1973	Task: Check Payments	Check Payments	2015-01-04 14:06:00.016859+02	\N
15	1984	Task: Test	Test	2015-01-13 17:01:00.018967+02	\N
16	1986	Task: Test 2	Test 2	2015-01-13 17:04:00.011637+02	\N
17	2010	Task: I decided to try to follow the postgres approach as directly as possible and came up with the following migration.	I decided to try to follow the postgres approach as directly as possible and came up with the following migration.	2015-01-21 21:45:00.013037+02	\N
18	2064	Task: Revert status after testing	Revert status after testing	2015-03-08 18:42:00.01327+02	\N
19	2067	Task: Notifications testing #2	Notifications testing #2	2015-03-09 17:17:00.020674+02	\N
20	2069	Task: Test Notification resource link	Test Notification resource link	2015-03-09 19:29:00.018282+02	\N
21	2076	Task: Call about discounts	Call about discounts	2015-03-21 17:10:00.014771+02	\N
22	2133	Task: Task For Lastovec	Task For Lastovec	2015-04-22 15:40:00.007831+03	\N
23	2198	Task: Check reminder	Check reminder	2015-05-03 13:35:00.039271+03	\N
24	2304	Task: Call about offer	Call about offer	2015-05-24 17:20:00.01303+03	\N
\.


--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('notification_id_seq', 24, true);


--
-- Data for Name: notification_resource; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY notification_resource (notification_id, resource_id) FROM stdin;
20	2068
21	2075
22	2131
23	2197
24	2303
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY "order" (id, deal_date, resource_id, customer_id, advsource_id, descr, lead_id, status) FROM stdin;
4	2015-05-10	2275	17	4	\N	\N	0
3	2015-05-10	2267	43	5	\N	\N	0
2	2015-05-10	2264	44	6	\N	\N	0
5	2015-04-29	2280	42	1	Test description	\N	0
6	2015-05-16	2284	36	2	\N	\N	0
8	2015-06-02	2345	50	2	\N	4	0
9	2015-06-06	2382	53	6	\N	5	1
7	2015-05-26	2317	48	4	For Lead testing	3	3
\.


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('order_id_seq', 9, true);


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY order_item (id, resource_id, order_id, service_id, currency_id, price, status, status_date, status_info, supplier_id, discount_sum, discount_percent) FROM stdin;
28	2254	\N	7	57	420.00	0	\N	\N	97	0.00	0.00
29	2256	\N	7	57	420.00	0	\N	\N	97	0.00	0.00
30	2258	\N	7	57	420.00	0	\N	\N	97	0.00	0.00
34	2273	4	4	57	150.00	1	2015-05-10	\N	102	0.00	0.00
33	2265	3	5	57	2400.00	0	\N	\N	94	0.00	0.00
31	2260	2	7	57	422.00	0	\N	\N	97	0.00	0.00
32	2262	2	7	57	387.00	0	\N	\N	97	0.00	0.00
37	2285	\N	5	57	2780.00	1	2015-05-16	\N	87	0.00	0.00
38	2287	\N	7	54	640.00	2	2015-05-16	\N	97	0.00	0.00
36	2282	6	5	57	3201.00	0	2015-05-16	\N	87	0.00	2.00
35	2278	5	1	57	40.00	1	2015-05-10	passport had been received by customer	102	0.00	0.00
40	2341	8	5	57	3300.00	1	2015-06-02	\N	93	0.00	3.00
41	2343	8	4	54	130.00	0	\N	\N	100	0.00	2.00
43	2379	9	4	54	300.00	1	2015-06-06	#678975-HJYT	102	0.00	0.00
42	2377	9	5	56	57090.00	1	2015-06-06	#5677912TY	92	1200.00	2.50
39	2315	7	5	57	1760.00	1	2015-05-26	#878qweiu	87	0.00	0.00
\.


--
-- Name: order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('order_item_id_seq', 43, true);


--
-- Data for Name: outgoing; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY outgoing (id, resource_id, account_item_id, date, subaccount_id, sum, descr) FROM stdin;
13	1903	3	2014-11-18	10	8200.00	\N
16	1915	6	2014-11-23	12	15000.00	\N
21	2463	17	2015-06-14	22	108.00	Test for outgoing cashflows
23	2467	18	2015-06-14	23	15000.00	\N
\.


--
-- Data for Name: outgoing_cashflow; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY outgoing_cashflow (outgoing_id, cashflow_id) FROM stdin;
21	215
23	218
23	217
\.


--
-- Name: outgoing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('outgoing_id_seq', 23, true);


--
-- Data for Name: passport; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY passport (id, country_id, num, descr, resource_id, end_date, passport_type) FROM stdin;
1	14	231654	\N	1199	\N	0
2	14	132456	\N	1200	\N	0
4	12	1234564	\N	1205	\N	0
5	14	Svxzvxz	xzcvxzcv	1206	\N	0
14	3	RT678123	Foreign Passport	1584	2015-08-21	0
15	3	TY67342	\N	1592	2015-08-28	0
17	3	ER781263	\N	1613	\N	0
21	3	RT7892634	\N	1643	2017-07-19	0
22	3	RT632453	\N	1651	2019-08-16	0
25	9	TY78534	\N	2019	2018-06-06	0
6	3	НК028057	\N	1261	\N	1
7	3	HJ123456	new passport	1265	\N	1
8	3	РМ12345	from Kiev region	1286	\N	1
9	3	HK123456	\N	1376	\N	1
10	3	HK12345	\N	1381	\N	1
11	3	PO123456	\N	1406	\N	1
12	3	TY3456	\N	1467	2016-04-10	1
13	3	YU78932	Ukrainian citizen passport	1582	\N	1
16	3	IO98676	\N	1612	\N	1
18	3	НК089564	\N	1622	\N	1
19	3	RE6712346	\N	1625	\N	1
20	3	HJ789665	\N	1642	\N	1
23	3	RTY	\N	1925	\N	1
24	3	HH67187	\N	2014	\N	1
\.


--
-- Name: passport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('passport_id_seq', 25, true);


--
-- Data for Name: permision; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY permision (id, resource_type_id, position_id, permisions, structure_id, scope_type) FROM stdin;
35	65	4	{view,add,edit,delete}	\N	all
34	61	4	{view,add,edit,delete}	\N	all
32	59	4	{view,add,edit,delete}	\N	all
30	55	4	{view,add,edit,delete}	\N	all
38	41	4	{view,add,edit,delete}	\N	all
37	67	4	{view,add,edit,delete}	\N	all
39	69	4	{view,add,edit,delete}	\N	all
40	39	4	{view,add,edit,delete}	\N	all
41	70	4	{view,add,edit,delete}	\N	all
42	71	4	{view,add,edit,delete}	\N	all
43	72	4	{view,add,edit,delete}	\N	all
44	73	4	{view,add,edit,delete}	\N	all
45	74	4	{view,add,edit,delete}	\N	all
46	75	4	{view,add,edit,delete}	\N	all
48	78	4	{view,add,edit,delete}	\N	all
49	79	4	{view,add,edit,delete}	\N	all
26	47	4	{view,add,edit,delete}	\N	all
53	2	5	{view,add,edit,delete}	\N	all
54	1	5	{view}	\N	all
55	83	4	{view,add,edit,delete}	\N	all
56	84	4	{view,add,edit,delete}	\N	all
58	86	4	{view,add,edit,delete}	\N	all
59	87	4	{view,add,edit,delete}	\N	all
61	89	4	{view,add,edit,delete}	\N	all
62	90	4	{view,add,edit,delete}	\N	all
63	91	4	{view,add,edit,delete}	\N	all
21	1	4	{view}	\N	all
65	93	4	{view,add,edit,delete}	\N	all
67	1	6	{view}	\N	all
66	2	6	{view,add,edit,delete}	5	structure
68	1	7	{view}	\N	all
69	2	7	{view,add,edit,delete}	5	structure
70	101	4	{view,add,edit,delete}	\N	all
22	2	4	{view,add,edit,delete}	\N	all
71	102	4	{view,add,edit,delete}	\N	all
73	104	4	{view,add,edit,delete}	\N	all
74	105	4	{view,add,edit,delete}	\N	all
76	107	4	{view,add,edit,delete}	\N	all
79	110	4	{view,add,edit,delete}	\N	all
80	111	4	{view,add,edit,delete}	\N	all
85	65	8	{view,add,edit,delete}	\N	all
86	61	8	{view,add,edit,delete}	\N	all
87	59	8	{view,add,edit,delete}	\N	all
88	55	8	{view,add,edit,delete}	\N	all
89	41	8	{view,add,edit,delete}	\N	all
90	67	8	{view,add,edit,delete}	\N	all
91	69	8	{view,add,edit,delete}	\N	all
92	39	8	{view,add,edit,delete}	\N	all
93	70	8	{view,add,edit,delete}	\N	all
94	71	8	{view,add,edit,delete}	\N	all
95	72	8	{view,add,edit,delete}	\N	all
96	73	8	{view,add,edit,delete}	\N	all
97	74	8	{view,add,edit,delete}	\N	all
98	75	8	{view,add,edit,delete}	\N	all
99	78	8	{view,add,edit,delete}	\N	all
100	79	8	{view,add,edit,delete}	\N	all
101	47	8	{view,add,edit,delete}	\N	all
102	83	8	{view,add,edit,delete}	\N	all
103	84	8	{view,add,edit,delete}	\N	all
104	86	8	{view,add,edit,delete}	\N	all
105	87	8	{view,add,edit,delete}	\N	all
106	89	8	{view,add,edit,delete}	\N	all
107	90	8	{view,add,edit,delete}	\N	all
108	91	8	{view,add,edit,delete}	\N	all
109	1	8	{view}	\N	all
110	93	8	{view,add,edit,delete}	\N	all
111	101	8	{view,add,edit,delete}	\N	all
112	2	8	{view,add,edit,delete}	\N	all
113	102	8	{view,add,edit,delete}	\N	all
114	104	8	{view,add,edit,delete}	\N	all
115	105	8	{view,add,edit,delete}	\N	all
116	103	8	{view,add,edit,delete}	\N	all
117	106	8	{view,add,edit,delete}	\N	all
118	107	8	{view,add,edit,delete}	\N	all
120	110	8	{view,add,edit,delete}	\N	all
121	111	8	{view,add,edit,delete}	\N	all
123	12	8	{view,add,edit,delete,settings}	\N	all
128	117	4	{view,add,edit,delete}	\N	all
129	118	4	{view,add,edit,delete}	\N	all
130	119	4	{autoload,view,edit,delete}	\N	all
131	120	4	{view,add,edit,delete}	\N	all
132	121	4	{view}	\N	all
133	122	4	{view}	\N	all
136	125	4	{view,settings}	\N	all
140	129	4	{view,settings}	\N	all
24	12	4	{view,add,edit,delete,settings}	\N	all
134	123	4	{view,close}	\N	all
137	126	4	{view,edit}	\N	all
158	146	4	{view,add,edit,delete}	\N	all
141	130	4	{view,add,edit,delete,order}	\N	all
157	145	4	{view,add,edit,delete}	\N	all
155	144	4	{view,add,edit,delete}	\N	all
154	143	4	{view,add,edit,delete}	\N	all
153	142	4	{view,add,edit,delete}	\N	all
152	141	4	{view,add,edit,delete}	\N	all
151	140	4	{view,add,edit,delete}	\N	all
150	139	4	{view,add,edit,delete}	\N	all
149	138	4	{view,add,edit,delete}	\N	all
148	137	4	{view,add,edit,delete}	\N	all
146	135	4	{view,add,edit,delete}	\N	all
145	134	4	{view,add,edit,delete,calculation,invoice,contract}	\N	all
135	124	4	{view,add,edit,delete}	\N	all
75	106	4	{view,add,edit,delete}	\N	all
72	103	4	{view,add,edit,delete,settings}	\N	all
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY person (id, resource_id, first_name, last_name, second_name, birthday, subscriber, gender) FROM stdin;
17	1284	Nikolay	Voevoda		1981-07-22	f	0
19	1294	Stas	Voevoda		2007-10-16	f	0
20	1372	Oleg	Pogorelov		1970-02-17	f	0
24	1390	Igor	Mazur		2007-07-21	f	0
25	1408	Vitalii	Klishunov		1976-04-07	f	0
26	1409	Natalia	Klishunova		1978-08-10	f	0
27	1410	Maxim	Klishunov		2005-02-16	f	0
29	1465	Eugen	Velichko		1982-04-07	f	0
31	1472	Velichko	Alexander		2006-01-11	f	0
33	1586	Roman	Babich		1990-11-14	f	0
36	1616	Nikolay	Artyuh		1986-10-08	f	0
37	1619	Andriy	Garkaviy		1984-11-14	f	0
39	1627	Petro	Garkaviy		2004-06-08	f	0
41	1645	Karpenko	Alexander		1990-06-04	f	0
43	1869	Alexey	Ivankiv	V.	\N	t	0
38	1626	Elena	Garkava		1986-01-08	t	0
22	1383	Vitalii	Mazur		1979-07-17	t	0
44	2017	Sergey	Gavrish		1981-08-05	t	0
18	1293	Irina	Voevoda		1984-01-18	f	1
21	1375	Elena	Pogorelova	Petrovna	1972-02-19	f	1
28	1411	Ann	Klishunova		2013-02-14	f	1
30	1471	Irina	Avdeeva		1984-11-21	f	1
32	1473	Velichko	Elizabeth		2010-06-15	f	1
34	1593	Elena	Babich		1991-05-23	f	1
42	1653	Smichko	Olena		1992-07-15	f	1
40	1628	Alena	Garkava		2007-03-29	t	1
35	1615	Tat'ana	Artyuh		1987-02-10	t	1
45	2020	Anna	Gavrish		1993-11-17	t	1
4	870	Greg	Johnson		\N	f	0
5	871	John	Doe		\N	f	0
6	887	Peter	Parker		1976-04-07	f	0
46	2051	Nikolay			\N	f	0
23	1389	Iren	Mazur		1979-09-03	f	1
47	2090	Jason		Lewis	\N	f	0
48	2309	Oleg			\N	f	0
49	2314	Anna			\N	f	1
50	2328	Alex	Nikitin		1991-08-14	f	0
51	2339	Julia	Nikitina		1991-12-12	f	1
52	2340	Ivan	Nikitin		2012-02-15	f	0
53	2367	Sergey	Stepanchuk		1984-11-06	f	0
54	2376	Nadiya	Gavrilyuk		1988-03-02	f	1
\.


--
-- Data for Name: person_address; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY person_address (person_id, address_id) FROM stdin;
17	10
20	15
21	16
22	17
23	18
24	19
25	20
29	23
33	24
35	25
37	26
41	27
42	28
30	30
44	32
\.


--
-- Data for Name: person_contact; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY person_contact (person_id, contact_id) FROM stdin;
6	44
17	45
17	46
20	47
21	48
22	50
22	49
23	51
25	52
29	53
33	67
34	68
35	69
35	70
37	72
37	71
38	73
41	74
41	75
42	76
30	77
22	78
44	79
45	80
46	81
47	82
46	83
48	84
48	85
50	86
51	87
53	88
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('person_id_seq', 54, true);


--
-- Data for Name: person_order_item; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY person_order_item (order_item_id, person_id) FROM stdin;
33	41
33	43
34	17
37	20
37	21
38	21
38	20
36	36
36	35
35	33
35	42
40	51
40	50
40	52
41	50
41	51
43	53
43	54
42	53
42	54
39	48
39	49
28	44
28	45
29	44
29	45
30	44
30	45
31	44
31	45
32	44
32	45
\.


--
-- Data for Name: person_passport; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY person_passport (person_id, passport_id) FROM stdin;
17	8
20	9
22	10
25	11
29	12
33	14
33	13
34	15
35	17
35	16
37	18
38	19
41	20
41	21
42	22
30	23
44	24
45	25
\.


--
-- Data for Name: person_subaccount; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY person_subaccount (person_id, subaccount_id) FROM stdin;
41	3
37	4
40	6
20	8
29	11
30	13
41	14
43	15
6	16
44	17
53	21
48	22
\.


--
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY "position" (id, resource_id, structure_id, name) FROM stdin;
4	772	32	Main Developer
5	886	5	Finance Director
6	1249	3	Sales Manager
7	1252	9	Sales Manager
8	1775	1	Main Developer
\.


--
-- Name: positions_navigations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('positions_navigations_id_seq', 173, true);


--
-- Name: positions_permisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('positions_permisions_id_seq', 159, true);


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY region (id, resource_id, country_id, name) FROM stdin;
7	895	3	Kiev region
8	896	3	Lviv region
9	897	4	Hurgada
10	898	5	Kemer
12	1090	5	Antalya
13	1096	9	Cramia
15	1101	11	Bavaria
16	1165	12	Middle Dalmaci
17	1170	13	Fujairah
18	1179	14	Costa Brava
19	1185	13	Abu Dhabi
22	1278	3	Lviv
23	1290	12	Kvarner
24	1328	5	Belek
25	1332	5	Alanya
26	1336	5	Side
27	1340	16	Paphos
28	1344	17	Riminni & Ravenna
29	1347	17	Sicilia Island
30	1352	18	Crit Island
31	1355	14	Costa Dorada
32	1365	4	Sharm el Sheih
33	1384	3	Zakarpat'e
34	1416	3	Dnepropetrovsk
35	1587	18	Rhodos Island
36	1647	19	Chemiu Due Capon
38	2373	12	South Dalmacia
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY resource (id, resource_type_id, structure_id, protected) FROM stdin;
1080	65	32	\N
1081	12	32	\N
863	65	32	\N
875	70	32	\N
885	47	32	\N
1100	70	32	\N
895	39	32	\N
1101	39	32	\N
1102	84	32	\N
1268	12	32	f
998	65	32	\N
1010	79	32	\N
1283	71	32	f
1284	69	32	f
1287	84	32	f
1289	84	32	f
728	55	32	\N
784	47	32	\N
1306	90	32	f
1312	65	32	f
786	47	32	\N
802	65	32	\N
769	12	32	\N
30	12	32	\N
31	12	32	\N
32	12	32	\N
33	12	32	\N
34	12	32	\N
35	12	32	\N
36	12	32	\N
837	65	32	\N
1336	39	32	f
1164	70	32	\N
1165	39	32	\N
1337	84	32	f
1338	83	32	f
1347	39	32	f
1348	84	32	f
1349	83	32	f
1355	39	32	f
1356	84	32	f
1204	87	32	\N
1207	12	32	\N
1357	83	32	f
1218	39	32	\N
1359	84	32	f
1360	83	32	f
1365	39	32	f
1366	84	32	f
1367	83	32	f
1240	41	32	f
1398	104	32	f
1257	87	32	f
1258	87	32	f
1413	102	32	f
849	41	32	\N
851	41	32	\N
852	41	32	\N
1285	87	32	f
864	65	32	\N
876	41	32	\N
886	59	32	\N
1286	89	32	f
896	39	32	\N
897	39	32	\N
772	59	32	\N
788	12	32	\N
706	12	32	\N
1291	84	32	f
771	55	32	\N
838	65	32	\N
734	55	32	\N
898	39	32	\N
899	39	32	\N
900	65	32	\N
901	12	32	\N
902	65	32	\N
1292	83	32	f
1304	87	32	f
1011	12	32	\N
1307	90	32	f
1313	12	32	f
1368	65	32	f
1414	90	32	f
1415	91	32	f
1185	39	32	\N
1198	12	32	\N
1205	89	32	\N
1221	12	32	\N
1227	93	32	\N
1241	39	32	f
1259	87	32	f
1260	87	32	f
853	41	32	\N
865	12	32	\N
866	65	32	\N
789	67	32	\N
1288	90	32	f
887	69	32	\N
1290	39	32	f
773	12	32	\N
892	67	32	\N
903	71	32	\N
904	71	32	\N
905	71	32	\N
906	71	32	\N
907	71	32	\N
1308	90	32	f
1314	102	32	f
1372	69	32	f
1375	69	32	f
1382	90	32	f
1168	41	32	\N
1040	47	32	\N
1041	47	32	\N
1042	47	32	\N
1043	47	32	\N
1044	47	32	\N
1045	47	32	\N
1046	47	32	\N
1169	70	32	\N
1388	90	32	f
1391	90	32	f
1067	78	32	\N
1400	104	32	f
1401	104	32	f
1199	89	32	\N
1206	89	32	\N
1209	90	32	\N
1402	104	32	f
1416	39	32	f
1417	84	32	f
1418	90	32	f
1419	91	32	f
1249	59	32	f
1250	55	32	f
1251	55	32	f
1252	59	32	f
1261	89	32	f
854	2	32	\N
855	2	32	\N
1277	55	32	f
1278	39	32	f
878	70	32	\N
1293	69	32	f
893	47	32	\N
894	2	32	\N
908	12	32	\N
909	12	32	\N
910	65	32	\N
911	65	32	\N
743	55	32	\N
790	65	32	\N
1294	69	32	f
763	55	32	\N
723	12	32	\N
791	65	32	\N
775	12	32	\N
37	12	32	\N
38	12	32	\N
39	12	32	\N
40	12	32	\N
43	12	32	\N
10	12	32	\N
792	65	32	\N
12	12	32	\N
14	12	32	\N
44	12	32	\N
16	12	32	\N
45	12	32	\N
1309	90	32	f
2	2	32	\N
3	2	32	\N
84	2	32	\N
83	2	32	\N
940	73	32	\N
941	73	32	\N
942	73	32	\N
943	73	32	\N
944	73	32	\N
945	73	32	\N
946	73	32	\N
947	73	32	\N
948	73	32	\N
949	73	32	\N
950	73	32	\N
1316	102	32	f
952	73	32	\N
939	73	32	\N
938	73	32	\N
937	73	32	\N
936	73	32	\N
935	73	32	\N
1370	90	32	f
933	73	32	\N
932	73	32	\N
931	73	32	\N
930	73	32	\N
929	73	32	\N
928	73	32	\N
927	73	32	\N
926	73	32	\N
925	73	32	\N
924	73	32	\N
923	73	32	\N
922	73	32	\N
921	73	32	\N
1371	87	32	f
919	72	32	\N
918	72	32	\N
917	72	32	\N
916	72	32	\N
915	72	32	\N
914	72	32	\N
913	72	32	\N
912	72	32	\N
1373	87	32	f
1376	89	32	f
1378	78	32	f
1385	84	32	f
1386	83	32	f
1060	41	32	\N
1068	12	32	\N
1390	69	32	f
1403	104	32	f
1170	39	32	\N
1178	70	32	\N
1179	39	32	\N
1420	101	32	f
1189	12	32	\N
1190	12	32	\N
1200	89	32	\N
1210	90	32	\N
1225	12	32	\N
1230	93	32	\N
1243	87	32	f
1253	65	32	f
1263	87	32	f
856	2	32	\N
870	69	32	\N
1088	12	32	\N
879	65	32	\N
1089	65	32	\N
953	12	32	\N
954	12	32	\N
764	12	32	\N
955	65	32	\N
956	65	32	\N
957	74	32	\N
958	74	32	\N
959	74	32	\N
960	74	32	\N
961	74	32	\N
962	74	32	\N
963	74	32	\N
964	74	32	\N
965	74	32	\N
966	74	32	\N
967	74	32	\N
968	74	32	\N
969	74	32	\N
970	74	32	\N
971	74	32	\N
1310	41	32	f
973	75	32	\N
1317	12	32	f
975	75	32	\N
976	75	32	\N
977	75	32	\N
978	75	32	\N
274	12	32	\N
283	12	32	\N
1318	102	32	f
778	65	32	\N
779	65	32	\N
780	65	32	\N
286	41	32	\N
287	41	32	\N
288	41	32	\N
289	41	32	\N
290	41	32	\N
291	41	32	\N
292	41	32	\N
306	41	32	\N
277	39	32	\N
279	39	32	\N
280	39	32	\N
281	39	32	\N
278	39	32	\N
282	39	32	\N
979	75	32	\N
980	75	32	\N
981	75	32	\N
982	75	32	\N
983	75	32	\N
984	75	32	\N
985	75	32	\N
1319	84	32	f
987	75	32	\N
988	75	32	\N
1320	83	32	f
1003	12	32	\N
1004	78	32	\N
1005	78	32	\N
1321	84	32	f
1322	83	32	f
1326	84	32	f
1327	83	32	f
1328	39	32	f
1329	84	32	f
1330	83	32	f
1374	90	32	f
1191	86	32	\N
1201	87	32	\N
1211	12	32	\N
1212	65	32	\N
1213	90	32	\N
1380	87	32	f
1383	69	32	f
1244	87	32	f
1264	87	32	f
1387	87	32	f
1393	12	32	f
1394	65	32	f
1404	87	32	f
1406	89	32	f
1409	69	32	f
857	55	32	\N
858	55	32	\N
859	55	32	\N
860	55	32	\N
861	55	32	\N
794	55	32	\N
800	55	32	\N
801	55	32	\N
1090	39	32	\N
871	69	32	\N
880	70	32	\N
881	70	32	\N
882	70	32	\N
883	70	32	\N
884	70	32	\N
1091	84	32	\N
1007	12	32	\N
1008	65	32	\N
1093	84	32	\N
1311	41	32	f
1062	55	32	\N
1323	83	32	f
1324	83	32	f
1078	12	32	\N
1325	83	32	f
1331	83	32	f
1332	39	32	f
1333	84	32	f
1334	83	32	f
1192	86	32	\N
1214	91	32	\N
1379	87	32	f
1381	89	32	f
1265	89	32	f
1384	39	32	f
1389	69	32	f
1395	65	32	f
1407	90	32	f
1411	69	32	f
872	12	32	\N
873	65	32	\N
874	65	32	\N
725	55	32	\N
726	55	32	\N
1282	87	32	f
1095	70	32	\N
1009	79	32	\N
1096	39	32	\N
1097	84	32	\N
1335	83	32	f
1079	65	32	\N
1099	39	32	\N
1339	70	32	f
1340	39	32	f
1341	84	32	f
1342	83	32	f
1343	70	32	f
1344	39	32	f
1345	84	32	f
1159	78	32	\N
1346	83	32	f
1350	83	32	f
1351	70	32	f
1193	87	32	\N
1194	87	32	\N
1195	87	32	\N
1352	39	32	f
1353	84	32	f
1354	83	32	f
1358	83	32	f
1361	84	32	f
1362	83	32	f
1363	84	32	f
1364	83	32	f
1396	104	32	f
1408	69	32	f
1410	69	32	f
1424	12	32	f
1425	65	32	f
1426	105	32	f
1431	105	32	f
1432	105	32	f
1433	12	32	f
1434	65	32	f
1435	12	32	f
1436	65	32	f
1438	107	32	f
1439	107	32	f
1440	103	32	f
1442	103	32	f
1447	106	32	f
1448	106	32	f
1450	12	32	f
1452	12	32	f
1464	87	32	f
1465	69	32	f
1467	89	32	f
1468	84	32	f
1469	90	32	f
1470	83	32	f
1471	69	32	f
1472	69	32	f
1473	69	32	f
1485	106	32	f
1487	103	32	f
1500	106	32	f
1502	103	32	f
1503	103	32	f
1504	104	32	f
1505	104	32	f
1506	104	32	f
1507	107	32	f
1509	106	32	f
1510	101	32	f
1511	101	32	f
1512	101	32	f
1513	101	32	f
1514	101	32	f
1515	101	32	f
1516	87	32	f
1517	87	32	f
1518	87	32	f
1519	87	32	f
1521	12	32	f
1535	110	32	f
1536	110	32	f
1537	110	32	f
1538	110	32	f
1539	110	32	f
1540	110	32	f
1541	110	32	f
1542	67	32	f
1543	87	32	f
1544	87	32	f
1545	87	32	f
1546	106	32	f
1547	106	32	f
1548	12	32	f
1549	12	32	f
1550	65	32	f
1551	87	32	f
1552	87	32	f
1553	79	32	f
1554	101	32	f
1556	101	32	f
1559	87	32	f
1560	79	32	f
1561	87	32	f
1562	87	32	f
1563	79	32	f
1564	101	32	f
1569	101	32	f
1570	101	32	f
1571	65	32	f
1575	65	32	f
1576	86	32	f
1577	87	32	f
1578	79	32	f
1579	110	32	f
1580	78	32	f
1581	87	32	f
1582	89	32	f
1584	89	32	f
1585	90	32	f
1586	69	32	f
1587	39	32	f
1588	84	32	f
1589	84	32	f
1590	83	32	f
1591	87	32	f
1592	89	32	f
1593	69	32	f
1597	104	32	f
1598	103	32	f
1607	106	32	f
1608	105	32	f
1609	105	32	f
1610	87	32	f
1611	87	32	f
1612	89	32	f
1613	89	32	f
1614	90	32	f
1615	69	32	f
1616	69	32	f
1619	69	32	f
1620	87	32	f
1621	87	32	f
1622	89	32	f
1623	90	32	f
1624	87	32	f
1625	89	32	f
1626	69	32	f
1627	69	32	f
1628	69	32	f
1634	103	32	f
1639	106	32	f
1640	87	32	f
1641	87	32	f
1642	89	32	f
1643	89	32	f
1644	90	32	f
1645	69	32	f
1646	70	32	f
1647	39	32	f
1648	84	32	f
1649	83	32	f
1650	87	32	f
1651	89	32	f
1652	90	32	f
1653	69	32	f
1657	103	32	f
1659	65	32	f
1660	106	32	f
1714	110	32	f
1721	110	32	f
1764	111	32	f
1766	111	32	f
1769	105	32	f
1771	111	32	f
1773	111	32	f
1774	111	32	f
1775	59	32	f
1777	65	32	f
1778	12	1	f
1780	105	32	f
1797	12	32	f
1798	65	32	f
1799	12	32	f
1800	118	32	f
1801	118	32	f
1802	118	32	f
1803	118	32	f
1804	118	32	f
1807	90	32	f
1833	118	32	f
1839	103	32	f
1840	103	32	f
1849	12	32	f
1852	119	32	f
1853	119	32	f
1854	119	32	f
1855	119	32	f
1859	119	32	f
1860	119	32	f
1865	117	32	f
1866	117	32	f
1867	117	32	f
1868	117	32	f
1869	69	32	f
1870	78	32	f
1872	118	32	f
1873	105	32	f
1875	106	32	f
1876	106	32	f
1880	106	32	f
1881	106	32	f
1882	106	32	f
1884	12	32	f
1885	65	32	f
1888	117	32	f
1893	120	32	f
1894	12	32	f
1895	65	32	f
1896	65	32	f
1898	105	32	f
1900	120	32	f
1901	120	32	f
1902	117	32	f
1903	111	32	f
1904	65	32	f
1905	65	32	f
1906	65	32	f
1907	65	32	f
1908	65	32	f
1909	65	32	f
1910	106	32	f
1911	106	32	f
1913	117	32	f
1915	111	32	f
1917	110	32	f
1918	119	32	f
1919	12	32	f
1921	65	32	f
1922	93	32	f
1924	118	32	f
1925	89	32	f
1926	90	32	f
1927	87	32	f
1930	93	32	f
1931	118	32	f
1932	93	32	f
1933	93	32	f
1934	93	32	f
1935	93	32	f
1936	93	32	f
1939	93	32	f
1940	93	32	f
1941	12	32	f
1945	123	32	f
1946	123	32	f
1947	123	32	f
1948	123	32	f
1949	123	32	f
1950	123	32	f
1951	90	32	f
1952	86	32	f
1953	65	32	f
1954	12	32	f
1956	87	32	f
1958	93	32	f
1959	123	32	f
1961	123	32	f
1962	93	32	f
1963	123	32	f
1964	93	32	f
1965	123	32	f
1955	124	32	f
1966	12	32	f
1968	12	32	f
1970	126	32	f
1971	93	32	f
1972	123	32	f
1973	123	32	f
1975	65	32	f
1976	55	32	f
1977	12	32	f
1978	2	32	f
1979	118	32	f
1980	93	32	f
1981	118	32	f
1982	93	32	f
1983	93	32	f
1984	123	32	f
1985	93	32	f
1986	123	32	f
1987	103	32	f
1988	119	32	f
1989	12	32	f
1990	106	32	f
1991	106	32	f
1992	106	32	f
1993	106	32	f
1994	106	32	f
1995	106	32	f
1996	106	32	f
1997	106	32	f
2000	103	32	f
2001	106	32	f
2002	106	32	f
2005	103	32	f
2006	106	32	f
2007	106	32	f
2009	93	32	f
2010	123	32	f
2011	110	32	f
2012	118	32	f
2013	87	32	f
2014	89	32	f
2015	90	32	f
2016	93	32	f
2017	69	32	f
2018	87	32	f
2019	89	32	f
2020	69	32	f
2023	104	32	f
2024	104	32	f
2026	103	32	f
2027	106	32	f
2028	106	32	f
2029	119	32	f
2030	119	32	f
2031	119	32	f
2032	110	32	f
2038	119	32	f
2039	119	32	f
2044	119	32	f
2045	119	32	f
2046	119	32	f
2047	119	32	f
2048	65	32	f
2049	12	32	f
2050	87	32	f
2051	69	32	f
2052	130	32	f
2053	47	32	f
2054	2	32	f
2055	12	32	f
2062	93	32	f
2063	93	32	f
2064	123	32	f
2065	118	32	f
2066	93	32	f
2067	123	32	f
2068	93	32	f
2069	123	32	f
2070	12	32	f
2075	93	32	f
2076	123	32	f
2077	12	32	f
2087	118	32	f
2088	130	32	f
2089	87	32	f
2090	69	32	f
2092	118	32	f
2095	87	32	f
2096	118	32	f
2097	118	32	f
2098	118	32	f
2099	12	32	f
2100	12	32	f
2101	65	32	f
2104	135	32	f
2105	135	32	f
2106	135	32	f
2107	12	32	f
2108	12	32	f
2111	83	32	f
2115	39	32	f
2119	90	32	f
2120	101	32	f
2126	2	32	f
2127	12	32	f
2128	65	32	f
2129	138	32	f
2130	138	32	f
2131	93	32	f
2132	118	32	f
2133	123	32	f
2135	12	32	f
2136	65	32	f
2137	139	32	f
2138	139	32	f
2139	139	32	f
2144	135	32	f
2145	137	32	f
2146	135	32	f
2147	137	32	f
2148	135	32	f
2149	137	32	f
2150	135	32	f
2151	137	32	f
2152	135	32	f
2153	137	32	f
2154	135	32	f
2155	137	32	f
2156	135	32	f
2157	137	32	f
2158	135	32	f
2159	137	32	f
2160	135	32	f
2161	137	32	f
2162	135	32	f
2163	137	32	f
2164	135	32	f
2165	137	32	f
2167	135	32	f
2168	137	32	f
2171	93	32	f
2172	135	32	f
2173	137	32	f
2174	135	32	f
2175	137	32	f
2176	135	32	f
2177	137	32	f
2178	135	32	f
2179	137	32	f
2180	135	32	f
2181	137	32	f
2182	135	32	f
2183	137	32	f
2184	135	32	f
2185	137	32	f
2186	134	32	f
2187	135	32	f
2188	137	32	f
2189	135	32	f
2190	137	32	f
2197	93	32	f
2198	123	32	f
2199	105	32	f
2200	104	32	f
2201	104	32	f
2203	104	32	f
2205	110	32	f
2206	110	32	f
2207	110	32	f
2208	110	32	f
2209	110	32	f
2210	86	32	f
2211	110	32	f
2212	110	32	f
2213	86	32	f
2214	110	32	f
2215	86	32	f
2216	78	32	f
2217	12	32	f
2218	140	32	f
2219	65	32	f
2221	140	32	f
2222	65	32	f
2223	78	32	f
2224	78	32	f
2225	78	32	f
2226	78	32	f
2227	78	32	f
2228	78	32	f
2229	78	32	f
2230	78	32	f
2231	78	32	f
2232	78	32	f
2233	78	32	f
2234	78	32	f
2235	78	32	f
2236	78	32	f
2237	78	32	f
2238	78	32	f
2239	78	32	f
2240	78	32	f
2241	78	32	f
2242	78	32	f
2243	12	32	f
2244	12	32	f
2245	65	32	f
2246	105	32	f
2247	102	32	f
2248	141	32	f
2249	141	32	f
2254	135	32	f
2255	142	32	f
2256	135	32	f
2257	142	32	f
2258	135	32	f
2259	142	32	f
2260	135	32	f
2261	142	32	f
2262	135	32	f
2263	142	32	f
2264	134	32	f
2265	135	32	f
2266	137	32	f
2267	134	32	f
2268	12	32	f
2269	105	32	f
2270	70	32	f
2271	140	32	f
2272	78	32	f
2273	135	32	f
2274	143	32	f
2275	134	32	f
2276	12	32	f
2277	105	32	f
2278	135	32	f
2279	144	32	f
2280	134	32	f
2281	104	32	f
2282	135	32	f
2283	137	32	f
2284	134	32	f
2285	135	32	f
2286	137	32	f
2287	135	32	f
2288	142	32	f
2289	104	32	f
2290	104	32	f
2291	93	32	f
2292	12	32	f
2293	145	32	f
2294	145	32	f
2295	145	32	f
2296	12	32	f
2297	145	32	f
2299	146	32	f
2300	145	32	f
2301	146	32	f
2302	118	32	f
2303	93	32	f
2304	123	32	f
2305	145	32	f
2306	146	32	f
2307	87	32	f
2308	87	32	f
2309	69	32	f
2310	145	32	f
2311	93	32	f
2312	130	32	f
2313	145	32	f
2314	69	32	f
2315	135	32	f
2316	137	32	f
2317	134	32	f
2319	104	32	f
2320	12	32	f
2327	87	32	f
2328	69	32	f
2329	145	32	f
2330	145	32	f
2331	146	32	f
2332	146	32	f
2333	130	32	f
2334	104	32	f
2335	104	32	f
2336	104	32	f
2337	104	32	f
2338	87	32	f
2339	69	32	f
2340	69	32	f
2341	135	32	f
2342	137	32	f
2343	135	32	f
2344	143	32	f
2345	134	32	f
2366	87	32	f
2367	69	32	f
2368	145	32	f
2369	146	32	f
2370	118	32	f
2371	93	32	f
2372	130	32	f
2373	39	32	f
2374	84	32	f
2375	83	32	f
2376	69	32	f
2377	135	32	f
2378	137	32	f
2379	135	32	f
2380	143	32	f
2381	93	32	f
2382	134	32	f
2383	104	32	f
2384	104	32	f
2385	104	32	f
2388	103	32	f
2389	105	32	f
2390	105	32	f
2391	105	32	f
2392	105	32	f
2393	105	32	f
2394	105	32	f
2395	105	32	f
2396	105	32	f
2397	105	32	f
2398	105	32	f
2399	105	32	f
2400	105	32	f
2401	105	32	f
2402	105	32	f
2403	105	32	f
2404	105	32	f
2405	105	32	f
2406	105	32	f
2407	105	32	f
2408	105	32	f
2409	105	32	f
2410	105	32	f
2411	105	32	f
2412	105	32	f
2413	105	32	f
2414	105	32	f
2415	105	32	f
2416	105	32	f
2417	105	32	f
2418	105	32	f
2419	105	32	f
2420	105	32	f
2421	105	32	f
2422	105	32	f
2423	105	32	f
2424	105	32	f
2425	105	32	f
2426	105	32	f
2427	105	32	f
2428	105	32	f
2429	105	32	f
2430	105	32	f
2431	105	32	f
2432	105	32	f
2433	145	32	f
2434	130	32	f
2435	146	32	f
2436	93	32	f
2437	146	32	f
2438	117	32	f
2439	117	32	f
2440	117	32	f
2442	117	32	f
2450	103	32	f
2451	106	32	f
2452	117	32	f
2457	106	32	f
2458	106	32	f
2459	106	32	f
2463	111	32	f
2465	120	32	f
2466	117	32	f
2467	111	32	f
\.


--
-- Data for Name: resource_log; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY resource_log (id, resource_id, employee_id, comment, modifydt) FROM stdin;
142	83	2	\N	2013-12-07 16:38:38.11618+02
143	84	2	\N	2013-12-07 16:39:56.788641+02
144	3	2	\N	2013-12-07 16:41:27.65259+02
145	2	2	\N	2013-12-07 16:41:31.748494+02
146	83	2	\N	2013-12-07 16:58:05.802634+02
147	83	2	\N	2013-12-07 17:00:14.544264+02
4836	794	2	\N	2014-02-05 19:54:07.5415+02
5406	1192	2	\N	2014-04-06 19:21:11.278173+03
5407	1005	2	\N	2014-04-06 19:21:55.315341+03
4845	283	2	\N	2014-02-06 11:38:41.090464+02
2	10	2	\N	2013-11-16 19:00:14.24272+02
4	12	2	\N	2013-11-16 19:00:15.497284+02
6	14	2	\N	2013-11-16 19:00:16.696731+02
8	16	2	\N	2013-11-16 19:00:17.960761+02
5427	1204	2	\N	2014-04-09 18:54:09.146902+03
12	30	2	\N	2013-11-23 19:26:00.193553+02
13	30	2	\N	2013-11-23 22:02:37.363677+02
14	10	2	\N	2013-11-23 22:11:01.634598+02
15	30	2	\N	2013-11-23 22:11:14.939938+02
16	30	2	\N	2013-11-23 22:11:38.396085+02
19	30	2	\N	2013-11-24 10:30:59.830287+02
20	30	2	\N	2013-11-24 10:31:22.936737+02
21	30	2	\N	2013-11-24 10:38:08.07328+02
22	30	2	\N	2013-11-24 10:38:10.703187+02
23	30	2	\N	2013-11-24 10:38:11.896934+02
24	30	2	\N	2013-11-24 10:42:19.397852+02
25	30	2	\N	2013-11-24 10:42:50.772172+02
26	30	2	\N	2013-11-24 10:45:56.399572+02
27	30	2	\N	2013-11-24 10:48:29.950669+02
28	30	2	\N	2013-11-24 10:49:23.616693+02
29	30	2	\N	2013-11-24 10:50:05.878643+02
30	30	2	\N	2013-11-24 10:51:02.465585+02
31	30	2	\N	2013-11-24 10:54:21.011765+02
32	30	2	\N	2013-11-24 10:54:28.775552+02
33	30	2	\N	2013-11-24 10:58:34.152869+02
34	30	2	\N	2013-11-24 10:58:36.766104+02
35	30	2	\N	2013-11-24 10:58:38.767749+02
36	30	2	\N	2013-11-24 10:58:42.533162+02
37	30	2	\N	2013-11-24 10:58:43.55758+02
38	30	2	\N	2013-11-24 10:58:47.40587+02
39	30	2	\N	2013-11-24 11:00:56.130675+02
40	30	2	\N	2013-11-24 11:01:17.637578+02
41	30	2	\N	2013-11-24 11:01:20.639413+02
42	30	2	\N	2013-11-24 11:01:25.957588+02
43	30	2	\N	2013-11-24 11:01:28.015301+02
44	30	2	\N	2013-11-24 11:01:49.505153+02
45	30	2	\N	2013-11-24 11:01:54.465064+02
46	30	2	\N	2013-11-24 11:01:56.828797+02
47	30	2	\N	2013-11-24 11:02:00.873006+02
48	30	2	\N	2013-11-24 11:02:06.385907+02
49	30	2	\N	2013-11-24 11:02:08.474309+02
50	30	2	\N	2013-11-24 11:02:11.823259+02
51	30	2	\N	2013-11-24 11:02:15.084044+02
52	30	2	\N	2013-11-24 11:23:59.150304+02
53	30	2	\N	2013-11-24 12:41:22.004561+02
54	30	2	\N	2013-11-24 12:41:27.704243+02
55	30	2	\N	2013-11-24 12:41:32.588516+02
5430	1207	2	\N	2014-04-09 20:43:13.852066+03
5459	1227	2	\N	2014-04-19 13:04:24.512333+03
5467	1230	2	\N	2014-04-23 11:53:28.979784+03
5468	1230	2	\N	2014-04-23 11:53:45.572462+03
5537	1306	2	\N	2014-04-30 11:04:50.581045+03
66	16	2	\N	2013-11-30 12:57:27.26941+02
67	31	2	\N	2013-11-30 14:25:42.040654+02
68	32	2	\N	2013-11-30 14:27:55.708736+02
69	33	2	\N	2013-11-30 14:28:30.596329+02
70	34	2	\N	2013-11-30 14:29:07.205192+02
71	35	2	\N	2013-11-30 14:30:10.653134+02
72	36	2	\N	2013-11-30 14:31:39.751221+02
73	37	2	\N	2013-11-30 14:32:36.035677+02
74	38	2	\N	2013-11-30 14:55:27.691288+02
75	39	2	\N	2013-11-30 14:58:07.249714+02
76	40	2	\N	2013-11-30 14:58:34.364695+02
79	43	2	\N	2013-11-30 15:08:29.574538+02
80	43	2	\N	2013-11-30 15:08:52.114395+02
81	43	2	\N	2013-11-30 15:09:21.51485+02
82	44	2	\N	2013-11-30 15:09:54.961188+02
83	45	2	\N	2013-12-01 13:04:27.697583+02
84	45	2	\N	2013-12-01 13:04:40.716328+02
85	14	2	\N	2013-12-01 14:31:19.374571+02
87	12	2	\N	2013-12-01 18:21:35.266219+02
104	10	2	\N	2013-12-02 20:43:38.334769+02
130	10	2	\N	2013-12-06 21:10:25.807719+02
4796	769	2	\N	2014-01-22 22:21:45.451623+02
4820	16	2	\N	2014-02-01 21:09:43.821944+02
5408	1192	2	\N	2014-04-06 19:22:16.361504+03
5409	1005	2	\N	2014-04-06 19:22:18.74271+03
4822	784	2	\N	2014-02-01 21:23:07.460721+02
4823	786	2	\N	2014-02-01 21:23:12.871915+02
5410	1193	2	\N	2014-04-06 19:30:25.125445+03
5411	1194	2	\N	2014-04-06 19:30:51.85642+03
5412	1195	2	\N	2014-04-06 19:32:30.207073+03
5428	1205	2	\N	2014-04-09 19:17:37.483997+03
5431	1209	2	\N	2014-04-09 20:49:45.884539+03
4843	800	2	\N	2014-02-05 19:58:31.619612+02
4844	801	2	\N	2014-02-05 19:58:49.632624+02
4951	885	2	\N	2014-02-14 21:23:40.101298+02
4952	885	2	\N	2014-02-14 21:25:13.866935+02
4974	849	2	\N	2014-02-23 22:41:46.113064+02
4977	884	2	\N	2014-02-23 22:42:22.595852+02
5143	1003	2	\N	2014-03-04 21:05:09.565466+02
5144	1004	2	\N	2014-03-04 21:08:53.227171+02
5145	1005	2	\N	2014-03-04 21:09:15.542733+02
5471	1240	2	\N	2014-04-26 13:10:19.27836+03
5538	1307	2	\N	2014-04-30 11:08:33.655971+03
5544	1313	2	\N	2014-05-16 22:03:29.897662+03
361	274	2	\N	2013-12-14 17:16:08.962259+02
365	277	2	\N	2013-12-14 18:56:05.189747+02
366	278	2	\N	2013-12-14 18:56:17.77025+02
367	279	2	\N	2013-12-14 18:56:45.919492+02
368	280	2	\N	2013-12-14 19:10:07.617582+02
369	281	2	\N	2013-12-14 19:10:25.311427+02
370	281	2	\N	2013-12-14 19:10:59.35028+02
371	281	2	\N	2013-12-14 19:12:14.211139+02
372	282	2	\N	2013-12-14 19:14:22.861495+02
373	278	2	\N	2013-12-14 19:14:33.853691+02
374	282	2	\N	2013-12-14 19:14:41.964012+02
375	283	2	\N	2013-12-14 19:16:35.738242+02
4882	706	2	\N	2014-02-08 19:59:59.160282+02
377	283	2	\N	2013-12-14 19:18:21.622933+02
4953	886	2	\N	2014-02-14 21:25:53.089098+02
4978	893	2	\N	2014-02-24 11:11:03.613711+02
5147	1004	2	\N	2014-03-04 21:17:22.306545+02
5148	1004	2	\N	2014-03-04 21:23:04.343461+02
386	286	2	\N	2013-12-14 20:46:34.653533+02
387	287	2	\N	2013-12-14 20:46:47.37835+02
388	288	2	\N	2013-12-14 20:47:08.024243+02
389	289	2	\N	2013-12-14 20:47:28.256516+02
390	290	2	\N	2013-12-14 20:52:40.953492+02
391	291	2	\N	2013-12-14 20:53:08.057165+02
392	292	2	\N	2013-12-14 20:53:33.598708+02
5149	1004	2	\N	2014-03-04 21:23:17.093243+02
5150	1004	2	\N	2014-03-04 21:23:25.611509+02
4799	771	2	\N	2014-01-25 16:05:28.799345+02
4800	771	2	\N	2014-01-25 16:05:38.705799+02
4801	772	2	\N	2014-01-25 16:06:28.321244+02
4826	788	2	\N	2014-02-01 22:03:21.899916+02
5151	1004	2	\N	2014-03-04 21:23:52.466966+02
5152	1004	2	\N	2014-03-04 21:24:11.351815+02
5153	1004	2	\N	2014-03-04 21:24:20.614224+02
5429	1206	2	\N	2014-04-09 19:21:09.215561+03
5154	1004	2	\N	2014-03-04 21:35:47.600889+02
5155	1004	2	\N	2014-03-04 21:36:05.835492+02
5156	1004	2	\N	2014-03-04 21:36:16.322673+02
5432	1210	2	\N	2014-04-12 13:10:08.842351+03
5472	1241	2	\N	2014-04-26 19:16:28.009797+03
5539	1308	2	\N	2014-04-30 11:20:34.938154+03
5545	1314	2	\N	2014-05-17 13:42:16.369317+03
422	306	2	\N	2013-12-15 21:45:32.990838+02
4802	773	2	\N	2014-01-25 23:45:37.762081+02
4827	789	2	\N	2014-02-02 16:45:11.830435+02
4954	887	2	\N	2014-02-15 12:32:09.199652+02
5415	1198	2	\N	2014-04-08 09:35:59.21042+03
4979	885	2	\N	2014-02-24 12:50:26.694026+02
4980	786	2	\N	2014-02-24 12:50:29.953348+02
4981	784	2	\N	2014-02-24 12:50:33.322359+02
5157	1004	2	\N	2014-03-07 22:30:15.652582+02
5230	894	2	\N	2014-03-16 11:54:19.683752+02
5231	894	2	\N	2014-03-16 11:54:28.171778+02
5232	894	2	\N	2014-03-16 11:54:33.774318+02
5270	1004	2	\N	2014-03-17 10:50:39.781432+02
5465	1230	2	\N	2014-04-19 21:03:03.225866+03
5508	1277	2	\N	2014-04-29 10:08:17.485661+03
5509	1278	2	\N	2014-04-29 10:09:19.421905+03
5540	1309	2	\N	2014-04-30 11:32:51.070911+03
5547	1316	2	\N	2014-05-17 14:00:25.111543+03
4927	865	2	\N	2014-02-09 13:26:19.008763+02
4804	775	2	\N	2014-01-26 15:30:50.636495+02
4828	3	2	\N	2014-02-02 17:45:50.239397+02
5416	1199	2	\N	2014-04-08 10:15:32.411146+03
5434	1211	2	\N	2014-04-12 14:16:34.33498+03
5435	1211	2	\N	2014-04-12 14:16:53.40729+03
4982	895	2	\N	2014-02-25 19:06:42.158245+02
5158	1007	2	\N	2014-03-08 10:30:25.61786+02
5198	3	2	\N	2014-03-11 13:14:05.142514+02
5233	1060	2	\N	2014-03-16 12:26:38.52955+02
5437	1213	2	\N	2014-04-12 14:32:08.840037+03
5466	1227	2	\N	2014-04-19 21:37:55.580038+03
5474	1243	2	\N	2014-04-26 22:38:44.326007+03
5541	1310	2	\N	2014-04-30 22:45:27.579715+03
5548	1317	2	\N	2014-05-17 14:54:57.813145+03
5549	1318	2	\N	2014-05-17 15:24:32.954365+03
5550	1319	2	\N	2014-05-17 15:53:28.880817+03
5551	1320	2	\N	2014-05-17 15:53:34.139717+03
5552	1321	2	\N	2014-05-17 15:55:03.155317+03
5553	1322	2	\N	2014-05-17 15:55:07.534203+03
5557	1326	2	\N	2014-05-17 15:59:13.891973+03
5558	1327	2	\N	2014-05-17 15:59:17.045556+03
5559	1328	2	\N	2014-05-17 16:00:04.660539+03
5560	1329	2	\N	2014-05-17 16:00:08.901641+03
5561	1330	2	\N	2014-05-17 16:00:10.337355+03
5566	1335	2	\N	2014-05-17 16:02:19.447311+03
5570	1339	2	\N	2014-05-17 16:06:26.675372+03
5571	1340	2	\N	2014-05-17 16:06:28.503991+03
5572	1341	2	\N	2014-05-17 16:06:29.727144+03
5573	1342	2	\N	2014-05-17 16:06:31.81672+03
5574	1343	2	\N	2014-05-17 16:07:44.265465+03
5575	1344	2	\N	2014-05-17 16:07:45.972655+03
5576	1345	2	\N	2014-05-17 16:07:47.259172+03
5577	1346	2	\N	2014-05-17 16:07:49.146563+03
5581	1350	2	\N	2014-05-17 16:09:55.923893+03
5582	1351	2	\N	2014-05-17 16:13:13.017272+03
5583	1352	2	\N	2014-05-17 16:13:14.609527+03
5584	1353	2	\N	2014-05-17 16:13:16.568079+03
5585	1354	2	\N	2014-05-17 16:13:17.732756+03
5370	1159	2	\N	2014-04-02 19:52:15.193771+03
4888	786	2	\N	2014-02-08 21:26:45.138217+02
5417	1200	2	\N	2014-04-08 10:35:59.014802+03
4890	784	2	\N	2014-02-08 21:26:51.98617+02
4929	870	2	\N	2014-02-09 14:57:54.403714+02
4967	892	2	\N	2014-02-22 17:14:02.512772+02
4983	896	2	\N	2014-02-25 19:37:56.226615+02
4984	897	2	\N	2014-02-25 19:38:21.395798+02
4985	898	2	\N	2014-02-25 19:38:30.353048+02
4986	899	2	\N	2014-02-25 19:39:23.588225+02
4988	901	2	\N	2014-02-25 19:47:57.884012+02
5160	1009	2	\N	2014-03-08 10:49:52.0599+02
5199	3	2	\N	2014-03-12 12:05:31.953558+02
5438	1214	2	\N	2014-04-12 14:36:07.046988+03
5475	1244	2	\N	2014-04-26 22:39:00.40778+03
5542	1311	2	\N	2014-04-30 22:45:36.089534+03
5554	1323	2	\N	2014-05-17 15:55:54.008685+03
5555	1324	2	\N	2014-05-17 15:56:55.63522+03
5556	1325	2	\N	2014-05-17 15:58:29.508912+03
5562	1331	2	\N	2014-05-17 16:00:49.21287+03
5563	1332	2	\N	2014-05-17 16:01:46.175183+03
5564	1333	2	\N	2014-05-17 16:01:47.950656+03
5565	1334	2	\N	2014-05-17 16:01:48.837764+03
5567	1336	2	\N	2014-05-17 16:03:41.796945+03
5568	1337	2	\N	2014-05-17 16:04:32.839289+03
5569	1338	2	\N	2014-05-17 16:04:34.363533+03
5578	1347	2	\N	2014-05-17 16:08:39.18466+03
5579	1348	2	\N	2014-05-17 16:08:56.863828+03
5580	1349	2	\N	2014-05-17 16:08:58.291349+03
4894	849	2	\N	2014-02-08 21:32:14.802948+02
4896	851	2	\N	2014-02-08 21:32:32.471247+02
4897	852	2	\N	2014-02-08 21:36:44.493917+02
4930	871	2	\N	2014-02-09 16:04:05.85568+02
4968	892	2	\N	2014-02-22 17:18:17.771894+02
5161	1009	2	\N	2014-03-08 10:52:32.854366+02
5162	1009	2	\N	2014-03-08 10:52:45.635015+02
5163	1009	2	\N	2014-03-08 10:52:53.515357+02
5164	1009	2	\N	2014-03-08 10:52:58.740536+02
5165	1010	2	\N	2014-03-08 10:54:40.946487+02
5166	1010	2	\N	2014-03-08 10:54:50.928085+02
5200	3	2	\N	2014-03-12 12:14:05.203771+02
5235	897	2	\N	2014-03-16 12:53:37.56753+02
5278	1067	2	\N	2014-03-18 19:51:01.87448+02
5375	1164	2	\N	2014-04-02 20:56:42.084197+03
5376	1165	2	\N	2014-04-02 20:56:48.393173+03
5419	1201	2	\N	2014-04-08 10:38:31.154572+03
5440	1214	2	\N	2014-04-12 14:39:05.532456+03
5442	1214	2	\N	2014-04-12 14:43:11.754556+03
5513	1282	2	\N	2014-04-29 10:43:05.718429+03
5586	1355	2	\N	2014-05-17 16:14:39.7443+03
5587	1356	2	\N	2014-05-17 16:14:41.182697+03
5588	1357	2	\N	2014-05-17 16:14:43.239633+03
5590	1359	2	\N	2014-05-17 16:15:43.442935+03
5591	1360	2	\N	2014-05-17 16:15:45.790483+03
5596	1365	2	\N	2014-05-17 16:20:21.389915+03
5597	1366	2	\N	2014-05-17 16:20:22.473385+03
5598	1367	2	\N	2014-05-17 16:20:23.843632+03
4898	853	2	\N	2014-02-08 21:39:09.10029+02
4812	784	2	\N	2014-01-26 21:12:24.209136+02
4813	784	2	\N	2014-01-26 21:13:10.546575+02
4814	784	2	\N	2014-01-26 21:13:20.058093+02
4815	784	2	\N	2014-01-26 21:13:24.693933+02
4817	786	2	\N	2014-01-26 21:15:00.370561+02
4818	784	2	\N	2014-01-26 21:20:14.635984+02
4819	784	2	\N	2014-01-26 21:20:34.941868+02
4931	274	2	\N	2014-02-10 08:49:31.501202+02
4969	893	2	\N	2014-02-22 17:26:37.296722+02
4970	894	2	\N	2014-02-22 17:27:40.771678+02
4991	903	2	\N	2014-02-25 22:43:46.101171+02
4992	904	2	\N	2014-02-25 22:43:53.30222+02
4993	905	2	\N	2014-02-25 22:44:00.024066+02
4994	906	2	\N	2014-02-25 22:44:13.035203+02
4995	907	2	\N	2014-02-25 22:44:59.159297+02
5167	1009	2	\N	2014-03-08 10:57:02.535973+02
5168	1010	2	\N	2014-03-08 10:57:07.365849+02
5201	3	2	\N	2014-03-12 12:29:57.686858+02
5202	3	2	\N	2014-03-12 12:30:07.270368+02
5203	3	2	\N	2014-03-12 12:30:09.982217+02
5204	3	2	\N	2014-03-12 12:32:22.25189+02
5205	894	2	\N	2014-03-12 12:32:26.366205+02
5236	919	2	\N	2014-03-16 13:33:07.651832+02
5444	1218	2	\N	2014-04-12 15:00:38.646853+03
5447	1214	2	\N	2014-04-12 15:02:33.59771+03
5514	1283	2	\N	2014-04-29 12:06:08.689068+03
5515	1284	2	\N	2014-04-29 12:07:06.357367+03
5518	1287	2	\N	2014-04-29 12:09:55.486785+03
5520	1289	2	\N	2014-04-29 12:11:36.874588+03
5589	1358	2	\N	2014-05-17 16:15:09.836615+03
5592	1361	2	\N	2014-05-17 16:16:33.155307+03
5593	1362	2	\N	2014-05-17 16:16:42.585648+03
5594	1363	2	\N	2014-05-17 16:18:45.312153+03
5595	1364	2	\N	2014-05-17 16:18:46.752544+03
4932	872	2	\N	2014-02-10 14:29:53.759164+02
4996	908	2	\N	2014-02-25 23:15:44.304324+02
4997	909	2	\N	2014-02-25 23:16:53.455486+02
5000	912	2	\N	2014-02-25 23:21:05.038132+02
5001	913	2	\N	2014-02-25 23:21:10.720503+02
5002	914	2	\N	2014-02-25 23:21:15.803027+02
5003	915	2	\N	2014-02-25 23:21:21.245593+02
5004	916	2	\N	2014-02-25 23:21:27.843749+02
5005	917	2	\N	2014-02-25 23:21:40.705852+02
5006	918	2	\N	2014-02-25 23:21:45.161533+02
5007	918	2	\N	2014-02-25 23:21:53.74917+02
5008	918	2	\N	2014-02-25 23:21:57.599668+02
5009	919	2	\N	2014-02-25 23:22:22.789803+02
5011	921	2	\N	2014-02-25 23:22:59.534922+02
5012	922	2	\N	2014-02-25 23:23:04.765473+02
5013	923	2	\N	2014-02-25 23:23:16.649188+02
5014	924	2	\N	2014-02-25 23:23:30.151925+02
5015	925	2	\N	2014-02-25 23:25:11.120354+02
5016	926	2	\N	2014-02-25 23:26:11.314153+02
5017	927	2	\N	2014-02-25 23:26:34.378644+02
5018	928	2	\N	2014-02-25 23:26:49.163639+02
5019	929	2	\N	2014-02-25 23:27:07.84413+02
5020	930	2	\N	2014-02-25 23:27:30.797684+02
5021	931	2	\N	2014-02-25 23:27:45.611037+02
5022	932	2	\N	2014-02-25 23:28:05.678992+02
5023	933	2	\N	2014-02-25 23:28:21.001129+02
5025	935	2	\N	2014-02-25 23:28:49.565248+02
5026	936	2	\N	2014-02-25 23:29:05.034117+02
5027	937	2	\N	2014-02-25 23:29:16.11101+02
5028	938	2	\N	2014-02-25 23:29:28.82178+02
5029	939	2	\N	2014-02-25 23:29:41.159219+02
5030	940	2	\N	2014-02-25 23:29:57.589154+02
5031	941	2	\N	2014-02-25 23:30:12.260571+02
5032	942	2	\N	2014-02-25 23:30:25.705958+02
5033	943	2	\N	2014-02-25 23:30:39.278491+02
5034	944	2	\N	2014-02-25 23:30:54.230938+02
5035	945	2	\N	2014-02-25 23:31:08.136642+02
5036	946	2	\N	2014-02-25 23:31:21.084682+02
5037	947	2	\N	2014-02-25 23:31:35.443235+02
5038	948	2	\N	2014-02-25 23:31:50.036032+02
5039	949	2	\N	2014-02-25 23:32:16.232207+02
5040	950	2	\N	2014-02-25 23:32:51.784126+02
5169	1011	2	\N	2014-03-08 15:10:44.638516+02
5206	3	2	\N	2014-03-12 13:00:24.217557+02
5207	3	2	\N	2014-03-12 13:00:34.025605+02
5238	1062	2	\N	2014-03-16 15:10:44.294343+02
5239	1062	2	\N	2014-03-16 15:11:01.269428+02
5240	858	2	\N	2014-03-16 15:11:06.875279+02
5241	903	2	\N	2014-03-16 15:12:25.130202+02
5379	1168	2	\N	2014-04-03 12:39:52.988369+03
5380	1169	2	\N	2014-04-03 12:49:06.139328+03
5448	1221	2	\N	2014-04-12 16:44:14.810824+03
5516	1285	2	\N	2014-04-29 12:08:23.116251+03
5517	1286	2	\N	2014-04-29 12:09:10.712444+03
5522	1291	2	\N	2014-04-29 12:13:37.203069+03
5523	1292	2	\N	2014-04-29 12:14:34.180203+03
4900	854	2	\N	2014-02-08 21:47:34.439997+02
4901	855	2	\N	2014-02-08 21:54:55.399628+02
4936	875	2	\N	2014-02-10 15:58:53.177719+02
4937	875	2	\N	2014-02-10 15:59:03.43204+02
5042	952	2	\N	2014-02-25 23:33:14.57009+02
5043	939	2	\N	2014-02-25 23:33:37.281163+02
5044	938	2	\N	2014-02-25 23:33:44.033176+02
5045	937	2	\N	2014-02-25 23:33:51.697991+02
5046	936	2	\N	2014-02-25 23:33:56.981908+02
5047	935	2	\N	2014-02-25 23:34:03.037741+02
5049	933	2	\N	2014-02-25 23:34:27.937885+02
5050	932	2	\N	2014-02-25 23:34:34.767736+02
5051	931	2	\N	2014-02-25 23:34:39.075165+02
5052	930	2	\N	2014-02-25 23:34:43.896812+02
5053	929	2	\N	2014-02-25 23:34:48.70472+02
5054	928	2	\N	2014-02-25 23:34:54.494127+02
5055	927	2	\N	2014-02-25 23:35:00.125101+02
5056	926	2	\N	2014-02-25 23:35:05.399995+02
5057	925	2	\N	2014-02-25 23:35:10.409443+02
5058	924	2	\N	2014-02-25 23:35:16.447517+02
5059	923	2	\N	2014-02-25 23:35:21.959285+02
5060	922	2	\N	2014-02-25 23:35:27.383937+02
5061	921	2	\N	2014-02-25 23:35:31.660307+02
5063	919	2	\N	2014-02-25 23:35:43.645366+02
5064	918	2	\N	2014-02-25 23:35:47.480218+02
5065	917	2	\N	2014-02-25 23:35:52.042922+02
5066	916	2	\N	2014-02-25 23:35:57.409224+02
5067	915	2	\N	2014-02-25 23:36:01.802966+02
5068	914	2	\N	2014-02-25 23:36:05.670476+02
5069	913	2	\N	2014-02-25 23:36:10.129284+02
5070	912	2	\N	2014-02-25 23:36:14.468359+02
5208	1040	2	\N	2014-03-12 20:50:33.871251+02
5209	1041	2	\N	2014-03-12 20:50:55.466763+02
5210	1041	2	\N	2014-03-12 20:51:02.123714+02
5211	1042	2	\N	2014-03-12 20:53:03.003465+02
5212	1043	2	\N	2014-03-12 20:53:27.910983+02
5213	1044	2	\N	2014-03-12 20:53:45.921718+02
5214	1045	2	\N	2014-03-12 20:54:23.054095+02
5215	1046	2	\N	2014-03-12 20:55:03.071619+02
5286	1078	2	\N	2014-03-20 21:22:51.030666+02
5381	1170	2	\N	2014-04-03 12:49:07.793292+03
5519	1288	2	\N	2014-04-29 12:10:21.572462+03
5521	1290	2	\N	2014-04-29 12:13:35.434847+03
5603	1372	2	\N	2014-05-17 18:47:30.594446+03
5606	1375	2	\N	2014-05-17 18:55:21.896666+03
5613	1382	2	\N	2014-05-17 19:04:51.767284+03
5619	1388	2	\N	2014-05-17 19:09:44.578209+03
5622	1391	2	\N	2014-05-17 19:12:29.996417+03
4902	856	2	\N	2014-02-08 21:59:04.719245+02
4938	876	2	\N	2014-02-10 16:19:24.400952+02
5071	953	2	\N	2014-02-26 23:25:15.548581+02
5072	954	2	\N	2014-02-26 23:25:55.407709+02
5075	957	2	\N	2014-02-26 23:28:34.003373+02
5076	958	2	\N	2014-02-26 23:28:45.594179+02
5077	959	2	\N	2014-02-26 23:28:57.004231+02
5078	960	2	\N	2014-02-26 23:29:08.086342+02
5079	961	2	\N	2014-02-26 23:29:17.646283+02
5080	962	2	\N	2014-02-26 23:29:26.175631+02
5081	963	2	\N	2014-02-26 23:29:35.761623+02
5082	964	2	\N	2014-02-26 23:29:46.892804+02
5083	965	2	\N	2014-02-26 23:29:54.140342+02
5084	966	2	\N	2014-02-26 23:30:01.375033+02
5085	967	2	\N	2014-02-26 23:30:08.774222+02
5086	968	2	\N	2014-02-26 23:30:17.802323+02
5087	969	2	\N	2014-02-26 23:30:29.097872+02
5088	970	2	\N	2014-02-26 23:30:38.081009+02
5089	971	2	\N	2014-02-26 23:30:52.902609+02
5091	973	2	\N	2014-02-26 23:31:31.71567+02
5093	975	2	\N	2014-02-26 23:32:13.646357+02
5094	976	2	\N	2014-02-26 23:32:24.624636+02
5095	977	2	\N	2014-02-26 23:32:34.606814+02
5096	978	2	\N	2014-02-26 23:32:43.318943+02
5097	979	2	\N	2014-02-26 23:32:54.081989+02
5098	980	2	\N	2014-02-26 23:33:04.823892+02
5099	981	2	\N	2014-02-26 23:33:16.574818+02
5100	982	2	\N	2014-02-26 23:33:28.270884+02
5101	983	2	\N	2014-02-26 23:33:40.854578+02
5102	984	2	\N	2014-02-26 23:33:57.05943+02
5103	985	2	\N	2014-02-26 23:34:08.238483+02
5105	987	2	\N	2014-02-26 23:34:29.757456+02
5106	988	2	\N	2014-02-26 23:34:37.99873+02
5216	3	2	\N	2014-03-12 21:55:10.706584+02
5287	1079	2	\N	2014-03-22 12:57:07.526655+02
5480	1249	2	\N	2014-04-27 01:02:16.23036+03
5481	1250	2	\N	2014-04-27 01:02:43.699513+03
5482	1251	2	\N	2014-04-27 01:03:00.011092+03
5483	1252	2	\N	2014-04-27 01:03:22.219667+03
5524	1293	2	\N	2014-04-29 12:17:51.658135+03
5525	1294	2	\N	2014-04-29 12:18:27.913053+03
5601	1370	2	\N	2014-05-17 18:45:54.451262+03
5602	1371	2	\N	2014-05-17 18:47:17.628356+03
5604	1373	2	\N	2014-05-17 18:54:01.477094+03
5607	1376	2	\N	2014-05-17 18:56:40.07768+03
5609	1378	2	\N	2014-05-17 19:02:40.402053+03
5616	1385	2	\N	2014-05-17 19:07:13.667811+03
5617	1386	2	\N	2014-05-17 19:07:36.068126+03
5621	1390	2	\N	2014-05-17 19:11:55.084234+03
4789	763	2	\N	2014-01-12 19:51:49.157909+02
4903	854	2	\N	2014-02-08 22:16:58.906498+02
4904	3	2	\N	2014-02-08 22:17:06.939369+02
4905	854	2	\N	2014-02-08 22:20:32.280238+02
4906	784	2	\N	2014-02-08 22:21:01.290541+02
4908	786	2	\N	2014-02-08 22:21:09.110319+02
5484	1253	2	\N	2014-04-28 00:03:49.599015+03
5289	1081	2	\N	2014-03-22 17:57:05.076581+02
5605	1374	2	\N	2014-05-17 18:55:03.070735+03
5611	1380	2	\N	2014-05-17 19:03:57.212913+03
5614	1383	2	\N	2014-05-17 19:04:59.867959+03
5618	1387	2	\N	2014-05-17 19:09:22.594353+03
5624	1393	2	\N	2014-05-18 10:14:28.009945+03
4790	764	2	\N	2014-01-12 20:33:53.3138+02
4909	723	2	\N	2014-02-08 22:28:37.868751+02
4940	878	2	\N	2014-02-10 16:40:47.442615+02
5610	1379	2	\N	2014-05-17 19:03:38.443538+03
5612	1381	2	\N	2014-05-17 19:04:17.238286+03
5615	1384	2	\N	2014-05-17 19:07:10.869783+03
5620	1389	2	\N	2014-05-17 19:09:47.55779+03
4910	857	2	\N	2014-02-09 00:41:07.487567+02
4911	858	2	\N	2014-02-09 00:41:26.234037+02
4912	859	2	\N	2014-02-09 00:41:48.428505+02
4913	860	2	\N	2014-02-09 00:42:12.938208+02
4914	857	2	\N	2014-02-09 00:42:31.066281+02
4915	861	2	\N	2014-02-09 00:42:52.234296+02
5291	1088	2	\N	2014-03-22 18:51:18.985681+02
5292	1081	2	\N	2014-03-22 18:51:44.158872+02
5458	1225	2	\N	2014-04-13 12:01:26.796233+03
5627	1396	2	\N	2014-05-18 11:58:47.293591+03
4917	764	2	\N	2014-02-09 00:53:58.264629+02
4918	769	2	\N	2014-02-09 00:57:04.796409+02
4919	775	2	\N	2014-02-09 00:57:24.917548+02
4920	788	2	\N	2014-02-09 00:57:42.02056+02
4942	878	2	\N	2014-02-10 22:47:18.374976+02
4943	880	2	\N	2014-02-10 22:48:37.279277+02
4944	881	2	\N	2014-02-10 22:49:24.829434+02
4945	882	2	\N	2014-02-10 22:49:56.066237+02
4946	883	2	\N	2014-02-10 22:50:06.121122+02
4947	884	2	\N	2014-02-10 22:50:26.035905+02
4948	884	2	\N	2014-02-10 22:53:06.689693+02
5294	1090	2	\N	2014-03-22 20:34:50.666418+02
5295	1091	2	\N	2014-03-22 20:36:11.95663+02
5298	1093	2	\N	2014-03-22 20:40:16.040605+02
5629	1398	2	\N	2014-05-18 12:12:21.975254+03
4949	764	2	\N	2014-02-11 19:47:14.055452+02
5488	1257	2	\N	2014-04-28 12:34:34.363475+03
5300	1095	2	\N	2014-03-22 20:52:34.596466+02
5301	1096	2	\N	2014-03-22 20:52:44.740475+02
5302	1097	2	\N	2014-03-22 20:53:03.099066+02
5489	1258	2	\N	2014-04-28 12:34:55.433659+03
5304	1099	2	\N	2014-03-22 20:57:07.889521+02
5535	1304	2	\N	2014-04-29 16:15:23.221696+03
5389	1178	2	\N	2014-04-05 19:40:06.274566+03
5390	1179	2	\N	2014-04-05 19:40:10.823684+03
5490	1259	2	\N	2014-04-28 12:58:44.196537+03
5305	1100	2	\N	2014-03-22 21:00:41.76813+02
5306	1101	2	\N	2014-03-22 21:00:48.529148+02
5307	1102	2	\N	2014-03-22 21:01:34.517288+02
5491	1260	2	\N	2014-04-28 12:59:00.104464+03
5631	1400	2	\N	2014-05-18 13:37:21.801854+03
5632	1401	2	\N	2014-05-18 13:37:41.402585+03
5633	1402	2	\N	2014-05-18 13:44:45.628784+03
5492	1261	2	\N	2014-04-28 13:04:58.29173+03
5634	1403	2	\N	2014-05-18 15:48:34.956287+03
5256	1067	2	\N	2014-03-16 19:34:31.935568+02
5494	1263	2	\N	2014-04-28 13:08:06.602496+03
5635	1404	2	\N	2014-05-18 19:18:07.615122+03
5636	1406	2	\N	2014-05-18 19:18:56.831097+03
5639	1409	2	\N	2014-05-18 19:22:05.971396+03
5394	1185	2	\N	2014-04-05 20:56:20.797318+03
5257	1067	2	\N	2014-03-16 19:55:56.894484+02
5495	1264	2	\N	2014-04-28 13:08:25.610345+03
5637	1407	2	\N	2014-05-18 19:19:36.399614+03
5641	1411	2	\N	2014-05-18 19:23:45.119721+03
5496	1265	2	\N	2014-04-28 13:08:54.519921+03
5638	1408	2	\N	2014-05-18 19:19:43.401474+03
5258	1067	2	\N	2014-03-16 20:09:16.532934+02
5311	1097	2	\N	2014-03-24 19:59:44.290142+02
5640	1410	2	\N	2014-05-18 19:23:00.415796+03
5643	1413	2	\N	2014-05-20 21:26:27.311927+03
5259	1068	2	\N	2014-03-16 20:15:31.769185+02
5499	1268	2	\N	2014-04-28 23:55:09.591646+03
5644	1414	2	\N	2014-05-24 17:02:57.354915+03
5645	1415	2	\N	2014-05-24 17:03:02.922541+03
5646	1416	2	\N	2014-05-24 17:06:48.542492+03
5647	1417	2	\N	2014-05-24 17:06:51.402853+03
5648	1418	2	\N	2014-05-24 17:07:25.101929+03
5649	1419	2	\N	2014-05-24 17:07:29.075778+03
5650	1420	2	\N	2014-05-24 17:24:17.546972+03
4120	16	2	\N	2014-01-01 13:19:09.979922+02
4131	14	2	\N	2014-01-01 18:45:07.902745+02
4144	706	2	\N	2014-01-03 16:12:41.015146+02
4145	706	2	\N	2014-01-03 16:13:23.197097+02
5402	1189	2	\N	2014-04-06 18:46:40.132797+03
5403	1190	2	\N	2014-04-06 18:47:22.030146+03
5138	865	2	\N	2014-03-03 21:09:34.254642+02
5404	1191	2	\N	2014-04-06 18:53:34.002074+03
5263	1009	2	\N	2014-03-16 21:40:10.728496+02
5264	1009	2	\N	2014-03-16 21:44:11.742442+02
5405	1192	2	\N	2014-04-06 19:20:55.890208+03
5140	865	2	\N	2014-03-03 21:57:11.59945+02
5265	1004	2	\N	2014-03-17 10:29:17.115979+02
5266	1004	2	\N	2014-03-17 10:29:24.701637+02
4744	723	2	\N	2014-01-04 23:58:55.624453+02
4746	725	2	\N	2014-01-05 01:09:00.405742+02
4747	726	2	\N	2014-01-05 01:09:15.602018+02
4749	728	2	\N	2014-01-05 01:13:50.125212+02
4756	734	2	\N	2014-01-05 12:36:48.48575+02
4765	743	2	\N	2014-01-05 13:20:17.173661+02
5654	1424	2	\N	2014-06-01 10:25:44.71461+03
5656	1426	2	\N	2014-06-01 12:15:53.295347+03
5661	1431	2	\N	2014-06-07 15:12:11.693366+03
5662	1432	2	\N	2014-06-07 15:12:40.323386+03
5663	1433	2	\N	2014-06-07 17:43:14.620483+03
5665	1435	2	\N	2014-06-07 21:01:18.691193+03
5667	1438	2	\N	2014-06-07 21:11:01.089928+03
5668	1439	2	\N	2014-06-07 21:11:46.797584+03
5669	1440	2	\N	2014-06-07 22:15:09.567299+03
5671	1442	2	\N	2014-06-07 22:16:04.586659+03
5676	1447	2	\N	2014-06-08 21:25:14.638119+03
5677	1448	2	\N	2014-06-08 21:25:35.09515+03
5679	1450	2	\N	2014-06-09 15:50:23.760428+03
5681	1452	2	\N	2014-06-09 17:20:44.311452+03
5693	1464	2	\N	2014-06-14 17:55:00.252916+03
5694	1465	2	\N	2014-06-14 17:55:08.213215+03
5695	1467	2	\N	2014-06-14 17:56:52.935007+03
5696	1468	2	\N	2014-06-14 17:58:15.339465+03
5697	1469	2	\N	2014-06-14 17:58:37.034547+03
5698	1470	2	\N	2014-06-14 18:00:56.71432+03
5699	1471	2	\N	2014-06-14 18:02:10.63169+03
5700	1472	2	\N	2014-06-14 18:02:54.98084+03
5701	1473	2	\N	2014-06-14 18:03:27.411198+03
5713	1485	2	\N	2014-06-15 15:17:28.256792+03
5715	1487	2	\N	2014-06-16 14:42:17.062016+03
5728	1500	2	\N	2014-06-18 16:59:05.631362+03
5730	1502	2	\N	2014-06-22 19:40:05.464875+03
5731	1503	2	\N	2014-06-22 19:40:20.79663+03
5732	1504	2	\N	2014-06-22 19:42:44.939368+03
5733	1505	2	\N	2014-06-22 19:43:05.103699+03
5734	1506	2	\N	2014-06-22 19:43:23.157992+03
5735	1507	2	\N	2014-06-22 19:46:21.388635+03
5737	1509	2	\N	2014-06-22 21:15:50.586549+03
5738	1510	2	\N	2014-06-24 20:30:44.36129+03
5739	1511	2	\N	2014-06-25 19:21:08.001771+03
5740	1512	2	\N	2014-06-25 19:37:43.544622+03
5741	1513	2	\N	2014-06-25 19:38:23.293423+03
5742	1514	2	\N	2014-06-25 19:38:46.712804+03
5743	1515	2	\N	2014-06-25 19:39:14.757449+03
5744	1516	2	\N	2014-06-25 20:37:42.602785+03
5745	1517	2	\N	2014-06-25 20:54:09.96009+03
5746	1518	2	\N	2014-06-25 20:54:50.943042+03
5747	1519	2	\N	2014-06-25 20:55:06.988343+03
5749	1521	2	\N	2014-06-26 21:02:19.488826+03
5750	1535	2	\N	2014-06-28 17:17:15.295903+03
5751	1536	2	\N	2014-06-28 17:31:39.626186+03
5752	1537	2	\N	2014-06-28 20:56:05.816704+03
5753	1538	2	\N	2014-06-28 20:57:41.600837+03
5754	1539	2	\N	2014-06-28 20:59:59.522314+03
5755	1540	2	\N	2014-06-28 21:00:26.365557+03
5756	1541	2	\N	2014-06-28 21:00:51.086753+03
5757	1542	2	\N	2014-06-28 21:18:20.602573+03
5758	1543	2	\N	2014-06-28 21:25:57.336069+03
5759	1544	2	\N	2014-06-28 21:26:14.894807+03
5760	1545	2	\N	2014-06-28 21:26:35.413657+03
5761	1546	2	\N	2014-07-02 23:01:03.321441+03
5762	1547	2	\N	2014-07-02 23:03:30.755887+03
5763	1548	2	\N	2014-07-26 18:07:46.336433+03
5764	1549	2	\N	2014-08-16 20:09:11.73959+03
5766	1551	2	\N	2014-08-16 20:23:59.980051+03
5767	1552	2	\N	2014-08-16 20:24:12.305446+03
5768	1553	2	\N	2014-08-16 20:24:15.930016+03
5769	1554	2	\N	2014-08-16 20:25:09.403552+03
5771	1556	2	\N	2014-08-16 20:51:19.103778+03
5773	1559	2	\N	2014-08-16 21:13:14.302214+03
5774	1560	2	\N	2014-08-16 21:13:18.107616+03
5775	1561	2	\N	2014-08-16 21:22:35.752473+03
5776	1562	2	\N	2014-08-16 21:23:02.397566+03
5777	1563	2	\N	2014-08-16 21:23:05.499294+03
5778	1564	2	\N	2014-08-16 21:24:08.813965+03
5783	1569	2	\N	2014-08-17 11:07:53.713228+03
5784	1570	2	\N	2014-08-17 11:09:10.292392+03
5790	1576	2	\N	2014-08-22 22:48:58.176695+03
5791	1577	2	\N	2014-08-22 22:49:31.584667+03
5792	1578	2	\N	2014-08-22 22:49:35.101959+03
5793	1579	2	\N	2014-08-22 22:50:20.197271+03
5794	1580	2	\N	2014-08-22 22:50:49.188036+03
5795	1581	2	\N	2014-08-22 22:51:29.357367+03
5796	1582	2	\N	2014-08-22 22:52:03.171722+03
5797	1584	2	\N	2014-08-22 22:58:38.326467+03
5798	1585	2	\N	2014-08-22 22:59:28.534906+03
5799	1586	2	\N	2014-08-22 22:59:41.71816+03
5800	1587	2	\N	2014-08-22 23:01:39.676197+03
5801	1588	2	\N	2014-08-22 23:02:11.872661+03
5802	1589	2	\N	2014-08-22 23:04:10.670971+03
5803	1590	2	\N	2014-08-22 23:04:40.181387+03
5804	1591	2	\N	2014-08-22 23:05:46.128053+03
5805	1592	2	\N	2014-08-22 23:06:07.780481+03
5806	1593	2	\N	2014-08-22 23:06:12.342153+03
5810	1597	2	\N	2014-08-22 23:14:17.280337+03
5811	1598	2	\N	2014-08-22 23:35:58.491964+03
5820	1607	2	\N	2014-08-23 13:37:30.044239+03
5821	1608	2	\N	2014-08-23 16:14:22.910225+03
5822	1609	2	\N	2014-08-23 16:16:24.823791+03
5823	1610	2	\N	2014-08-24 14:10:51.002759+03
5824	1611	2	\N	2014-08-24 14:11:19.783792+03
5825	1612	2	\N	2014-08-24 14:11:36.729128+03
5826	1613	2	\N	2014-08-24 14:11:54.849623+03
5827	1614	2	\N	2014-08-24 14:48:54.04485+03
5828	1615	2	\N	2014-08-24 14:48:55.715304+03
5829	1616	2	\N	2014-08-24 14:49:59.373945+03
5832	1619	2	\N	2014-08-24 15:01:16.140346+03
5833	1620	2	\N	2014-08-24 15:02:15.884894+03
5834	1621	2	\N	2014-08-24 15:02:43.162974+03
5835	1622	2	\N	2014-08-24 15:03:06.67481+03
5836	1623	2	\N	2014-08-24 15:03:53.276198+03
5837	1624	2	\N	2014-08-24 15:08:02.737031+03
5838	1625	2	\N	2014-08-24 15:08:18.61161+03
5839	1626	2	\N	2014-08-24 15:08:29.0077+03
5840	1627	2	\N	2014-08-24 15:10:13.736496+03
5841	1628	2	\N	2014-08-24 15:10:44.233145+03
5847	1634	2	\N	2014-08-24 15:21:09.48427+03
5852	1639	2	\N	2014-08-25 15:20:24.884947+03
5853	1640	2	\N	2014-08-26 19:55:53.569882+03
5854	1641	2	\N	2014-08-26 19:56:28.320221+03
5858	1645	2	\N	2014-08-26 20:01:19.187139+03
5860	1647	2	\N	2014-08-26 20:04:08.078366+03
5862	1649	2	\N	2014-08-26 20:04:48.124422+03
5855	1642	2	\N	2014-08-26 19:56:46.695581+03
5856	1643	2	\N	2014-08-26 19:57:13.160198+03
5857	1644	2	\N	2014-08-26 20:01:16.129984+03
5859	1646	2	\N	2014-08-26 20:04:06.105786+03
5861	1648	2	\N	2014-08-26 20:04:09.378364+03
5863	1650	2	\N	2014-08-26 20:06:13.193356+03
5864	1651	2	\N	2014-08-26 20:06:36.249641+03
5865	1652	2	\N	2014-08-26 20:07:23.412381+03
5866	1653	2	\N	2014-08-26 20:07:31.899383+03
5870	1657	2	\N	2014-08-26 20:13:28.887297+03
5873	1660	2	\N	2014-08-31 16:37:37.888486+03
5919	1714	2	\N	2014-09-14 13:27:15.677766+03
5926	1721	2	\N	2014-09-14 14:49:51.512979+03
5967	1764	2	\N	2014-09-14 21:51:09.963908+03
5968	1766	2	\N	2014-09-28 17:08:27.946698+03
5971	1769	2	\N	2014-10-01 20:37:18.107894+03
5972	1771	2	\N	2014-10-01 21:39:17.299667+03
5973	1773	2	\N	2014-10-01 22:04:03.074823+03
5974	1774	2	\N	2014-10-01 22:17:44.949656+03
5975	1775	2	\N	2014-10-03 20:21:54.06353+03
5977	1777	2	\N	2014-10-03 20:35:01.628264+03
5978	1778	2	\N	2014-10-04 21:45:17.702702+03
5980	1780	2	\N	2014-10-05 12:49:28.270538+03
5982	1797	2	\N	2014-10-05 21:08:02.025119+03
5983	1798	2	\N	2014-10-05 22:07:40.176836+03
5984	1799	2	\N	2014-10-09 20:49:57.476724+03
5985	1800	2	\N	2014-10-09 21:44:48.304991+03
5986	1801	2	\N	2014-10-09 21:45:57.042916+03
5987	1802	2	\N	2014-10-09 21:51:36.274928+03
5988	1797	2	\N	2014-10-09 21:58:44.274487+03
5989	1803	2	\N	2014-10-10 21:20:08.467997+03
5990	1804	2	\N	2014-10-10 21:48:32.795064+03
5991	1797	2	\N	2014-10-10 21:48:40.224687+03
5994	1797	2	\N	2014-10-10 22:43:03.886027+03
5995	1807	2	\N	2014-10-12 12:18:58.609492+03
5996	1419	2	\N	2014-10-12 12:21:41.297126+03
5999	1419	2	\N	2014-10-12 14:03:13.921521+03
6000	1419	2	\N	2014-10-12 14:03:56.458732+03
6002	1797	2	\N	2014-10-12 14:08:19.225786+03
6003	1797	2	\N	2014-10-12 14:08:29.322661+03
6005	1797	2	\N	2014-10-12 14:09:47.667654+03
6006	1797	2	\N	2014-10-12 14:10:15.511498+03
6008	894	2	\N	2014-10-12 14:15:30.839116+03
6010	894	2	\N	2014-10-12 14:15:50.178579+03
6011	894	2	\N	2014-10-12 14:16:00.712168+03
6014	1507	2	\N	2014-10-12 14:21:53.792753+03
6015	1507	2	\N	2014-10-12 14:22:06.118134+03
6016	1439	2	\N	2014-10-12 14:22:17.008412+03
6017	1438	2	\N	2014-10-12 14:22:21.965321+03
6020	1780	2	\N	2014-10-12 14:25:19.014258+03
6021	1780	2	\N	2014-10-12 14:25:28.403238+03
6022	1780	2	\N	2014-10-12 14:25:37.930302+03
6025	1413	2	\N	2014-10-12 14:31:06.237149+03
6026	1413	2	\N	2014-10-12 14:31:16.507549+03
6029	1415	2	\N	2014-10-12 14:34:22.672887+03
6030	1415	2	\N	2014-10-12 14:34:32.05391+03
6043	1657	2	\N	2014-10-12 15:41:58.778177+03
6045	1657	2	\N	2014-10-12 15:42:13.36551+03
6046	1657	2	\N	2014-10-12 15:42:24.726059+03
6050	1653	2	\N	2014-10-12 16:27:20.425954+03
6051	1653	2	\N	2014-10-12 16:27:45.783221+03
6053	1283	2	\N	2014-10-12 16:28:08.925372+03
6054	1283	2	\N	2014-10-12 16:28:17.376186+03
6055	1833	2	\N	2014-10-12 16:29:10.045595+03
6056	784	2	\N	2014-10-12 16:29:11.936722+03
6061	1542	2	\N	2014-10-12 17:31:06.178463+03
6063	861	2	\N	2014-10-12 20:54:52.692696+03
6064	861	2	\N	2014-10-12 20:55:02.552131+03
6066	998	2	\N	2014-10-18 11:46:31.67705+03
6075	1657	2	\N	2014-10-18 23:25:55.139592+03
6076	1657	2	\N	2014-10-18 23:26:04.397861+03
6077	1839	2	\N	2014-10-18 23:26:44.642232+03
6078	1634	2	\N	2014-10-18 23:26:52.975425+03
6079	1598	2	\N	2014-10-18 23:27:05.648811+03
6080	1502	2	\N	2014-10-18 23:27:11.743763+03
6081	1503	2	\N	2014-10-18 23:27:18.622533+03
6082	1440	2	\N	2014-10-18 23:27:25.765119+03
6083	1442	2	\N	2014-10-18 23:27:32.509568+03
6084	1840	2	\N	2014-10-18 23:35:01.43267+03
6114	1598	2	\N	2014-10-25 20:24:45.191774+03
6115	1840	2	\N	2014-10-25 20:25:16.419372+03
6116	1839	2	\N	2014-10-25 20:25:25.421645+03
6117	1657	2	\N	2014-10-25 20:25:34.041679+03
6118	1634	2	\N	2014-10-25 20:25:41.778509+03
6119	1598	2	\N	2014-10-25 20:25:49.974159+03
6120	1503	2	\N	2014-10-25 20:25:56.790041+03
6121	1502	2	\N	2014-10-25 20:26:11.552957+03
6122	1487	2	\N	2014-10-25 20:26:20.033323+03
6123	1442	2	\N	2014-10-25 20:26:26.124436+03
6124	1440	2	\N	2014-10-25 20:26:33.450119+03
6125	1660	2	\N	2014-10-25 20:27:51.453322+03
6126	1639	2	\N	2014-10-25 20:27:59.032748+03
6127	1607	2	\N	2014-10-25 20:28:26.48561+03
6128	1547	2	\N	2014-10-25 20:31:18.593123+03
6129	1546	2	\N	2014-10-25 20:31:27.322575+03
6130	1509	2	\N	2014-10-25 20:31:34.596003+03
6131	1500	2	\N	2014-10-25 20:31:41.235636+03
6132	1485	2	\N	2014-10-25 20:31:48.295128+03
6133	1448	2	\N	2014-10-25 20:31:55.364673+03
6134	1447	2	\N	2014-10-25 20:32:03.232605+03
6135	864	2	\N	2014-10-25 22:27:41.085522+03
6136	900	2	\N	2014-10-25 22:27:48.659618+03
6137	780	2	\N	2014-10-25 22:27:56.462817+03
6138	837	2	\N	2014-10-25 22:28:02.931936+03
6139	1394	2	\N	2014-10-25 22:28:08.943421+03
6140	873	2	\N	2014-10-25 22:28:16.618586+03
6141	778	2	\N	2014-10-25 22:28:22.956578+03
6142	1659	2	\N	2014-10-25 22:39:28.23436+03
6144	1849	2	\N	2014-10-25 23:00:37.016264+03
6145	1852	2	\N	2014-10-28 19:57:41.751563+02
6146	1853	2	\N	2014-10-28 20:23:48.907733+02
6147	1854	2	\N	2014-10-28 20:24:58.380434+02
6148	1855	2	\N	2014-10-28 20:25:08.681569+02
6151	1859	2	\N	2014-10-29 12:48:22.905378+02
6152	1860	2	\N	2014-10-30 22:03:33.988542+02
6157	1865	2	\N	2014-11-03 21:33:49.462196+02
6158	1866	2	\N	2014-11-03 21:38:54.729983+02
6159	1867	2	\N	2014-11-03 21:39:31.824693+02
6160	1868	2	\N	2014-11-03 21:40:02.647787+02
6161	1869	2	\N	2014-11-05 21:10:08.261088+02
6162	1870	2	\N	2014-11-05 21:10:38.427296+02
6164	1872	2	\N	2014-11-08 19:05:48.520641+02
6165	1868	2	\N	2014-11-08 19:07:32.928999+02
6166	1868	2	\N	2014-11-08 19:07:58.653299+02
6167	1873	2	\N	2014-11-09 14:14:33.279838+02
6168	1433	2	\N	2014-11-09 14:15:02.053975+02
6170	1875	2	\N	2014-11-09 20:43:57.157494+02
6171	1876	2	\N	2014-11-09 20:50:09.776581+02
6172	1876	2	\N	2014-11-09 21:46:07.106741+02
6173	1876	2	\N	2014-11-09 21:46:46.766703+02
6174	1876	2	\N	2014-11-12 18:42:47.24628+02
6175	1876	2	\N	2014-11-12 18:43:00.917409+02
6176	1876	2	\N	2014-11-12 18:43:51.052257+02
6177	1876	2	\N	2014-11-12 18:49:19.486465+02
6178	1876	2	\N	2014-11-12 18:49:50.992411+02
6182	1880	2	\N	2014-11-12 18:58:13.464317+02
6183	1881	2	\N	2014-11-12 18:58:13.464317+02
6184	1876	2	\N	2014-11-12 19:19:20.155903+02
6185	1880	2	\N	2014-11-12 19:20:04.488842+02
6186	1882	2	\N	2014-11-12 19:21:49.754499+02
6187	1882	2	\N	2014-11-12 20:48:55.295948+02
6188	1876	2	\N	2014-11-13 18:36:19.360925+02
6189	1876	2	\N	2014-11-13 18:36:40.275356+02
6190	1876	2	\N	2014-11-13 18:36:53.848561+02
6191	1876	2	\N	2014-11-13 18:37:04.828162+02
6192	1876	2	\N	2014-11-13 18:44:14.058824+02
6193	1880	2	\N	2014-11-14 13:23:46.652293+02
6196	1884	2	\N	2014-11-15 12:46:51.68956+02
6197	1885	2	\N	2014-11-15 12:55:58.618287+02
6200	1647	2	\N	2014-11-15 19:54:17.589811+02
6201	1647	2	\N	2014-11-15 19:57:05.325517+02
6202	1587	2	\N	2014-11-15 19:57:11.689531+02
6204	1888	2	\N	2014-11-15 20:54:18.530252+02
6209	1893	2	\N	2014-11-15 21:10:00.852505+02
6210	1894	2	\N	2014-11-16 11:36:20.360008+02
6211	1895	2	\N	2014-11-16 11:38:31.304748+02
6212	1896	2	\N	2014-11-16 11:52:22.859107+02
6214	1896	2	\N	2014-11-16 17:28:25.282664+02
6215	1898	2	\N	2014-11-18 19:36:00.947451+02
6217	1900	2	\N	2014-11-18 19:59:41.794255+02
6218	1901	2	\N	2014-11-18 20:00:50.313385+02
6219	1902	2	\N	2014-11-18 20:05:55.399398+02
6220	1903	2	\N	2014-11-18 20:06:23.495804+02
6221	1225	2	\N	2014-11-20 20:55:40.655878+02
6222	1904	2	\N	2014-11-21 20:47:35.513987+02
6223	1434	2	\N	2014-11-21 20:48:05.829054+02
6224	1571	2	\N	2014-11-21 20:48:27.000088+02
6225	1885	2	\N	2014-11-21 20:48:44.475673+02
6226	1905	2	\N	2014-11-21 21:17:50.885382+02
6227	1436	2	\N	2014-11-21 21:19:06.360097+02
6228	1798	2	\N	2014-11-21 21:19:19.899746+02
6229	1425	2	\N	2014-11-21 21:19:42.772209+02
6230	802	2	\N	2014-11-21 21:20:02.792752+02
6231	1906	2	\N	2014-11-21 21:20:18.443474+02
6232	802	2	\N	2014-11-21 21:20:33.430037+02
6233	1395	2	\N	2014-11-21 21:20:55.244524+02
6234	1907	2	\N	2014-11-21 21:25:23.260941+02
6235	879	2	\N	2014-11-21 21:26:01.060638+02
6236	1089	2	\N	2014-11-21 21:34:19.776611+02
6237	874	2	\N	2014-11-21 21:34:45.906696+02
6238	1080	2	\N	2014-11-21 21:35:09.652432+02
6239	1908	2	\N	2014-11-21 21:35:29.643627+02
6240	910	2	\N	2014-11-21 21:36:10.21074+02
6241	1080	2	\N	2014-11-21 21:36:26.556412+02
6242	911	2	\N	2014-11-21 21:36:37.408083+02
6243	956	2	\N	2014-11-21 21:36:56.333028+02
6244	955	2	\N	2014-11-21 21:37:09.845857+02
6245	1909	2	\N	2014-11-21 21:42:55.617875+02
6246	1896	2	\N	2014-11-21 21:43:10.139464+02
6247	1910	2	\N	2014-11-22 17:58:53.151533+02
6248	1911	2	\N	2014-11-22 17:58:53.151533+02
6251	1903	2	\N	2014-11-23 17:42:18.707964+02
6253	1903	2	\N	2014-11-23 18:15:04.669498+02
6254	1913	2	\N	2014-11-23 18:22:07.34092+02
6255	1915	2	\N	2014-11-23 18:25:34.975922+02
6257	1917	2	\N	2014-11-23 18:40:26.695236+02
6258	1918	2	\N	2014-11-23 18:40:42.249218+02
6259	1919	2	\N	2014-11-27 21:56:12.900683+02
6265	1906	2	\N	2014-11-28 22:02:27.025943+02
6266	1908	2	\N	2014-11-28 22:03:25.613427+02
6267	1919	2	\N	2014-11-30 11:21:31.130821+02
6268	1921	2	\N	2014-11-30 11:32:16.085887+02
6270	1368	2	\N	2014-11-30 18:22:02.736241+02
6271	1922	2	\N	2014-12-07 14:34:35.538855+02
6276	1924	2	\N	2014-12-07 21:40:24.739542+02
6277	1925	2	\N	2014-12-07 21:41:09.94037+02
6278	1926	2	\N	2014-12-07 21:41:37.63455+02
6279	1471	2	\N	2014-12-07 21:41:39.584636+02
6280	1927	2	\N	2014-12-07 21:42:12.893528+02
6281	1471	2	\N	2014-12-07 21:42:14.781639+02
6285	1930	2	\N	2014-12-08 21:43:55.101305+02
6286	1869	2	\N	2014-12-08 21:46:09.685953+02
6287	1931	2	\N	2014-12-08 21:52:00.685674+02
6288	1930	2	\N	2014-12-08 21:53:17.580512+02
6289	1932	2	\N	2014-12-11 22:45:01.994257+02
6290	1933	2	\N	2014-12-11 22:46:28.273472+02
6291	1934	2	\N	2014-12-11 22:50:30.21811+02
6293	1935	2	\N	2014-12-11 22:53:00.765244+02
6295	1935	2	\N	2014-12-11 22:53:42.569877+02
6297	1936	2	\N	2014-12-13 21:35:47.599877+02
6298	1939	2	\N	2014-12-13 21:37:02.820409+02
6299	1939	2	\N	2014-12-13 21:37:54.352906+02
6300	1936	2	\N	2014-12-13 21:55:38.627009+02
6301	1933	2	\N	2014-12-13 21:55:57.253566+02
6302	1933	2	\N	2014-12-13 21:57:41.570228+02
6303	1933	2	\N	2014-12-13 22:01:39.804954+02
6304	1936	2	\N	2014-12-13 22:01:54.801501+02
6305	1936	2	\N	2014-12-13 22:03:25.347584+02
6306	1933	2	\N	2014-12-13 22:03:37.415197+02
6307	1939	2	\N	2014-12-13 22:03:52.016284+02
6308	1936	2	\N	2014-12-13 22:10:55.202627+02
6309	1936	2	\N	2014-12-13 22:11:45.388631+02
6310	1936	2	\N	2014-12-14 11:10:18.568487+02
6311	1936	2	\N	2014-12-14 11:10:54.616091+02
6312	1936	2	\N	2014-12-14 11:12:20.116844+02
6313	1933	2	\N	2014-12-14 11:12:44.366886+02
6314	1936	2	\N	2014-12-14 11:14:36.987112+02
6315	1933	2	\N	2014-12-14 11:14:46.937016+02
6316	1940	2	\N	2014-12-14 11:16:18.397912+02
6317	1941	2	\N	2014-12-14 17:51:15.587939+02
6318	1940	2	\N	2014-12-14 19:37:37.036036+02
6319	1936	2	\N	2014-12-14 19:37:54.381361+02
6320	1940	2	\N	2014-12-14 19:41:49.794566+02
6321	1940	2	\N	2014-12-14 19:44:37.781977+02
6322	1940	2	\N	2014-12-14 19:48:08.98232+02
6323	1940	2	\N	2014-12-14 19:50:28.583831+02
6324	1940	2	\N	2014-12-14 20:30:31.46273+02
6325	1936	2	\N	2014-12-14 20:30:45.990313+02
6326	1940	2	\N	2014-12-14 20:33:08.50634+02
6327	1940	2	\N	2014-12-14 20:34:47.73587+02
6328	1940	2	\N	2014-12-14 20:37:41.082704+02
6329	1653	2	\N	2014-12-19 21:31:43.967187+02
6330	1653	2	\N	2014-12-19 21:37:31.746728+02
6331	1951	2	\N	2014-12-19 21:38:17.300837+02
6332	725	2	\N	2014-12-19 21:38:20.726452+02
6333	1952	2	\N	2014-12-19 21:42:56.792366+02
6334	1870	2	\N	2014-12-19 21:43:03.803839+02
6335	1906	2	\N	2014-12-20 16:10:55.310323+02
6336	1953	2	\N	2014-12-20 16:12:04.822804+02
6337	1953	2	\N	2014-12-20 16:28:56.986576+02
6338	1869	2	\N	2014-12-20 17:01:25.535753+02
6339	1869	2	\N	2014-12-20 17:03:12.810766+02
6340	1869	2	\N	2014-12-20 17:03:22.550854+02
6341	1628	2	\N	2014-12-20 17:05:00.135486+02
6342	1869	2	\N	2014-12-20 17:05:08.130568+02
6343	1626	2	\N	2014-12-20 17:50:11.179188+02
6344	1615	2	\N	2014-12-20 17:50:33.508978+02
6345	1954	2	\N	2014-12-20 18:18:17.329483+02
6346	1954	2	\N	2014-12-20 18:18:27.668631+02
6347	1953	2	\N	2014-12-20 18:19:03.042411+02
6348	1955	2	\N	2014-12-20 20:57:13.189777+02
6349	1225	2	\N	2014-12-21 12:57:50.837529+02
6350	1433	2	\N	2014-12-21 12:57:59.036844+02
6351	1954	2	\N	2014-12-21 13:04:30.43023+02
6352	1955	2	\N	2014-12-21 14:01:21.220851+02
6353	1955	2	\N	2014-12-21 14:02:48.391182+02
6354	1955	2	\N	2014-12-21 14:05:59.186502+02
6355	1956	2	\N	2014-12-21 14:58:01.627945+02
6356	1383	2	\N	2014-12-21 14:58:04.4436+02
6357	1383	2	\N	2014-12-21 14:58:18.134114+02
6358	1955	2	\N	2014-12-21 14:58:54.05088+02
6359	1955	2	\N	2014-12-21 14:59:43.024479+02
6360	1955	2	\N	2014-12-21 15:01:24.559119+02
6361	1955	2	\N	2014-12-21 15:02:30.825094+02
6362	1955	2	\N	2014-12-21 15:03:19.517473+02
6363	1955	2	\N	2014-12-21 15:04:26.227416+02
6364	1955	2	\N	2014-12-21 15:05:25.219884+02
6365	1955	2	\N	2014-12-21 15:08:14.659941+02
6366	1955	2	\N	2014-12-21 15:09:18.610638+02
6367	1955	2	\N	2014-12-21 15:10:49.564969+02
6368	1955	2	\N	2014-12-21 15:18:30.435377+02
6369	1955	2	\N	2014-12-21 15:28:30.828306+02
6370	1955	2	\N	2014-12-21 15:30:55.116621+02
6371	1955	2	\N	2014-12-21 15:33:38.056888+02
6372	1955	2	\N	2014-12-21 15:34:45.870649+02
6373	1955	2	\N	2014-12-21 15:55:27.822121+02
6374	1955	2	\N	2014-12-21 15:56:45.477441+02
6375	1955	2	\N	2014-12-21 15:57:54.588037+02
6376	1955	2	\N	2014-12-21 15:59:56.190169+02
6377	1955	2	\N	2014-12-21 16:10:48.898101+02
6378	1955	2	\N	2014-12-21 16:11:31.348869+02
6379	1955	2	\N	2014-12-21 16:12:17.283128+02
6380	1955	2	\N	2014-12-21 16:12:43.349159+02
6381	1955	2	\N	2014-12-21 16:17:53.680374+02
6382	1955	2	\N	2014-12-21 16:18:30.615045+02
6383	1955	2	\N	2014-12-21 16:24:07.556851+02
6384	1955	2	\N	2014-12-21 16:24:36.284901+02
6385	1955	2	\N	2014-12-21 16:25:59.736532+02
6386	1955	2	\N	2014-12-21 16:26:10.717535+02
6387	1958	2	\N	2014-12-21 19:20:00.336409+02
6388	1958	2	\N	2014-12-21 19:40:10.412709+02
6389	1958	2	\N	2014-12-21 19:43:18.014602+02
6390	1955	2	\N	2014-12-21 19:54:47.763979+02
6391	1955	2	\N	2014-12-21 19:57:15.899119+02
6392	1955	2	\N	2014-12-21 20:01:57.931475+02
6393	1962	2	\N	2014-12-24 21:32:53.618984+02
6394	1955	2	\N	2014-12-24 21:52:53.75341+02
6395	1955	2	\N	2014-12-24 21:54:29.381242+02
6396	1955	2	\N	2014-12-24 21:54:40.852567+02
6397	1955	2	\N	2014-12-24 21:59:02.013042+02
6398	1955	2	\N	2014-12-24 23:47:49.852576+02
6399	1955	2	\N	2014-12-24 23:57:47.039863+02
6400	1964	2	\N	2014-12-25 21:05:49.345482+02
6401	1955	2	\N	2014-12-26 20:17:47.53662+02
6402	1955	2	\N	2014-12-26 20:29:33.803173+02
6403	1955	2	\N	2014-12-26 20:31:12.755178+02
6404	1955	2	\N	2014-12-26 20:32:53.259365+02
6405	1955	2	\N	2014-12-26 20:34:24.850656+02
6406	1955	2	\N	2014-12-26 20:36:11.286672+02
6407	1955	2	\N	2014-12-26 20:37:54.248513+02
6408	1955	2	\N	2014-12-26 22:13:17.525737+02
6409	1955	2	\N	2014-12-26 22:24:22.10607+02
6410	1955	2	\N	2014-12-26 22:28:42.906736+02
6411	1317	2	\N	2014-12-27 14:48:10.519499+02
6412	1840	2	\N	2014-12-27 16:05:27.016889+02
6413	1840	2	\N	2014-12-27 16:32:05.180181+02
6414	1840	2	\N	2014-12-27 16:45:52.831401+02
6415	1966	2	\N	2014-12-27 19:34:56.371248+02
6416	1955	2	\N	2014-12-28 18:35:17.644826+02
6417	1955	2	\N	2014-12-28 19:17:37.697477+02
6418	1966	2	\N	2014-12-31 19:10:29.989911+02
6420	1968	2	\N	2015-01-03 12:32:10.846571+02
6422	1970	2	\N	2015-01-03 12:35:21.670372+02
6423	1971	2	\N	2015-01-04 12:45:51.571627+02
6424	1840	2	\N	2015-01-04 12:45:53.947837+02
6425	1971	2	\N	2015-01-04 12:46:35.715575+02
6426	1971	2	\N	2015-01-04 14:05:54.230775+02
6428	1975	2	\N	2015-01-04 14:47:53.838979+02
6429	1976	2	\N	2015-01-04 15:06:13.604725+02
6430	1977	2	\N	2015-01-04 16:44:50.635763+02
6431	1975	2	\N	2015-01-04 16:54:32.711408+02
6432	1975	2	\N	2015-01-04 17:11:52.039507+02
6433	1975	2	\N	2015-01-04 17:31:46.570967+02
6434	1975	2	\N	2015-01-07 14:12:48.405815+02
6435	1975	2	\N	2015-01-07 14:22:19.046581+02
6436	1978	2	\N	2015-01-07 18:00:22.111119+02
6437	1979	2	\N	2015-01-07 18:22:39.961593+02
6438	1980	2	\N	2015-01-07 18:22:48.978415+02
6439	1981	2	\N	2015-01-07 18:23:19.524712+02
6440	3	2	\N	2015-01-07 18:23:30.384627+02
6441	1982	2	\N	2015-01-07 18:30:42.662112+02
6442	3	2	\N	2015-01-07 18:30:49.411934+02
6443	3	2	\N	2015-01-07 18:31:24.902432+02
6444	784	2	\N	2015-01-08 13:21:17.321066+02
6445	784	2	\N	2015-01-08 13:27:01.529898+02
6446	784	2	\N	2015-01-08 14:19:17.153858+02
6447	784	2	\N	2015-01-08 14:20:23.527059+02
6448	784	2	\N	2015-01-09 10:59:22.101268+02
6449	1046	2	\N	2015-01-12 22:16:18.421621+02
6450	1046	2	\N	2015-01-12 22:16:29.774766+02
6451	1046	2	\N	2015-01-12 22:18:02.620143+02
6452	1046	2	\N	2015-01-13 17:00:13.07184+02
6453	1983	2	\N	2015-01-13 17:00:57.932019+02
6454	1985	2	\N	2015-01-13 17:03:06.725248+02
6455	1985	2	\N	2015-01-14 21:32:00.651438+02
6456	1046	2	\N	2015-01-14 21:35:47.291833+02
6457	1987	2	\N	2015-01-15 20:30:02.464255+02
6458	1988	2	\N	2015-01-15 21:27:50.402917+02
6459	1989	2	\N	2015-01-17 15:06:55.170629+02
6460	1990	2	\N	2015-01-17 19:50:58.298272+02
6461	1991	2	\N	2015-01-17 19:50:58.298272+02
6462	1992	2	\N	2015-01-17 19:51:20.956564+02
6463	1990	2	\N	2015-01-17 21:28:18.900625+02
6464	1993	2	\N	2015-01-17 21:28:36.972519+02
6465	1994	2	\N	2015-01-17 21:50:01.04394+02
6466	1995	2	\N	2015-01-17 21:50:14.61181+02
6467	1996	2	\N	2015-01-17 21:54:58.910426+02
6468	1997	2	\N	2015-01-17 21:54:58.910426+02
6471	2000	2	\N	2015-01-17 21:56:46.645017+02
6472	2001	2	\N	2015-01-17 21:57:17.28338+02
6473	2002	2	\N	2015-01-17 21:57:17.28338+02
6476	2005	2	\N	2015-01-17 22:00:19.139836+02
6477	2006	2	\N	2015-01-17 22:00:39.986496+02
6478	2007	2	\N	2015-01-17 22:00:39.986496+02
6479	2000	2	\N	2015-01-17 22:01:41.277766+02
6480	2009	2	\N	2015-01-21 21:44:18.418746+02
6481	1985	2	\N	2015-02-01 13:03:47.123323+02
6482	2009	2	\N	2015-02-01 13:05:09.626214+02
6483	2011	2	\N	2015-02-01 13:23:15.549518+02
6484	1004	2	\N	2015-02-01 13:23:17.930893+02
6485	2012	2	\N	2015-02-01 13:51:03.67962+02
6486	1470	2	\N	2015-02-01 13:51:06.125989+02
6487	2013	2	\N	2015-02-01 15:08:04.506074+02
6488	2014	2	\N	2015-02-01 15:08:25.548868+02
6489	2015	2	\N	2015-02-01 15:09:02.223788+02
6490	2016	2	\N	2015-02-01 15:09:49.640295+02
6491	2017	2	\N	2015-02-01 15:09:55.959842+02
6492	2018	2	\N	2015-02-01 15:12:43.612773+02
6493	2019	2	\N	2015-02-01 15:13:13.911124+02
6494	2020	2	\N	2015-02-01 15:13:27.313034+02
6497	2023	2	\N	2015-02-01 15:16:10.834689+02
6498	2024	2	\N	2015-02-01 15:16:30.308954+02
6501	2026	2	\N	2015-02-01 15:27:12.501194+02
6502	2026	2	\N	2015-02-01 15:27:30.084405+02
6503	2027	2	\N	2015-02-01 15:27:55.689729+02
6504	2028	2	\N	2015-02-01 15:27:55.689729+02
6505	2029	2	\N	2015-02-01 19:41:31.921287+02
6506	2030	2	\N	2015-02-01 19:49:07.587188+02
6507	2031	2	\N	2015-02-01 19:49:18.380376+02
6508	2032	2	\N	2015-02-01 19:51:03.621123+02
6509	1004	2	\N	2015-02-01 19:51:06.683043+02
6515	2038	2	\N	2015-02-01 19:53:59.085718+02
6516	2039	2	\N	2015-02-01 19:53:59.085718+02
6521	2044	2	\N	2015-02-01 19:54:52.686809+02
6522	2045	2	\N	2015-02-01 19:54:52.686809+02
6523	2046	2	\N	2015-02-01 19:54:52.686809+02
6524	2047	2	\N	2015-02-01 19:54:52.686809+02
6525	2048	2	\N	2015-02-03 20:05:38.797054+02
6526	2048	2	\N	2015-02-03 20:06:16.781057+02
6528	2049	2	\N	2015-02-03 21:27:11.659126+02
6529	2048	2	\N	2015-02-03 21:27:36.200475+02
6530	2050	2	\N	2015-02-04 21:04:02.527314+02
6531	2051	2	\N	2015-02-04 21:04:04.474427+02
6532	2051	2	\N	2015-02-04 21:11:28.094987+02
6533	2052	2	\N	2015-02-04 21:11:39.281593+02
6534	2051	2	\N	2015-02-23 21:04:13.639992+02
6535	1648	2	\N	2015-02-24 14:58:15.754816+02
6536	2053	2	\N	2015-02-24 21:04:03.673911+02
6537	2054	2	\N	2015-02-24 21:04:26.838046+02
6538	2053	2	\N	2015-02-24 21:06:05.145287+02
6539	2054	2	\N	2015-02-24 21:06:08.284296+02
6540	2053	2	\N	2015-02-24 21:06:25.905562+02
6541	2054	2	\N	2015-02-24 21:06:27.830735+02
6542	2055	2	\N	2015-03-03 16:25:23.003263+02
6549	1955	2	\N	2015-03-04 21:39:17.186096+02
6550	1955	2	\N	2015-03-04 21:39:30.590536+02
6551	1955	2	\N	2015-03-05 19:52:38.505441+02
6552	1955	2	\N	2015-03-05 19:53:54.442922+02
6553	2051	2	\N	2015-03-05 21:22:31.156271+02
6554	2052	2	\N	2015-03-05 21:22:34.187754+02
6555	2049	2	\N	2015-03-07 13:59:54.391614+02
6556	2049	2	\N	2015-03-07 14:00:01.858793+02
6557	2049	2	\N	2015-03-07 14:00:08.905813+02
6558	2049	2	\N	2015-03-07 17:41:13.176137+02
6559	2049	2	\N	2015-03-07 17:41:24.454712+02
6560	2016	2	\N	2015-03-07 19:11:45.990005+02
6561	1971	2	\N	2015-03-07 20:39:22.05432+02
6562	1939	2	\N	2015-03-07 20:41:30.911568+02
6563	1964	2	\N	2015-03-07 20:41:40.386597+02
6564	1962	2	\N	2015-03-07 20:41:47.24255+02
6565	2009	2	\N	2015-03-07 20:41:57.590912+02
6566	1958	2	\N	2015-03-07 20:42:08.257141+02
6567	2062	2	\N	2015-03-07 20:44:22.388688+02
6568	1958	2	\N	2015-03-07 20:44:57.143369+02
6569	1922	2	\N	2015-03-07 21:16:33.311167+02
6570	1930	2	\N	2015-03-07 21:18:30.204883+02
6571	1980	2	\N	2015-03-07 21:18:36.892234+02
6572	1930	2	\N	2015-03-07 21:21:01.745845+02
6573	1982	2	\N	2015-03-07 21:45:35.899441+02
6574	1983	2	\N	2015-03-07 21:45:46.115364+02
6575	1985	2	\N	2015-03-07 21:45:53.837217+02
6576	2016	2	\N	2015-03-07 21:46:03.965785+02
6577	1940	2	\N	2015-03-07 21:46:13.798132+02
6578	1932	2	\N	2015-03-07 21:46:22.868946+02
6579	1934	2	\N	2015-03-07 21:46:33.42948+02
6580	1935	2	\N	2015-03-07 21:46:42.582075+02
6581	1936	2	\N	2015-03-07 21:46:53.561952+02
6582	1933	2	\N	2015-03-07 21:47:06.74156+02
6584	1922	2	\N	2015-03-08 18:02:14.423833+02
6585	1922	2	\N	2015-03-08 18:02:24.288542+02
6586	1989	2	\N	2015-03-08 18:07:00.091644+02
6587	1922	2	\N	2015-03-08 18:17:03.971743+02
6588	1922	2	\N	2015-03-08 18:29:12.5349+02
6589	2063	2	\N	2015-03-08 18:41:45.468589+02
6590	1989	2	\N	2015-03-08 18:41:51.822924+02
6592	2065	2	\N	2015-03-09 14:02:38.899688+02
6593	2066	2	\N	2015-03-09 17:16:22.759831+02
6594	2068	2	\N	2015-03-09 19:28:40.834898+02
6595	1980	2	\N	2015-03-09 19:37:29.594475+02
6596	1389	2	\N	2015-03-15 19:00:11.360402+02
6597	1389	2	\N	2015-03-15 19:07:00.022851+02
6598	1389	2	\N	2015-03-15 19:08:22.540227+02
6599	2070	2	\N	2015-03-21 15:11:50.495946+02
6600	1989	2	\N	2015-03-21 15:11:59.182752+02
6603	2052	2	\N	2015-03-21 16:50:40.821135+02
6605	2052	2	\N	2015-03-21 16:52:47.683727+02
6606	2075	2	\N	2015-03-21 17:05:47.83578+02
6607	2075	2	\N	2015-03-21 17:06:12.331454+02
6608	2052	2	\N	2015-03-21 17:06:35.32059+02
6609	2070	2	\N	2015-03-21 17:48:31.664941+02
6610	2077	2	\N	2015-03-21 17:49:14.645342+02
6618	2052	2	\N	2015-03-21 18:16:06.930298+02
6621	2052	2	\N	2015-03-21 18:19:16.455929+02
6622	2087	2	\N	2015-03-21 18:20:19.713186+02
6623	2052	2	\N	2015-03-21 18:20:29.187736+02
6624	2052	2	\N	2015-03-21 19:28:39.349206+02
6625	2052	2	\N	2015-03-21 19:30:14.844869+02
6626	2052	2	\N	2015-03-21 19:33:54.902921+02
6627	2052	2	\N	2015-03-21 19:34:11.317898+02
6628	2052	2	\N	2015-03-21 19:35:55.581037+02
6629	2052	2	\N	2015-03-21 19:36:06.902031+02
6630	2052	2	\N	2015-03-21 19:36:15.834648+02
6631	2052	2	\N	2015-03-21 19:36:28.227499+02
6632	2052	2	\N	2015-03-21 19:36:44.271289+02
6633	2088	2	\N	2015-03-21 19:36:44.271289+02
6634	2089	2	\N	2015-03-21 19:38:07.835672+02
6635	2090	2	\N	2015-03-21 19:38:10.203402+02
6637	2052	2	\N	2015-03-21 19:40:18.868487+02
6638	2052	2	\N	2015-03-21 19:41:03.761402+02
6639	2052	2	\N	2015-03-21 19:42:48.725752+02
6640	2052	2	\N	2015-03-21 19:43:52.346215+02
6641	2092	2	\N	2015-03-21 20:11:35.939948+02
6642	2052	2	\N	2015-03-21 20:11:42.394011+02
6643	2052	2	\N	2015-03-21 20:12:01.524624+02
6646	2052	2	\N	2015-03-21 21:14:06.180767+02
6647	2095	2	\N	2015-03-21 22:03:40.435063+02
6648	2051	2	\N	2015-03-21 22:03:42.699321+02
6649	2088	2	\N	2015-03-21 22:03:45.19164+02
6650	2052	2	\N	2015-03-21 22:12:59.222848+02
6651	971	2	\N	2015-03-22 16:55:09.922468+02
6652	2096	2	\N	2015-03-22 17:22:28.394236+02
6653	970	2	\N	2015-03-22 17:22:30.31308+02
6654	971	2	\N	2015-03-22 17:32:58.675826+02
6655	2097	2	\N	2015-03-22 17:35:36.969555+02
6656	2052	2	\N	2015-03-22 17:35:38.710629+02
6657	2052	2	\N	2015-03-22 17:35:54.667572+02
6658	2052	2	\N	2015-03-22 17:36:02.394493+02
6659	1413	2	\N	2015-03-22 21:10:23.96026+02
6660	2098	2	\N	2015-03-22 21:12:12.040889+02
6661	1413	2	\N	2015-03-22 21:12:14.574907+02
6662	953	2	\N	2015-03-23 10:52:07.126828+02
6663	955	2	\N	2015-03-23 10:52:46.434534+02
6664	955	2	\N	2015-03-23 10:53:07.107505+02
6665	971	2	\N	2015-03-23 11:17:09.549645+02
6666	971	2	\N	2015-03-23 11:17:14.786132+02
6667	971	2	\N	2015-03-23 22:30:47.611278+02
6668	2099	2	\N	2015-03-24 19:25:49.743645+02
6669	2100	2	\N	2015-03-24 19:26:22.746874+02
6670	2101	2	\N	2015-03-24 19:30:50.825716+02
6671	1413	2	\N	2015-03-24 21:27:29.027714+02
6672	1413	2	\N	2015-03-24 21:27:56.025596+02
6673	2104	2	\N	2015-03-25 22:08:36.018637+02
6674	2105	2	\N	2015-03-25 22:09:11.121353+02
6675	2106	2	\N	2015-03-25 22:10:32.26983+02
6676	2107	2	\N	2015-03-27 21:02:27.365736+02
6677	1413	2	\N	2015-03-27 22:11:48.664734+02
6678	1318	2	\N	2015-03-27 22:11:57.175441+02
6679	2108	2	\N	2015-03-27 22:14:09.702895+02
6680	1413	2	\N	2015-03-27 22:14:23.177174+02
6681	1975	2	\N	2015-03-29 14:54:09.090695+03
6682	1975	2	\N	2015-03-29 14:56:05.558074+03
6683	2054	2	\N	2015-03-29 18:10:37.298528+03
6684	2054	2	\N	2015-03-29 18:10:44.494853+03
6685	2054	2	\N	2015-03-29 18:11:59.351954+03
6686	894	2	\N	2015-03-29 18:12:33.345883+03
6687	2108	2	\N	2015-03-29 18:41:14.962865+03
6688	2108	2	\N	2015-03-29 18:41:28.932911+03
6689	2108	2	\N	2015-03-29 18:41:35.361837+03
6693	1578	2	\N	2015-03-29 19:28:18.094577+03
6694	1563	2	\N	2015-03-29 19:28:26.306719+03
6695	1560	2	\N	2015-03-29 19:28:31.032916+03
6696	1649	2	\N	2015-03-29 20:30:21.118741+03
6698	2111	2	\N	2015-03-29 20:32:08.188477+03
6699	918	2	\N	2015-03-29 20:45:02.042426+03
6700	918	2	\N	2015-03-29 20:45:08.391579+03
6701	917	2	\N	2015-03-29 20:45:13.080299+03
6702	916	2	\N	2015-03-29 20:45:17.094049+03
6703	952	2	\N	2015-03-29 20:51:29.823177+03
6705	988	2	\N	2015-03-29 20:57:38.470567+03
6707	971	2	\N	2015-03-29 21:04:32.587955+03
6709	1647	2	\N	2015-03-29 21:11:13.101083+03
6710	2115	2	\N	2015-03-29 21:11:20.771189+03
6711	1648	2	\N	2015-03-29 21:19:19.348961+03
6713	1646	2	\N	2015-03-29 21:25:36.400114+03
6715	1419	2	\N	2015-03-31 18:55:34.756779+03
6716	1415	2	\N	2015-03-31 18:55:54.50919+03
6718	1507	2	\N	2015-03-31 19:11:10.805316+03
6719	1507	2	\N	2015-03-31 19:11:17.000092+03
6720	1507	2	\N	2015-03-31 19:11:23.716877+03
6721	1898	2	\N	2015-03-31 19:19:08.662529+03
6722	1898	2	\N	2015-03-31 19:19:13.979595+03
6723	1898	2	\N	2015-03-31 19:19:19.541915+03
6724	2119	2	\N	2015-03-31 19:31:32.255315+03
6725	1419	2	\N	2015-03-31 19:31:35.171043+03
6726	2120	2	\N	2015-03-31 21:42:30.209371+03
6727	2107	2	\N	2015-04-06 22:18:27.344977+03
6728	2054	2	\N	2015-04-22 09:31:23.533867+03
6729	2126	2	\N	2015-04-22 10:21:50.083529+03
6730	2126	2	\N	2015-04-22 10:34:35.83663+03
6731	2127	2	\N	2015-04-22 15:08:30.934237+03
6732	2128	2	\N	2015-04-22 15:09:24.597951+03
6733	2129	2	\N	2015-04-22 15:30:21.099029+03
6734	2130	2	\N	2015-04-22 15:30:28.848383+03
6735	2131	2	\N	2015-04-22 15:33:06.666889+03
6736	2126	2	\N	2015-04-22 15:33:09.520564+03
6737	2132	2	\N	2015-04-22 15:34:13.439147+03
6738	2126	2	\N	2015-04-22 15:34:14.494849+03
6739	2126	2	\N	2015-04-22 15:34:41.240196+03
6740	2130	2	\N	2015-04-24 21:16:26.897843+03
6741	953	2	\N	2015-04-24 21:38:02.133997+03
6742	955	2	\N	2015-04-24 21:39:08.574084+03
6743	2108	2	\N	2015-04-25 13:14:21.858762+03
6745	2135	2	\N	2015-04-25 16:39:24.611492+03
6746	2128	2	\N	2015-04-25 16:59:29.339712+03
6747	2136	2	\N	2015-04-25 16:59:52.412523+03
6748	2137	2	\N	2015-04-25 21:29:39.820793+03
6749	2138	2	\N	2015-04-25 21:29:47.819244+03
6750	2139	2	\N	2015-04-25 21:29:55.72108+03
6751	2144	2	\N	2015-04-26 00:17:08.072699+03
6752	2145	2	\N	2015-04-26 00:17:08.072699+03
6753	2146	2	\N	2015-04-26 00:22:46.640907+03
6754	2147	2	\N	2015-04-26 00:22:46.640907+03
6755	2148	2	\N	2015-04-26 00:26:59.761945+03
6756	2149	2	\N	2015-04-26 00:26:59.761945+03
6757	2150	2	\N	2015-04-26 00:30:11.687983+03
6758	2151	2	\N	2015-04-26 00:30:11.687983+03
6759	2152	2	\N	2015-04-26 00:36:42.355592+03
6760	2153	2	\N	2015-04-26 00:36:42.355592+03
6761	2154	2	\N	2015-04-26 00:44:52.209962+03
6762	2155	2	\N	2015-04-26 00:44:52.209962+03
6763	2156	2	\N	2015-04-26 09:56:13.81422+03
6764	2157	2	\N	2015-04-26 09:56:13.81422+03
6765	2158	2	\N	2015-04-26 10:00:13.021078+03
6766	2159	2	\N	2015-04-26 10:00:13.021078+03
6767	2160	2	\N	2015-04-26 10:09:07.981749+03
6768	2161	2	\N	2015-04-26 10:09:07.981749+03
6769	2162	2	\N	2015-04-26 10:11:20.869074+03
6770	2163	2	\N	2015-04-26 10:11:20.869074+03
6771	2164	2	\N	2015-04-26 10:23:35.980962+03
6772	2165	2	\N	2015-04-26 10:23:35.980962+03
6774	2167	2	\N	2015-04-26 10:30:42.474899+03
6775	2168	2	\N	2015-04-26 10:30:42.474899+03
6778	2171	2	\N	2015-04-26 10:38:49.924523+03
6779	2172	2	\N	2015-04-26 10:41:15.682562+03
6780	2173	2	\N	2015-04-26 10:41:15.682562+03
6781	2174	2	\N	2015-04-26 10:51:18.425172+03
6782	2175	2	\N	2015-04-26 10:51:18.425172+03
6783	2176	2	\N	2015-04-26 10:54:26.243589+03
6784	2177	2	\N	2015-04-26 10:54:26.243589+03
6785	2178	2	\N	2015-04-26 10:57:26.669326+03
6786	2179	2	\N	2015-04-26 10:57:26.669326+03
6787	2180	2	\N	2015-04-26 11:08:04.739521+03
6788	2181	2	\N	2015-04-26 11:08:04.739521+03
6789	2182	2	\N	2015-04-26 11:13:10.975009+03
6790	2183	2	\N	2015-04-26 11:13:10.975009+03
6791	2184	2	\N	2015-04-26 13:03:25.416787+03
6792	2185	2	\N	2015-04-26 13:03:25.416787+03
6793	2186	2	\N	2015-04-26 13:42:49.969814+03
6794	2187	2	\N	2015-04-26 14:04:42.384772+03
6795	2188	2	\N	2015-04-26 14:04:42.384772+03
6796	2189	2	\N	2015-04-26 14:05:26.994527+03
6797	2190	2	\N	2015-04-26 14:05:26.994527+03
6798	2186	2	\N	2015-04-26 14:05:29.313624+03
6801	2197	2	\N	2015-05-03 13:21:34.120955+03
6802	2197	2	\N	2015-05-03 13:23:12.828981+03
6803	2197	2	\N	2015-05-03 13:34:38.831852+03
6804	2197	2	\N	2015-05-03 13:40:51.674186+03
6805	2199	2	\N	2015-05-03 23:18:19.876372+03
6806	1780	2	\N	2015-05-03 23:18:33.103558+03
6807	1368	2	\N	2015-05-04 19:21:58.460934+03
6808	1368	2	\N	2015-05-04 19:22:20.533133+03
6809	2200	2	\N	2015-05-04 20:57:01.637182+03
6810	2201	2	\N	2015-05-04 20:58:33.565049+03
6811	2203	2	\N	2015-05-04 21:30:33.485239+03
6812	1003	2	\N	2015-05-08 21:15:22.303904+03
6813	2205	2	\N	2015-05-08 22:38:40.1563+03
6814	2206	2	\N	2015-05-08 22:40:57.101857+03
6815	2207	2	\N	2015-05-08 22:43:00.228497+03
6816	2208	2	\N	2015-05-08 22:43:46.205549+03
6817	2209	2	\N	2015-05-09 15:04:04.437709+03
6818	2210	2	\N	2015-05-09 15:18:42.295591+03
6819	2211	2	\N	2015-05-09 15:20:41.04877+03
6820	2212	2	\N	2015-05-09 15:21:16.54612+03
6821	2213	2	\N	2015-05-09 15:21:20.750661+03
6822	2214	2	\N	2015-05-09 15:27:46.304009+03
6823	2215	2	\N	2015-05-09 15:27:52.157735+03
6824	2216	2	\N	2015-05-09 15:32:20.738122+03
6825	2216	2	\N	2015-05-09 15:34:43.153612+03
6826	2216	2	\N	2015-05-09 15:35:37.080548+03
6827	2216	2	\N	2015-05-09 15:36:20.491648+03
6828	2216	2	\N	2015-05-09 15:36:28.290218+03
6829	2217	2	\N	2015-05-09 16:10:30.715652+03
6830	2218	2	\N	2015-05-09 16:40:29.294581+03
6831	2216	2	\N	2015-05-09 16:40:47.688279+03
6832	2219	2	\N	2015-05-09 16:52:43.81748+03
6833	1550	2	\N	2015-05-09 16:53:04.04708+03
6834	1008	2	\N	2015-05-09 16:53:15.905297+03
6836	2218	2	\N	2015-05-09 16:56:24.612587+03
6837	2221	2	\N	2015-05-09 16:58:37.060459+03
6838	2216	2	\N	2015-05-09 17:04:04.921556+03
6839	2216	2	\N	2015-05-09 17:04:48.531212+03
6840	1563	2	\N	2015-05-09 19:32:44.822595+03
6841	2222	2	\N	2015-05-09 19:43:25.178079+03
6842	2215	2	\N	2015-05-09 20:07:16.539791+03
6843	2216	2	\N	2015-05-09 20:07:46.078918+03
6844	2223	2	\N	2015-05-09 20:08:53.78535+03
6845	2224	2	\N	2015-05-09 20:09:23.379411+03
6846	2225	2	\N	2015-05-09 20:09:44.887962+03
6847	2226	2	\N	2015-05-09 20:17:22.088876+03
6848	2227	2	\N	2015-05-09 20:29:08.971941+03
6849	2228	2	\N	2015-05-09 20:29:24.701653+03
6850	2229	2	\N	2015-05-09 20:29:40.419576+03
6851	2224	2	\N	2015-05-09 20:29:49.729598+03
6852	2230	2	\N	2015-05-09 20:30:09.233291+03
6853	2231	2	\N	2015-05-09 20:30:23.623593+03
6854	2232	2	\N	2015-05-09 20:30:35.560504+03
6855	2233	2	\N	2015-05-09 20:30:51.356148+03
6856	2234	2	\N	2015-05-09 20:31:09.312334+03
6857	2235	2	\N	2015-05-09 20:31:21.029136+03
6858	2236	2	\N	2015-05-09 20:31:43.127575+03
6859	2237	2	\N	2015-05-09 20:31:57.326798+03
6860	2238	2	\N	2015-05-09 20:32:20.746647+03
6861	2239	2	\N	2015-05-09 20:32:35.107871+03
6862	2240	2	\N	2015-05-09 20:32:50.419187+03
6863	2241	2	\N	2015-05-09 20:33:01.999568+03
6864	2242	2	\N	2015-05-09 20:33:16.190303+03
6865	2236	2	\N	2015-05-09 20:54:08.857766+03
6866	2216	2	\N	2015-05-09 21:04:14.03464+03
6867	1578	2	\N	2015-05-09 21:16:42.718164+03
6868	2243	2	\N	2015-05-10 13:44:27.494956+03
6869	2244	2	\N	2015-05-10 13:45:29.048699+03
6870	2245	2	\N	2015-05-10 13:46:40.29071+03
6871	2246	2	\N	2015-05-10 14:01:26.829403+03
6872	2247	2	\N	2015-05-10 14:01:57.254972+03
6873	2248	2	\N	2015-05-10 14:10:42.034833+03
6874	2249	2	\N	2015-05-10 14:10:53.000133+03
6875	2254	2	\N	2015-05-10 14:35:53.336283+03
6876	2255	2	\N	2015-05-10 14:35:53.336283+03
6877	2256	2	\N	2015-05-10 14:39:45.730714+03
6878	2257	2	\N	2015-05-10 14:39:45.730714+03
6879	2258	2	\N	2015-05-10 14:45:11.098493+03
6880	2259	2	\N	2015-05-10 14:45:11.098493+03
6881	2260	2	\N	2015-05-10 14:53:32.27851+03
6882	2261	2	\N	2015-05-10 14:53:32.27851+03
6883	2262	2	\N	2015-05-10 14:57:13.121414+03
6884	2263	2	\N	2015-05-10 14:57:13.121414+03
6885	2264	2	\N	2015-05-10 14:57:55.441966+03
6886	2265	2	\N	2015-05-10 15:07:20.399588+03
6887	2266	2	\N	2015-05-10 15:07:20.399588+03
6888	2267	2	\N	2015-05-10 15:07:27.786314+03
6889	2268	2	\N	2015-05-10 16:04:17.22685+03
6890	2269	2	\N	2015-05-10 16:04:56.471262+03
6891	1318	2	\N	2015-05-10 16:05:16.31159+03
6892	2270	2	\N	2015-05-10 16:07:24.626275+03
6893	2271	2	\N	2015-05-10 16:08:32.663974+03
6894	2272	2	\N	2015-05-10 16:08:35.587577+03
6895	2273	2	\N	2015-05-10 16:08:47.271902+03
6896	2274	2	\N	2015-05-10 16:08:47.271902+03
6897	2275	2	\N	2015-05-10 16:09:34.650716+03
6898	2276	2	\N	2015-05-10 22:11:18.586994+03
6899	2277	2	\N	2015-05-10 22:12:40.523328+03
6900	1314	2	\N	2015-05-10 22:12:56.872348+03
6901	2278	2	\N	2015-05-10 22:14:48.438204+03
6902	2279	2	\N	2015-05-10 22:14:48.438204+03
6903	2280	2	\N	2015-05-10 22:19:21.083289+03
6904	2280	2	\N	2015-05-13 21:55:52.759278+03
6905	2275	2	\N	2015-05-13 21:56:48.008072+03
6906	2267	2	\N	2015-05-13 21:56:54.031403+03
6907	2264	2	\N	2015-05-13 21:56:59.496539+03
6908	2281	2	\N	2015-05-16 15:29:57.002389+03
6909	2282	2	\N	2015-05-16 15:34:53.800182+03
6910	2283	2	\N	2015-05-16 15:34:53.800182+03
6911	2284	2	\N	2015-05-16 15:36:09.929045+03
6912	2285	2	\N	2015-05-16 15:45:33.371911+03
6913	2286	2	\N	2015-05-16 15:45:33.371911+03
6914	2287	2	\N	2015-05-16 15:48:18.436182+03
6915	2288	2	\N	2015-05-16 15:48:18.436182+03
6916	2289	2	\N	2015-05-17 21:30:51.134604+03
6917	2280	2	\N	2015-05-17 21:31:00.094313+03
6918	2290	2	\N	2015-05-17 21:31:39.003456+03
6919	2280	2	\N	2015-05-17 21:31:48.129633+03
6920	2284	2	\N	2015-05-17 22:02:03.373006+03
6921	2284	2	\N	2015-05-17 22:02:31.027832+03
6922	2291	2	\N	2015-05-18 16:39:17.24427+03
6923	2284	2	\N	2015-05-18 16:40:09.305094+03
6924	2284	2	\N	2015-05-18 20:31:39.659544+03
6925	2284	2	\N	2015-05-18 20:34:34.03653+03
6926	2284	2	\N	2015-05-18 21:22:46.805573+03
6927	2292	2	\N	2015-05-24 12:55:28.784478+03
6928	1212	2	\N	2015-05-24 13:06:21.488837+03
6929	2293	2	\N	2015-05-24 15:06:40.212091+03
6930	2294	2	\N	2015-05-24 15:11:44.965777+03
6931	2295	2	\N	2015-05-24 16:49:53.513439+03
6932	2296	2	\N	2015-05-24 16:50:41.467323+03
6933	2297	2	\N	2015-05-24 16:55:00.642026+03
6934	2299	2	\N	2015-05-24 16:57:39.672043+03
6935	2300	2	\N	2015-05-24 17:03:51.85238+03
6936	2088	2	\N	2015-05-24 17:03:55.878998+03
6937	2301	2	\N	2015-05-24 17:04:54.502108+03
6938	2088	2	\N	2015-05-24 17:10:16.729607+03
6939	2088	2	\N	2015-05-24 17:10:29.437025+03
6940	2088	2	\N	2015-05-24 17:15:30.592241+03
6941	2302	2	\N	2015-05-24 17:16:33.029089+03
6942	2075	2	\N	2015-05-24 17:16:41.742578+03
6943	2303	2	\N	2015-05-24 17:17:17.81127+03
6944	2088	2	\N	2015-05-24 17:17:21.677682+03
6945	2305	2	\N	2015-05-24 20:37:07.412723+03
6946	2052	2	\N	2015-05-24 20:37:10.892479+03
6947	2088	2	\N	2015-05-24 21:01:25.501241+03
6948	2052	2	\N	2015-05-24 21:13:25.598747+03
6949	2306	2	\N	2015-05-24 21:14:39.628922+03
6950	2052	2	\N	2015-05-24 21:14:43.723121+03
6951	2280	2	\N	2015-05-24 21:21:32.476216+03
6952	2280	2	\N	2015-05-24 21:22:00.849383+03
6953	2280	2	\N	2015-05-24 21:22:09.702717+03
6954	2307	2	\N	2015-05-24 21:32:02.910902+03
6955	2308	2	\N	2015-05-24 21:32:24.738611+03
6956	2309	2	\N	2015-05-24 21:32:31.516248+03
6957	2310	2	\N	2015-05-24 21:33:17.528061+03
6958	2311	2	\N	2015-05-24 21:35:46.300244+03
6959	2312	2	\N	2015-05-24 21:36:06.190691+03
6960	2312	2	\N	2015-05-24 21:36:27.205265+03
6961	2313	2	\N	2015-05-25 21:31:05.718794+03
6962	2312	2	\N	2015-05-25 21:31:08.674137+03
6963	2314	2	\N	2015-05-26 20:44:11.702313+03
6964	2315	2	\N	2015-05-26 20:44:48.242189+03
6965	2316	2	\N	2015-05-26 20:44:48.242189+03
6966	2317	2	\N	2015-05-26 20:45:01.161364+03
6967	2284	2	\N	2015-05-28 13:46:35.94219+03
6968	2317	2	\N	2015-05-28 13:46:45.92498+03
6969	2280	2	\N	2015-05-28 13:46:51.874219+03
6970	1507	2	\N	2015-05-31 21:55:12.660877+03
6971	1507	2	\N	2015-05-31 21:56:27.809825+03
6972	1439	2	\N	2015-05-31 21:57:11.520889+03
6973	1507	2	\N	2015-05-31 21:58:33.173778+03
6974	1507	2	\N	2015-05-31 22:00:02.964614+03
6975	1507	2	\N	2015-05-31 22:00:38.733485+03
6976	1507	2	\N	2015-05-31 22:11:01.827304+03
6977	1507	2	\N	2015-06-01 09:54:54.423199+03
6978	2284	2	\N	2015-06-01 11:22:28.244232+03
6979	2319	2	\N	2015-06-01 11:37:24.071069+03
6980	2320	2	\N	2015-06-01 12:56:01.185317+03
6986	2327	2	\N	2015-06-02 13:22:30.670092+03
6987	2328	2	\N	2015-06-02 13:22:36.147873+03
6988	2329	2	\N	2015-06-02 13:23:35.222007+03
6989	2330	2	\N	2015-06-02 13:24:32.384898+03
6990	2331	2	\N	2015-06-02 13:25:52.745886+03
6991	2332	2	\N	2015-06-02 13:27:31.983851+03
6992	2333	2	\N	2015-06-02 13:27:36.950926+03
6993	2334	2	\N	2015-06-02 13:28:43.733459+03
6994	2335	2	\N	2015-06-02 13:29:10.771807+03
6995	2336	2	\N	2015-06-02 13:29:57.138464+03
6996	2337	2	\N	2015-06-02 13:30:11.199071+03
6997	2338	2	\N	2015-06-02 13:34:47.558077+03
6998	2339	2	\N	2015-06-02 13:34:50.130325+03
6999	2340	2	\N	2015-06-02 13:35:46.336511+03
7000	2341	2	\N	2015-06-02 13:36:09.066506+03
7001	2342	2	\N	2015-06-02 13:36:09.066506+03
7002	2343	2	\N	2015-06-02 13:37:26.99598+03
7003	2344	2	\N	2015-06-02 13:37:26.99598+03
7004	2345	2	\N	2015-06-02 13:37:42.100766+03
7023	2345	2	\N	2015-06-06 20:33:35.089301+03
7024	2366	2	\N	2015-06-06 21:47:05.357423+03
7025	2367	2	\N	2015-06-06 21:47:08.978477+03
7026	2368	2	\N	2015-06-06 21:49:00.661472+03
7027	2369	2	\N	2015-06-06 21:50:18.211354+03
7028	2370	2	\N	2015-06-06 21:51:07.167429+03
7029	2371	2	\N	2015-06-06 21:52:21.362863+03
7030	2372	2	\N	2015-06-06 21:52:25.91268+03
7031	2367	2	\N	2015-06-06 22:01:59.580344+03
7032	2373	2	\N	2015-06-06 22:05:50.240364+03
7033	2374	2	\N	2015-06-06 22:06:07.223567+03
7034	2375	2	\N	2015-06-06 22:06:55.79185+03
7035	2376	2	\N	2015-06-06 22:07:46.643073+03
7036	2377	2	\N	2015-06-06 22:08:11.14074+03
7037	2378	2	\N	2015-06-06 22:08:11.14074+03
7038	2379	2	\N	2015-06-06 22:10:53.894076+03
7039	2380	2	\N	2015-06-06 22:10:53.894076+03
7040	2381	2	\N	2015-06-06 22:12:04.71986+03
7041	2382	2	\N	2015-06-06 22:12:17.899878+03
7042	2372	2	\N	2015-06-06 22:12:34.850437+03
7043	2383	2	\N	2015-06-06 22:34:30.822368+03
7044	2384	2	\N	2015-06-06 22:35:06.098136+03
7045	2385	2	\N	2015-06-06 22:35:22.838833+03
7046	2382	2	\N	2015-06-06 22:36:33.646314+03
7047	2388	2	\N	2015-06-06 22:43:36.614024+03
7048	2382	2	\N	2015-06-07 15:30:58.294045+03
7049	2247	2	\N	2015-06-07 17:10:29.033956+03
7050	1413	2	\N	2015-06-07 17:10:56.929199+03
7051	1318	2	\N	2015-06-07 17:11:36.862031+03
7052	1314	2	\N	2015-06-07 17:12:28.161782+03
7053	1431	2	\N	2015-06-07 19:55:54.571452+03
7054	1898	2	\N	2015-06-07 19:59:40.465993+03
7055	1898	2	\N	2015-06-07 20:00:47.882499+03
7056	1432	2	\N	2015-06-07 20:00:59.808075+03
7057	1608	2	\N	2015-06-07 20:01:30.177316+03
7058	1609	2	\N	2015-06-07 20:02:19.266681+03
7059	1769	2	\N	2015-06-07 20:03:05.939338+03
7060	1780	2	\N	2015-06-07 20:04:36.345782+03
7061	1873	2	\N	2015-06-07 20:05:07.816356+03
7062	1898	2	\N	2015-06-07 20:05:26.076509+03
7063	2199	2	\N	2015-06-07 20:05:57.959925+03
7064	2246	2	\N	2015-06-07 20:06:32.075272+03
7065	2246	2	\N	2015-06-07 20:06:41.085651+03
7066	2269	2	\N	2015-06-07 20:07:23.767588+03
7067	2277	2	\N	2015-06-07 20:07:57.192127+03
7068	1426	2	\N	2015-06-07 20:09:52.309668+03
7069	2389	2	\N	2015-06-07 20:10:03.246206+03
7070	2390	2	\N	2015-06-07 20:10:21.42447+03
7071	2391	2	\N	2015-06-07 20:10:54.694938+03
7072	2392	2	\N	2015-06-07 20:11:12.709328+03
7073	2393	2	\N	2015-06-07 20:11:33.449675+03
7074	2394	2	\N	2015-06-07 20:11:54.80775+03
7075	2395	2	\N	2015-06-07 20:12:24.648998+03
7076	2396	2	\N	2015-06-07 20:12:47.549001+03
7077	2397	2	\N	2015-06-07 20:13:09.482196+03
7078	2398	2	\N	2015-06-07 20:13:26.815118+03
7079	2399	2	\N	2015-06-07 20:13:43.442647+03
7080	2400	2	\N	2015-06-07 20:13:57.868779+03
7081	2401	2	\N	2015-06-07 20:14:15.895967+03
7082	2402	2	\N	2015-06-07 20:14:42.501203+03
7083	2403	2	\N	2015-06-07 20:15:33.611845+03
7084	2404	2	\N	2015-06-07 20:15:53.460657+03
7085	2405	2	\N	2015-06-07 20:16:10.772685+03
7086	2406	2	\N	2015-06-07 20:16:32.442601+03
7087	2407	2	\N	2015-06-07 20:16:56.509083+03
7088	2408	2	\N	2015-06-07 20:17:19.457924+03
7089	2409	2	\N	2015-06-07 20:17:39.828441+03
7090	2410	2	\N	2015-06-07 20:17:59.953522+03
7091	2411	2	\N	2015-06-07 20:18:15.36941+03
7092	2412	2	\N	2015-06-07 20:18:33.319787+03
7093	2413	2	\N	2015-06-07 20:18:53.786993+03
7094	2414	2	\N	2015-06-07 20:19:17.251882+03
7095	2415	2	\N	2015-06-07 20:34:54.782206+03
7096	2416	2	\N	2015-06-07 20:35:11.96143+03
7097	2417	2	\N	2015-06-07 20:35:33.998015+03
7098	2418	2	\N	2015-06-07 20:36:01.596002+03
7099	2419	2	\N	2015-06-07 20:36:15.960332+03
7100	2420	2	\N	2015-06-07 20:36:35.413228+03
7101	2421	2	\N	2015-06-07 20:37:30.352425+03
7102	2422	2	\N	2015-06-07 20:37:53.888785+03
7103	2423	2	\N	2015-06-07 20:38:10.610447+03
7104	2424	2	\N	2015-06-07 20:38:59.517394+03
7105	2425	2	\N	2015-06-07 20:39:26.415211+03
7106	2426	2	\N	2015-06-07 20:40:05.840226+03
7107	2427	2	\N	2015-06-07 20:40:46.537019+03
7108	2428	2	\N	2015-06-07 20:41:01.3009+03
7109	2429	2	\N	2015-06-07 20:41:17.634439+03
7110	2430	2	\N	2015-06-07 20:41:36.56949+03
7111	2431	2	\N	2015-06-07 20:41:54.944525+03
7112	2432	2	\N	2015-06-07 20:42:11.063081+03
7113	2433	2	\N	2015-06-10 21:10:55.543668+03
7114	2434	2	\N	2015-06-10 21:10:58.272269+03
7115	2434	2	\N	2015-06-10 21:11:16.546457+03
7116	2435	2	\N	2015-06-10 21:11:49.343497+03
7117	2436	2	\N	2015-06-10 21:12:20.087946+03
7119	2437	2	\N	2015-06-10 21:13:28.379702+03
7120	2434	2	\N	2015-06-10 21:13:35.658848+03
7118	2434	2	\N	2015-06-10 21:12:30.557424+03
7121	2434	2	\N	2015-06-13 11:08:16.884538+03
7122	2438	2	\N	2015-06-13 12:24:23.664338+03
7123	2439	2	\N	2015-06-13 12:25:12.11639+03
7124	2440	2	\N	2015-06-13 12:25:55.053099+03
7125	2439	2	\N	2015-06-13 12:28:23.509307+03
7126	1431	2	\N	2015-06-13 16:13:14.891511+03
7127	2269	2	\N	2015-06-13 16:29:21.58833+03
7128	2391	2	\N	2015-06-13 16:29:38.922876+03
7130	2442	2	\N	2015-06-13 17:22:11.365048+03
7162	2450	2	\N	2015-06-13 19:58:22.391173+03
7163	2317	2	\N	2015-06-13 19:58:33.103367+03
7164	2451	2	\N	2015-06-13 19:59:50.784052+03
7165	2452	2	\N	2015-06-13 19:59:50.784052+03
7166	2317	2	\N	2015-06-13 20:00:28.712308+03
7167	2317	2	\N	2015-06-13 20:01:26.421434+03
7168	2317	2	\N	2015-06-13 20:03:24.653457+03
7176	2451	2	\N	2015-06-14 10:07:32.690694+03
7177	2451	2	\N	2015-06-14 10:16:32.619194+03
7178	2451	2	\N	2015-06-14 13:13:57.393431+03
7179	2451	2	\N	2015-06-14 13:21:50.094038+03
7180	2451	2	\N	2015-06-14 13:22:37.050016+03
7181	2451	2	\N	2015-06-14 13:23:13.387606+03
7182	2451	2	\N	2015-06-14 13:23:25.25704+03
7183	2457	2	\N	2015-06-14 13:25:18.074212+03
7184	2451	2	\N	2015-06-14 13:26:56.97373+03
7185	2458	2	\N	2015-06-14 13:28:59.472857+03
7186	2459	2	\N	2015-06-14 13:29:40.688494+03
7187	2457	2	\N	2015-06-14 14:17:22.935487+03
7199	2463	2	\N	2015-06-14 16:30:22.760587+03
7201	2463	2	\N	2015-06-14 16:43:36.808614+03
7202	2465	2	\N	2015-06-14 18:28:13.295968+03
7203	2466	2	\N	2015-06-14 18:50:25.96227+03
7204	2467	2	\N	2015-06-14 18:50:57.662486+03
\.


--
-- Data for Name: resource_type; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY resource_type (id, resource_id, name, humanize, resource_name, module, descr, settings, status) FROM stdin;
145	2292	leads_items	Leads Items	LeadsItemsResource	travelcrm.resources.leads_items	Leads Items	null	0
103	1317	invoices	Invoices	InvoicesResource	travelcrm.resources.invoices	Invoices list. Invoice can't be created manualy - only using source document such as Tours	{"active_days": 3}	0
2	10	users	Users	UsersResource	travelcrm.resources.users	Users list	\N	0
1	773		Home	Root	travelcrm.resources	Home Page of Travelcrm	\N	0
12	16	resources_types	Resources Types	ResourcesTypesResource	travelcrm.resources.resources_types	Resources types list	\N	0
39	274	regions	Regions	RegionsResource	travelcrm.resources.regions		\N	0
41	283	currencies	Currencies	CurrenciesResource	travelcrm.resources.currencies		\N	0
47	706	employees	Employees	EmployeesResource	travelcrm.resources.employees	Employees Container Datagrid	\N	0
55	723	structures	Structures	StructuresResource	travelcrm.resources.structures	Companies structures is a tree of company structure. It's can be offices, filials, departments and so and so	\N	0
59	764	positions	Positions	PositionsResource	travelcrm.resources.positions	Companies positions is a point of company structure where emplyees can be appointed	\N	0
61	769	permisions	Permisions	PermisionsResource	travelcrm.resources.permisions	Permisions list of company structure position. It's list of resources and permisions	\N	0
65	775	navigations	Navigations	NavigationsResource	travelcrm.resources.navigations	Navigations list of company structure position.	\N	0
67	788	appointments	Appointments	AppointmentsResource	travelcrm.resources.appointments	Employees to positions of company appointments	\N	0
69	865	persons	Persons	PersonsResource	travelcrm.resources.persons	Persons directory. Person can be client or potential client	\N	0
70	872	countries	Countries	CountriesResource	travelcrm.resources.countries	Countries directory	\N	0
71	901	advsources	Advertises Sources	AdvsourcesResource	travelcrm.resources.advsources	Types of advertises	\N	0
72	908	hotelcats	Hotels Categories	HotelcatsResource	travelcrm.resources.hotelcats	Hotels categories	\N	0
73	909	roomcats	Rooms Categories	RoomcatsResource	travelcrm.resources.roomcats	Categories of the rooms	\N	0
75	954	foodcats	Foods Categories	FoodcatsResource	travelcrm.resources.foodcats	Food types in hotels	\N	0
78	1003	suppliers	Suppliers	SuppliersResource	travelcrm.resources.suppliers	Suppliers, such as touroperators, aircompanies, IATA etc.	\N	0
79	1007	bpersons	Business Persons	BPersonsResource	travelcrm.resources.bpersons	Business Persons is not clients it's simple business contacts that can be referenced objects that needs to have contacts	\N	0
83	1081	hotels	Hotels	HotelsResource	travelcrm.resources.hotels	Hotels directory	\N	0
84	1088	locations	Locations	LocationsResource	travelcrm.resources.locations	Locations list is list of cities, vilages etc. places to use to identify part of region	\N	0
86	1189	contracts	Contracts	ContractsResource	travelcrm.resources.contracts	Licences list for any type of resources as need	\N	0
87	1190	contacts	Contacts	ContactsResource	travelcrm.resources.contacts	Contacts for persons, business persons etc.	\N	0
89	1198	passports	Passports	PassportsResource	travelcrm.resources.passports	Clients persons passports lists	\N	0
90	1207	addresses	Addresses	AddressesResource	travelcrm.resources.addresses	Addresses of any type of resources, such as persons, bpersons, hotels etc.	\N	0
91	1211	banks	Banks	BanksResource	travelcrm.resources.banks	Banks list to create bank details and for other reasons	\N	0
93	1225	tasks	Tasks	TasksResource	travelcrm.resources.tasks	Task manager	\N	0
101	1268	banks_details	Banks Details	BanksDetailsResource	travelcrm.resources.banks_details	Banks Details that can be attached to any client or business partner to define account	\N	0
102	1313	services	Services	ServicesResource	travelcrm.resources.services	Additional Services that can be provide with tours sales or separate	\N	0
104	1393	currencies_rates	Currency Rates	CurrenciesRatesResource	travelcrm.resources.currencies_rates	Currencies Rates. Values from this dir used by billing to calc prices in base currency.	\N	0
105	1424	accounts_items	Accounts Items	AccountsItemsResource	travelcrm.resources.accounts_items	Finance accounts items	\N	0
106	1433	incomes	Incomes	IncomesResource	travelcrm.resources.incomes	Incomes Payments Document for invoices	{"account_item_id": 8}	0
107	1435	accounts	Accounts	AccountsResource	travelcrm.resources.accounts	Billing Accounts. It can be bank accouts, cash accounts etc. and has company wide visible	null	0
117	1797	subaccounts	Subaccounts	SubaccountsResource	travelcrm.resources.subaccounts	Subaccounts are accounts from other objects such as clients, touroperators and so on	null	0
118	1799	notes	Notes	NotesResource	travelcrm.resources.notes	Resources Notes	null	0
119	1849	calculations	Caluclations	CalculationsResource	travelcrm.resources.calculations	Calculations of Sale Documents	null	0
121	1894	turnovers	Turnovers	TurnoversResource	travelcrm.resources.turnovers	Turnovers on Accounts and Subaccounts	null	0
122	1919	debts	Debts	DebtsResource	travelcrm.resources.debts	Calculations based debts report	null	0
126	1968	companies	Companies	CompaniesResource	travelcrm.resources.companies	Multicompanies functionality	null	0
129	1989	sales_dynamics	Portlet: Sales Dynamics	SalesDynamicsResource	travelcrm.resources.sales_dynamics	Portlet that shows dynamics of sales in quantity	{"column_index": 0}	0
130	2049	leads	Leads	LeadsResource	travelcrm.resources.leads	Leads that can be converted into contacts	null	0
134	2099	orders	Orders	OrdersResource	travelcrm.resources.orders	Orders	null	0
135	2100	orders_items	Orders Items	OrdersItemsResource	travelcrm.resources.orders_items	Orders Items	null	0
137	2108	tours	Tours	ToursResource	travelcrm.resources.tours	Tour Service	null	0
146	2296	leads_offers	Leads Offers	LeadsOffersResource	travelcrm.resources.leads_offers	Leads Offers	null	0
74	953	accomodations	Accomodations	AccomodationsResource	travelcrm.resources.accomodations	Accomodations Types list	\N	0
110	1521	commissions	Commissions	CommissionsResource	travelcrm.resources.commissions	Services sales commissions	null	0
111	1548	outgoings	Outgoings	OutgoingsResource	travelcrm.resources.outgoings	Outgoings payments for touroperators, suppliers, payback payments and so on	null	0
120	1884	crosspayments	Cross Payments	CrosspaymentsResource	travelcrm.resources.crosspayments	Cross payments between accounts and subaccounts. This document is for balance corrections to.	null	0
123	1941	notifications	Notifications	NotificationsResource	travelcrm.resources.notifications	Employee Notifications	null	0
124	1954	emails_campaigns	Email Campaigns	EmailsCampaignsResource	travelcrm.resources.emails_campaigns	Emails Campaigns for subscribers	{"timeout": 12}	0
125	1966	unpaids	Portlet: Unpaid Invoices	UnpaidsResource	travelcrm.resources.unpaids	Portlet that shows invoices which has no any pay and active date is over	{"column_index": 1}	0
138	2127	transfers	Transfers	TransfersResource	travelcrm.resources.transfers	Transfers for tours	null	0
139	2135	transports	Transports	TransportsResource	travelcrm.resources.transports	Transports Types List	null	0
140	2217	suppliers_types	Suppliers Types	SuppliersTypesResource	travelcrm.resources.suppliers_types	Suppliers Types list	null	0
141	2243	tickets_classes	Tickets Classes	TicketsClassesResource	travelcrm.resources.tickets_classes	Tickets Classes list, such as first class, business class etc	null	0
142	2244	tickets	Tickets	TicketsResource	travelcrm.resources.tickets	Ticket is a service for sale tickets of any type	null	0
143	2268	visas	Visas	VisasResource	travelcrm.resources.visas	Visa is a service for sale visas	null	0
144	2276	spassports	Passports Services	SpassportsResource	travelcrm.resources.spassports	Service formulation of foreign passports	null	0
\.


--
-- Data for Name: roomcat; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY roomcat (id, resource_id, name) FROM stdin;
2	921	BDR
3	922	BDRM
4	923	Superior
5	924	Studio
6	925	Family Room
7	926	Family Studio
8	927	Extra Bed
9	928	Suite
10	929	Suite Mini
11	930	Junior Suite
12	931	De Luxe
13	932	Executive Suite
14	933	Suite Senior
16	935	Honeymoon Room
17	936	Connected Rooms
18	937	Duplex
19	938	Apartment
20	939	President
21	940	Balcony
22	941	City View
23	942	Beach View
24	943	Pool View
25	944	Garden View
26	945	Ocean View
27	946	Land View
28	947	Dune View
29	948	Mountain View
30	949	Park View
31	950	SV (Sea view)
33	952	Inside View
\.


--
-- Name: roomcat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('roomcat_id_seq', 34, true);


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY service (id, resource_id, name, descr, display_text, resource_type_id) FROM stdin;
7	2247	Ticket	\N	Ticket booking service	142
5	1413	Tour	Use this service for tour sales	Tour booking service	137
4	1318	A visa	\N	The issues for visas	143
1	1314	Foreign Passport Service	\N	Formulation of foreign passport	144
\.


--
-- Name: service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('service_id_seq', 7, true);


--
-- Data for Name: spassport; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY spassport (id, resource_id, photo_done, docs_receive_date, docs_transfer_date, passport_receive_date, descr) FROM stdin;
1	2279	t	2015-04-29	2015-04-30	2015-05-10	Must be done in 10 days after docs recieved
\.


--
-- Name: spassport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('spassport_id_seq', 1, true);


--
-- Data for Name: spassport_order_item; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY spassport_order_item (order_item_id, spassport_id) FROM stdin;
35	1
\.


--
-- Data for Name: structure; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY structure (id, resource_id, parent_id, name, company_id) FROM stdin;
2	858	\N	Kiev Office	1
3	859	2	Sales Department	1
4	860	32	Marketing Dep.	1
1	857	32	Software Dev. Dep.	1
5	861	32	CEO	1
7	1062	\N	Moscow Office	1
8	1250	\N	Odessa Office	1
9	1251	8	Sales Department	1
11	1277	\N	Lviv Office	1
32	725	\N	Head Office	1
13	1976	\N	Dnepropetrovsk Office	1
\.


--
-- Data for Name: structure_address; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY structure_address (structure_id, address_id) FROM stdin;
32	31
\.


--
-- Data for Name: structure_bank_detail; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY structure_bank_detail (structure_id, bank_detail_id) FROM stdin;
\.


--
-- Data for Name: structure_contact; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY structure_contact (structure_id, contact_id) FROM stdin;
\.


--
-- Name: structures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('structures_id_seq', 13, true);


--
-- Data for Name: subaccount; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY subaccount (id, resource_id, account_id, name, descr, status) FROM stdin;
1	1865	4	Vitalii Mazur EUR | cash	\N	0
2	1866	2	News Travel | Bank	\N	0
3	1867	4	Alexander Karpenko | EUR	\N	0
4	1868	3	Garkaviy Andriy | UAH	\N	0
6	1875	3	Main Cash Account | rid: 1628	\N	0
8	1881	3	Main Cash Account | rid: 1372	\N	0
9	1888	2	Lun Real Estate | UAH	Month Rate	0
10	1902	3	Lun Real Estate | UAH | CASH	Lun on cash account	0
11	1911	4	Main Cash EUR Account | rid: 1465	\N	0
12	1913	2	Sun Marino Trvl | Cash UAH	Sun Marino Main Bank Subaccount	0
13	1991	3	Main Cash Account | rid: 1471	\N	0
14	1997	3	Main Cash Account | rid: 1645	\N	0
15	2002	3	Main Cash Account | rid: 1869	\N	0
16	2007	3	Main Cash Account | rid: 887	\N	0
17	2028	3	Main Cash Account | rid: 2017	\N	0
18	2438	4	COMPANY EUR CASH	Main company Eur cash subaccount	0
20	2440	2	COMPANY UAH BANK	Main Company Uah bank account subaccount	0
19	2439	3	COMPANY UAH CASH	Main company Uah cash subaccount	0
21	2442	3	Stepanchuk Sergey, UAH, cash	\N	0
22	2452	4	Oleg, EUR, cash	\N	0
23	2466	3	Tez Tour UAH, cash	Tez tour cash UAH subaccount	0
\.


--
-- Name: subaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('subaccount_id_seq', 23, true);


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY supplier (id, resource_id, name, status, descr, supplier_type_id) FROM stdin;
65	2216	New Wind	0	First touroperator	1
66	2223	MAU	0	Internation Ukrainian Airlines	2
68	2225	Four Winds	0		1
69	2226	Akkord Tour	0		1
86	2227	Feerija	0		1
87	2228	TEZ Tour	0		1
88	2229	Gamalija	0		1
67	2224	News Travel	1	Cyprus touroperator only	1
89	2230	Voyage De Luxe	0		1
90	2231	IdrisKa tour	0		1
91	2232	Anex Tour	0		1
92	2233	TUI	0		1
93	2234	Turtess Travel	0		1
94	2235	Coral Travel	0		1
96	2237	Natali Turs	0		1
97	2238	Kiy Avia	0		2
98	2239	MIBS Travel	0		1
99	2240	SAM	0		1
100	2241	Pilot	0		1
101	2242	Orbita	0		1
95	2236	Pan Ukraine	1		1
102	2272	Ukrainian Visa Center	0		3
\.


--
-- Data for Name: supplier_bank_detail; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY supplier_bank_detail (supplier_id, bank_detail_id) FROM stdin;
\.


--
-- Data for Name: supplier_bperson; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY supplier_bperson (supplier_id, bperson_id) FROM stdin;
65	7
\.


--
-- Data for Name: supplier_contract; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY supplier_contract (supplier_id, contract_id) FROM stdin;
65	50
65	49
\.


--
-- Data for Name: supplier_subaccount; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY supplier_subaccount (supplier_id, subaccount_id) FROM stdin;
87	23
\.


--
-- Data for Name: supplier_type; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY supplier_type (id, resource_id, name, descr) FROM stdin;
1	2218	Touroperator	
2	2221	Aircompany	
3	2271	Visa Center	
\.


--
-- Name: supplier_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('supplier_type_id_seq', 3, true);


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY task (id, resource_id, employee_id, title, deadline, descr, status, reminder) FROM stdin;
37	1933	2	Call and remind about payment	2014-12-14 22:46:00+02	\N	3	\N
38	1934	2	Call and remind about payment	2014-12-12 22:50:00+02	Call and remind to pay invoice	0	\N
39	1935	2	Review Calculation	2014-12-12 22:52:00+02	\N	0	\N
40	1936	2	For testing Purpose only	2014-12-14 22:35:00+02	\N	0	\N
33	1922	30	Test	2014-12-07 21:36:00+02	For testing purpose	1	\N
55	2063	2	Revert status after testing	2015-03-08 19:41:00+02	Set status into active after testing	0	\N
56	2066	2	Notifications testing #2	2015-03-11 17:16:00+02	\N	0	\N
57	2068	2	Test Notification resource link	2015-03-11 19:28:00+02	\N	0	\N
48	1980	2	Check Reminder	2015-01-08 18:21:00+02	Description to task	3	\N
47	1971	2	Check Payments	2015-01-04 15:45:00+02	\N	1	\N
41	1939	2	I have the following code	2014-12-13 23:36:00+02	\N	3	\N
46	1964	2	For testing	2014-12-25 23:05:00+02	For testing purpose only	3	\N
45	1962	2	Test	2014-12-24 23:32:00+02	\N	3	\N
52	2009	2	I decided to try to follow the postgres approach as directly as possible and came up with the following migration.	2015-01-21 22:44:00+02	\N	1	\N
54	2062	2	New JEasyui version migrate	2015-03-07 21:43:00+02	Migrate on new 0.4.2 jeasyui version, check all functionality.	2	\N
44	1958	2	Test new scheduler realization	2014-12-22 19:18:00+02	New scheduler realizations notifications test.	3	\N
35	1930	2	Check Person Details	2014-12-11 21:43:00+02	We'll reuse the Amount type from last week. It's mostly the same, except we'll remove __clause_element__(), and additionally provide a classmethod version of the as_currency() method, which we'll use when dealing with SQL expressions.	2	\N
49	1982	2	The second task	2015-01-08 18:30:00+02	Second test task	1	\N
50	1983	2	Test	2015-01-13 17:06:00+02	\N	1	\N
51	1985	2	Test 2	2015-01-14 17:02:00+02	\N	1	\N
53	2016	2	Notify his	2015-02-02 17:09:00+02	Notify about the documents	3	\N
42	1940	2	Test notifications	2014-12-14 21:37:00+02	\N	2	\N
36	1932	2	Call and remind about payments	2014-12-11 22:48:00+02	\N	1	\N
59	2131	2	Task For Lastovec	2015-04-23 15:32:00+03	Test description for task	0	\N
60	2171	2	Test for	2015-04-28 10:38:00+03	\N	0	\N
67	2197	2	Check reminder	2015-05-03 13:45:00+03	\N	0	10
68	2291	2	Call and ansswer about discount	2015-05-19 16:39:00+03	talk about discount	0	10
58	2075	2	Call about discounts	2015-03-21 17:20:00+02	Calls and talk about tour discounts	3	10
69	2303	2	Call about offer	2015-05-24 17:30:00+03	\N	0	10
70	2311	2	Select hotels and hot tours	2015-05-25 10:35:00+03	\N	0	10
71	2371	2	Call to client	2015-06-08 15:00:00+03	Call to client with success bucking	0	30
72	2381	2	Make an Invoice	2015-06-06 22:12:00+03	Make invoice for this order	0	10
73	2436	2	Позвонить клиент	2015-06-11 08:12:00+03	\N	0	10
\.


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('task_id_seq', 73, true);


--
-- Data for Name: task_resource; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY task_resource (task_id, resource_id) FROM stdin;
35	1869
47	1840
48	3
49	3
53	2017
55	1989
59	2126
69	2088
58	2088
70	2312
68	2284
71	2372
72	2382
73	2434
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY ticket (id, resource_id, start_location_id, end_location_id, ticket_class_id, transport_id, start_dt, start_additional_info, end_dt, end_additional_info, adults, children, descr) FROM stdin;
2	2255	15	21	2	1	2015-05-10 14:11:00+03	\N	2015-05-10 15:26:00+03	\N	2	0	\N
3	2257	15	21	2	1	2015-05-16 14:38:00+03	\N	2015-05-16 15:39:00+03	\N	2	0	\N
4	2259	21	15	2	1	2015-05-22 17:38:00+03	\N	2015-05-22 18:39:00+03	\N	2	0	\N
5	2261	15	21	2	1	2015-05-15 17:52:00+03	\N	2015-05-15 18:52:00+03	\N	2	0	\N
6	2263	21	15	2	1	2015-05-22 17:52:00+03	\N	2015-05-22 18:52:00+03	\N	2	0	\N
7	2288	15	37	2	1	2015-05-29 15:46:00+03	TICKET INFO	2015-05-29 17:31:00+03	\N	2	0	\N
\.


--
-- Data for Name: ticket_class; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY ticket_class (id, resource_id, name) FROM stdin;
1	2248	First class
2	2249	Business Class
\.


--
-- Name: ticket_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('ticket_class_id_seq', 2, true);


--
-- Name: ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('ticket_id_seq', 7, true);


--
-- Data for Name: ticket_order_item; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY ticket_order_item (order_item_id, ticket_id) FROM stdin;
28	2
29	3
30	4
31	5
32	6
38	7
\.


--
-- Data for Name: tour; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY tour (id, resource_id, start_location_id, end_location_id, hotel_id, accomodation_id, foodcat_id, roomcat_id, adults, children, start_date, end_date, descr, end_transport_id, start_transport_id, transfer_id, end_additional_info, start_additional_info) FROM stdin;
1	2145	15	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	MAU	MAU
2	2147	14	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
3	2149	15	37	36	\N	\N	\N	2	0	2015-04-25	2015-04-30	\N	1	1	\N	\N	\N
4	2151	15	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
5	2153	15	14	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
6	2155	3	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
7	2157	15	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
8	2159	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
9	2161	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
10	2163	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
11	2165	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
12	2168	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
13	2173	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
14	2175	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
15	2177	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
16	2179	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
17	2181	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
18	2183	33	37	36	\N	\N	\N	2	0	2015-04-30	2015-05-08	\N	1	1	\N	\N	\N
19	2185	33	37	36	\N	15	30	2	0	2015-04-30	2015-05-08	Description for service	1	1	\N	\N	\N
20	2188	33	37	36	\N	15	30	2	0	2015-04-30	2015-05-08	Description for service	1	1	\N	\N	\N
21	2190	33	37	36	\N	15	30	2	0	2015-04-30	2015-05-08	Description for service	1	1	\N	\N	\N
22	2266	15	20	12	2	15	30	2	0	2015-05-16	2015-05-23	\N	1	1	\N	\N	\N
24	2286	15	31	32	12	16	26	2	0	2015-05-20	2015-05-27	\N	1	1	\N	\N	\N
23	2283	15	19	16	\N	\N	\N	2	0	2015-05-22	2015-05-29	\N	1	1	\N	\N	\N
26	2342	15	19	16	10	15	\N	2	1	2015-07-13	2015-07-18	\N	1	1	\N	#MAU	#MAU
27	2378	15	39	39	10	10	\N	2	0	2015-06-28	2015-07-04	\N	1	1	\N	#MAU	#MAU
25	2316	15	19	18	10	10	33	2	0	2015-06-21	2015-06-27	\N	1	1	\N	# MAU	# MAU
\.


--
-- Name: tour_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('tour_id_seq1', 27, true);


--
-- Data for Name: tour_order_item; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY tour_order_item (order_item_id, tour_id) FROM stdin;
33	22
36	23
37	24
39	25
40	26
42	27
\.


--
-- Name: touroperator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('touroperator_id_seq', 102, true);


--
-- Data for Name: transfer; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY transfer (id, resource_id, name) FROM stdin;
1	2129	Group
2	2130	Individual
\.


--
-- Name: transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('transfer_id_seq', 218, true);


--
-- Name: transfer_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('transfer_id_seq1', 2, true);


--
-- Data for Name: transport; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY transport (id, resource_id, name) FROM stdin;
1	2137	Avia
2	2138	Auto
3	2139	Railway
\.


--
-- Name: transport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('transport_id_seq', 3, true);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY "user" (id, resource_id, username, email, password, employee_id) FROM stdin;
2	3	admin	vitalii.mazur@gmail.com	adminadmin	2
25	2054	maz_iv	\N	korn17	30
23	894	maziv	\N	111111	7
31	2126	v.lastovec	\N	111111	15
\.


--
-- Data for Name: visa; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY visa (id, resource_id, country_id, start_date, end_date, type, descr) FROM stdin;
1	2274	21	2015-05-31	2016-05-31	0	\N
2	2344	17	2015-08-01	2015-09-01	0	\N
3	2380	12	2015-06-14	2016-06-14	0	\N
\.


--
-- Name: visa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mazvv
--

SELECT pg_catalog.setval('visa_id_seq', 3, true);


--
-- Data for Name: visa_order_item; Type: TABLE DATA; Schema: public; Owner: mazvv
--

COPY visa_order_item (order_item_id, visa_id) FROM stdin;
34	1
41	2
43	3
\.


--
-- Name: accomodation_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY accomodation
    ADD CONSTRAINT accomodation_pkey PRIMARY KEY (id);


--
-- Name: account_item_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY account_item
    ADD CONSTRAINT account_item_pkey PRIMARY KEY (id);


--
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: advsource_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY advsource
    ADD CONSTRAINT advsource_pkey PRIMARY KEY (id);


--
-- Name: appointment_header_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY appointment
    ADD CONSTRAINT appointment_header_pk PRIMARY KEY (id);


--
-- Name: apscheduler_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY apscheduler_jobs
    ADD CONSTRAINT apscheduler_jobs_pkey PRIMARY KEY (id);


--
-- Name: bank_address_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY bank_address
    ADD CONSTRAINT bank_address_pkey PRIMARY KEY (bank_id, address_id);


--
-- Name: bank_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY bank_detail
    ADD CONSTRAINT bank_detail_pkey PRIMARY KEY (id);


--
-- Name: bank_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);


--
-- Name: bperson_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY bperson_contact
    ADD CONSTRAINT bperson_contact_pkey PRIMARY KEY (bperson_id, contact_id);


--
-- Name: bperson_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY bperson
    ADD CONSTRAINT bperson_pkey PRIMARY KEY (id);


--
-- Name: calculation_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY calculation
    ADD CONSTRAINT calculation_pkey PRIMARY KEY (id);


--
-- Name: commission_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY commission
    ADD CONSTRAINT commission_pkey PRIMARY KEY (id);


--
-- Name: company_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: company_subaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY company_subaccount
    ADD CONSTRAINT company_subaccount_pkey PRIMARY KEY (company_id, subaccount_id);


--
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: contract_commission_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY contract_commission
    ADD CONSTRAINT contract_commission_pkey PRIMARY KEY (contract_id, commission_id);


--
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: crosspayment_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY crosspayment
    ADD CONSTRAINT crosspayment_pkey PRIMARY KEY (id);


--
-- Name: currency_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pk PRIMARY KEY (id);


--
-- Name: currency_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY currency_rate
    ADD CONSTRAINT currency_rate_pkey PRIMARY KEY (id);


--
-- Name: email_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY email_campaign
    ADD CONSTRAINT email_campaign_pkey PRIMARY KEY (id);


--
-- Name: employee_address_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY employee_address
    ADD CONSTRAINT employee_address_pkey PRIMARY KEY (employee_id, address_id);


--
-- Name: employee_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY employee_contact
    ADD CONSTRAINT employee_contact_pkey PRIMARY KEY (employee_id, contact_id);


--
-- Name: employee_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY employee_notification
    ADD CONSTRAINT employee_notification_pkey PRIMARY KEY (employee_id, notification_id);


--
-- Name: employee_passport_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY employee_passport
    ADD CONSTRAINT employee_passport_pkey PRIMARY KEY (employee_id, passport_id);


--
-- Name: employee_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pk PRIMARY KEY (id);


--
-- Name: employee_subaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY employee_subaccount
    ADD CONSTRAINT employee_subaccount_pkey PRIMARY KEY (employee_id, subaccount_id);


--
-- Name: foodcat_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY foodcat
    ADD CONSTRAINT foodcat_pkey PRIMARY KEY (id);


--
-- Name: hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id);


--
-- Name: hotelcat_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY hotelcat
    ADD CONSTRAINT hotelcat_pkey PRIMARY KEY (id);


--
-- Name: income_cashflow_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY income_cashflow
    ADD CONSTRAINT income_cashflow_pkey PRIMARY KEY (income_id, cashflow_id);


--
-- Name: income_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY income
    ADD CONSTRAINT income_pkey PRIMARY KEY (id);


--
-- Name: invoice_item_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invoice_item_pkey PRIMARY KEY (id);


--
-- Name: invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- Name: lead_item_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY lead_item
    ADD CONSTRAINT lead_item_pkey PRIMARY KEY (id);


--
-- Name: lead_offer_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY lead_offer
    ADD CONSTRAINT lead_offer_pkey PRIMARY KEY (id);


--
-- Name: lead_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY lead
    ADD CONSTRAINT lead_pkey PRIMARY KEY (id);


--
-- Name: licence_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY contract
    ADD CONSTRAINT licence_pkey PRIMARY KEY (id);


--
-- Name: location_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: navigation_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY navigation
    ADD CONSTRAINT navigation_pk PRIMARY KEY (id);


--
-- Name: note_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: note_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY note_resource
    ADD CONSTRAINT note_resource_pkey PRIMARY KEY (note_id, resource_id);


--
-- Name: notification_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: notification_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY notification_resource
    ADD CONSTRAINT notification_resource_pkey PRIMARY KEY (notification_id, resource_id);


--
-- Name: order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: outgoing_cashflow_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY outgoing_cashflow
    ADD CONSTRAINT outgoing_cashflow_pkey PRIMARY KEY (outgoing_id, cashflow_id);


--
-- Name: outgoing_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY outgoing
    ADD CONSTRAINT outgoing_pkey PRIMARY KEY (id);


--
-- Name: passport_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY passport
    ADD CONSTRAINT passport_pkey PRIMARY KEY (id);


--
-- Name: permision_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY permision
    ADD CONSTRAINT permision_pk PRIMARY KEY (id);


--
-- Name: person_address_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY person_address
    ADD CONSTRAINT person_address_pkey PRIMARY KEY (person_id, address_id);


--
-- Name: person_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY person_contact
    ADD CONSTRAINT person_contact_pkey PRIMARY KEY (person_id, contact_id);


--
-- Name: person_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY person_order_item
    ADD CONSTRAINT person_order_item_pkey PRIMARY KEY (order_item_id, person_id);


--
-- Name: person_passport_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY person_passport
    ADD CONSTRAINT person_passport_pkey PRIMARY KEY (person_id, passport_id);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: person_subaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY person_subaccount
    ADD CONSTRAINT person_subaccount_pkey PRIMARY KEY (person_id, subaccount_id);


--
-- Name: position_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY "position"
    ADD CONSTRAINT position_pk PRIMARY KEY (id);


--
-- Name: region_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pk PRIMARY KEY (id);


--
-- Name: resource_log_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY resource_log
    ADD CONSTRAINT resource_log_pk PRIMARY KEY (id);


--
-- Name: resource_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pk PRIMARY KEY (id);


--
-- Name: resource_type_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY resource_type
    ADD CONSTRAINT resource_type_pk PRIMARY KEY (id);


--
-- Name: roomcat_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY roomcat
    ADD CONSTRAINT roomcat_pkey PRIMARY KEY (id);


--
-- Name: service_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: spassport_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY spassport_order_item
    ADD CONSTRAINT spassport_order_item_pkey PRIMARY KEY (order_item_id, spassport_id);


--
-- Name: spassport_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY spassport
    ADD CONSTRAINT spassport_pkey PRIMARY KEY (id);


--
-- Name: structure_address_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY structure_address
    ADD CONSTRAINT structure_address_pkey PRIMARY KEY (structure_id, address_id);


--
-- Name: structure_bank_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY structure_bank_detail
    ADD CONSTRAINT structure_bank_detail_pkey PRIMARY KEY (structure_id, bank_detail_id);


--
-- Name: structure_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY structure_contact
    ADD CONSTRAINT structure_contact_pkey PRIMARY KEY (structure_id, contact_id);


--
-- Name: structure_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY structure
    ADD CONSTRAINT structure_pk PRIMARY KEY (id);


--
-- Name: subaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY subaccount
    ADD CONSTRAINT subaccount_pkey PRIMARY KEY (id);


--
-- Name: supplier_bank_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY supplier_bank_detail
    ADD CONSTRAINT supplier_bank_detail_pkey PRIMARY KEY (supplier_id, bank_detail_id);


--
-- Name: supplier_bperson_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY supplier_bperson
    ADD CONSTRAINT supplier_bperson_pkey PRIMARY KEY (supplier_id, bperson_id);


--
-- Name: supplier_contract_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY supplier_contract
    ADD CONSTRAINT supplier_contract_pkey PRIMARY KEY (supplier_id, contract_id);


--
-- Name: supplier_subaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY supplier_subaccount
    ADD CONSTRAINT supplier_subaccount_pkey PRIMARY KEY (supplier_id, subaccount_id);


--
-- Name: supplier_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY supplier_type
    ADD CONSTRAINT supplier_type_pkey PRIMARY KEY (id);


--
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: task_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY task_resource
    ADD CONSTRAINT task_resource_pkey PRIMARY KEY (task_id, resource_id);


--
-- Name: ticket_class_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY ticket_class
    ADD CONSTRAINT ticket_class_pkey PRIMARY KEY (id);


--
-- Name: ticket_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY ticket_order_item
    ADD CONSTRAINT ticket_order_item_pkey PRIMARY KEY (order_item_id, ticket_id);


--
-- Name: ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id);


--
-- Name: tour_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY tour_order_item
    ADD CONSTRAINT tour_order_item_pkey PRIMARY KEY (order_item_id, tour_id);


--
-- Name: tour_pkey1; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT tour_pkey1 PRIMARY KEY (id);


--
-- Name: touroperator_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY supplier
    ADD CONSTRAINT touroperator_pkey PRIMARY KEY (id);


--
-- Name: transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY cashflow
    ADD CONSTRAINT transfer_pkey PRIMARY KEY (id);


--
-- Name: transfer_pkey1; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY transfer
    ADD CONSTRAINT transfer_pkey1 PRIMARY KEY (id);


--
-- Name: transport_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (id);


--
-- Name: unique_idx_accomodation_name; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY accomodation
    ADD CONSTRAINT unique_idx_accomodation_name UNIQUE (name);


--
-- Name: unique_idx_country_iso_code; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT unique_idx_country_iso_code UNIQUE (iso_code);


--
-- Name: unique_idx_currency_iso_code; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT unique_idx_currency_iso_code UNIQUE (iso_code);


--
-- Name: unique_idx_currency_rate_currency_id_date; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY currency_rate
    ADD CONSTRAINT unique_idx_currency_rate_currency_id_date UNIQUE (currency_id, date, supplier_id);


--
-- Name: unique_idx_name_account; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT unique_idx_name_account UNIQUE (name);


--
-- Name: unique_idx_name_account_id_subaccount; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY subaccount
    ADD CONSTRAINT unique_idx_name_account_id_subaccount UNIQUE (name, account_id);


--
-- Name: unique_idx_name_account_item; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY account_item
    ADD CONSTRAINT unique_idx_name_account_item UNIQUE (name);


--
-- Name: unique_idx_name_advsource; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY advsource
    ADD CONSTRAINT unique_idx_name_advsource UNIQUE (name);


--
-- Name: unique_idx_name_bank; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY bank
    ADD CONSTRAINT unique_idx_name_bank UNIQUE (name);


--
-- Name: unique_idx_name_company; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT unique_idx_name_company UNIQUE (name);


--
-- Name: unique_idx_name_country_id_region; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT unique_idx_name_country_id_region UNIQUE (name, country_id);


--
-- Name: unique_idx_name_foodcat; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY foodcat
    ADD CONSTRAINT unique_idx_name_foodcat UNIQUE (name);


--
-- Name: unique_idx_name_hotelcat; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY hotelcat
    ADD CONSTRAINT unique_idx_name_hotelcat UNIQUE (name);


--
-- Name: unique_idx_name_region_id_location; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT unique_idx_name_region_id_location UNIQUE (name, region_id);


--
-- Name: unique_idx_name_roomcat; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY roomcat
    ADD CONSTRAINT unique_idx_name_roomcat UNIQUE (name);


--
-- Name: unique_idx_name_service; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT unique_idx_name_service UNIQUE (name);


--
-- Name: unique_idx_name_strcuture_id_position; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY "position"
    ADD CONSTRAINT unique_idx_name_strcuture_id_position UNIQUE (name, structure_id);


--
-- Name: unique_idx_name_supplier_type; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY supplier_type
    ADD CONSTRAINT unique_idx_name_supplier_type UNIQUE (name);


--
-- Name: unique_idx_name_ticket_class; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY ticket_class
    ADD CONSTRAINT unique_idx_name_ticket_class UNIQUE (name);


--
-- Name: unique_idx_name_transfer; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY transfer
    ADD CONSTRAINT unique_idx_name_transfer UNIQUE (name);


--
-- Name: unique_idx_name_transport; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY transport
    ADD CONSTRAINT unique_idx_name_transport UNIQUE (name);


--
-- Name: unique_idx_resource_type_id_position_id_permision; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY permision
    ADD CONSTRAINT unique_idx_resource_type_id_position_id_permision UNIQUE (resource_type_id, position_id);


--
-- Name: unique_idx_resource_type_module; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY resource_type
    ADD CONSTRAINT unique_idx_resource_type_module UNIQUE (module, resource_name);


--
-- Name: unique_idx_resource_type_name; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY resource_type
    ADD CONSTRAINT unique_idx_resource_type_name UNIQUE (name);


--
-- Name: unique_idx_users_email; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT unique_idx_users_email UNIQUE (email);


--
-- Name: unique_idx_users_username; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT unique_idx_users_username UNIQUE (username);


--
-- Name: user_pk; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: visa_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY visa_order_item
    ADD CONSTRAINT visa_order_item_pkey PRIMARY KEY (order_item_id, visa_id);


--
-- Name: visa_pkey; Type: CONSTRAINT; Schema: public; Owner: mazvv; Tablespace: 
--

ALTER TABLE ONLY visa
    ADD CONSTRAINT visa_pkey PRIMARY KEY (id);


--
-- Name: ix_apscheduler_jobs_next_run_time; Type: INDEX; Schema: public; Owner: mazvv; Tablespace: 
--

CREATE INDEX ix_apscheduler_jobs_next_run_time ON apscheduler_jobs USING btree (next_run_time);


--
-- Name: fk_accomodation_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_accomodation_id_tour FOREIGN KEY (accomodation_id) REFERENCES accomodation(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_account_id_invoice; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT fk_account_id_invoice FOREIGN KEY (account_id) REFERENCES account(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_account_item_id_cashflow; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY income
    ADD CONSTRAINT fk_account_item_id_cashflow FOREIGN KEY (account_item_id) REFERENCES account_item(id);


--
-- Name: fk_account_item_id_outgoing; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY outgoing
    ADD CONSTRAINT fk_account_item_id_outgoing FOREIGN KEY (account_item_id) REFERENCES account_item(id);


--
-- Name: fk_account_item_id_transfer; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY cashflow
    ADD CONSTRAINT fk_account_item_id_transfer FOREIGN KEY (account_item_id) REFERENCES account_item(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_account_item_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY account_item
    ADD CONSTRAINT fk_account_item_parent_id FOREIGN KEY (parent_id) REFERENCES account_item(id);


--
-- Name: fk_address_id_bank_address; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bank_address
    ADD CONSTRAINT fk_address_id_bank_address FOREIGN KEY (address_id) REFERENCES address(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_address_id_employee_address; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee_address
    ADD CONSTRAINT fk_address_id_employee_address FOREIGN KEY (address_id) REFERENCES address(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_address_id_person_address; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person_address
    ADD CONSTRAINT fk_address_id_person_address FOREIGN KEY (address_id) REFERENCES address(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_address_id_structure_address; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY structure_address
    ADD CONSTRAINT fk_address_id_structure_address FOREIGN KEY (address_id) REFERENCES address(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_advsource_id_lead; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead
    ADD CONSTRAINT fk_advsource_id_lead FOREIGN KEY (advsource_id) REFERENCES advsource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_advsource_id_order; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT fk_advsource_id_order FOREIGN KEY (advsource_id) REFERENCES advsource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_bank_detail_id_structure_bank_detail; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY structure_bank_detail
    ADD CONSTRAINT fk_bank_detail_id_structure_bank_detail FOREIGN KEY (bank_detail_id) REFERENCES bank_detail(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_bank_detail_id_supplier_bank_detail; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier_bank_detail
    ADD CONSTRAINT fk_bank_detail_id_supplier_bank_detail FOREIGN KEY (bank_detail_id) REFERENCES bank_detail(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_bank_id_bank_address; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bank_address
    ADD CONSTRAINT fk_bank_id_bank_address FOREIGN KEY (bank_id) REFERENCES bank(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_bank_id_bank_detail; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bank_detail
    ADD CONSTRAINT fk_bank_id_bank_detail FOREIGN KEY (bank_id) REFERENCES bank(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_bperson_id_bperson_contact; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bperson_contact
    ADD CONSTRAINT fk_bperson_id_bperson_contact FOREIGN KEY (bperson_id) REFERENCES bperson(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_bperson_id_supplier_bperson; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier_bperson
    ADD CONSTRAINT fk_bperson_id_supplier_bperson FOREIGN KEY (bperson_id) REFERENCES bperson(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_cashflow_id_crosspayment; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY crosspayment
    ADD CONSTRAINT fk_cashflow_id_crosspayment FOREIGN KEY (cashflow_id) REFERENCES cashflow(id);


--
-- Name: fk_cashflow_id_income_cashflow; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY income_cashflow
    ADD CONSTRAINT fk_cashflow_id_income_cashflow FOREIGN KEY (cashflow_id) REFERENCES cashflow(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_cashflow_id_outgoing_cashflow; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY outgoing_cashflow
    ADD CONSTRAINT fk_cashflow_id_outgoing_cashflow FOREIGN KEY (cashflow_id) REFERENCES cashflow(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_commission_id_contract_commission; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY contract_commission
    ADD CONSTRAINT fk_commission_id_contract_commission FOREIGN KEY (commission_id) REFERENCES commission(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_company_id_company_subaccount; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY company_subaccount
    ADD CONSTRAINT fk_company_id_company_subaccount FOREIGN KEY (company_id) REFERENCES company(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_contact_id_bperson_contact; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bperson_contact
    ADD CONSTRAINT fk_contact_id_bperson_contact FOREIGN KEY (contact_id) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_contact_id_employee_contact; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee_contact
    ADD CONSTRAINT fk_contact_id_employee_contact FOREIGN KEY (contact_id) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_contact_id_employee_notification; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee_notification
    ADD CONSTRAINT fk_contact_id_employee_notification FOREIGN KEY (notification_id) REFERENCES notification(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_contact_id_person_contact; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person_contact
    ADD CONSTRAINT fk_contact_id_person_contact FOREIGN KEY (contact_id) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_contact_id_structure_contact; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY structure_contact
    ADD CONSTRAINT fk_contact_id_structure_contact FOREIGN KEY (contact_id) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_contract_id_contract_commission; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY contract_commission
    ADD CONSTRAINT fk_contract_id_contract_commission FOREIGN KEY (contract_id) REFERENCES contract(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_contract_id_supplier_contract; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier_contract
    ADD CONSTRAINT fk_contract_id_supplier_contract FOREIGN KEY (contract_id) REFERENCES contract(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_country_id_passport; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY passport
    ADD CONSTRAINT fk_country_id_passport FOREIGN KEY (country_id) REFERENCES country(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_country_id_visa; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY visa
    ADD CONSTRAINT fk_country_id_visa FOREIGN KEY (country_id) REFERENCES country(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_currency_id_account; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_currency_id_account FOREIGN KEY (currency_id) REFERENCES currency(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_currency_id_appointment; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY appointment
    ADD CONSTRAINT fk_currency_id_appointment FOREIGN KEY (currency_id) REFERENCES currency(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_currency_id_bank_detail; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bank_detail
    ADD CONSTRAINT fk_currency_id_bank_detail FOREIGN KEY (currency_id) REFERENCES currency(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_currency_id_commission; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY commission
    ADD CONSTRAINT fk_currency_id_commission FOREIGN KEY (currency_id) REFERENCES currency(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_currency_id_company; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY company
    ADD CONSTRAINT fk_currency_id_company FOREIGN KEY (currency_id) REFERENCES currency(id);


--
-- Name: fk_currency_id_lead_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_item
    ADD CONSTRAINT fk_currency_id_lead_item FOREIGN KEY (currency_id) REFERENCES currency(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_currency_id_lead_offer; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_offer
    ADD CONSTRAINT fk_currency_id_lead_offer FOREIGN KEY (currency_id) REFERENCES currency(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_currency_id_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT fk_currency_id_order_item FOREIGN KEY (currency_id) REFERENCES currency(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_currency_id_service_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY calculation
    ADD CONSTRAINT fk_currency_id_service_item FOREIGN KEY (currency_id) REFERENCES currency(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_currency_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY currency_rate
    ADD CONSTRAINT fk_currency_id_tour FOREIGN KEY (currency_id) REFERENCES currency(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_customer_id_lead; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead
    ADD CONSTRAINT fk_customer_id_lead FOREIGN KEY (customer_id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_customer_id_order; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT fk_customer_id_order FOREIGN KEY (customer_id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_employee_id_appointment; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY appointment
    ADD CONSTRAINT fk_employee_id_appointment FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_employee_id_employee_address; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee_address
    ADD CONSTRAINT fk_employee_id_employee_address FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_employee_id_employee_contact; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee_contact
    ADD CONSTRAINT fk_employee_id_employee_contact FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_employee_id_employee_notification; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee_notification
    ADD CONSTRAINT fk_employee_id_employee_notification FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_employee_id_employee_passport; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee_passport
    ADD CONSTRAINT fk_employee_id_employee_passport FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_employee_id_employee_subaccount; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee_subaccount
    ADD CONSTRAINT fk_employee_id_employee_subaccount FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_employee_id_resource_log; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY resource_log
    ADD CONSTRAINT fk_employee_id_resource_log FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_employee_id_task; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk_employee_id_task FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_employee_id_user; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT fk_employee_id_user FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_end_location_id_ticket; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fk_end_location_id_ticket FOREIGN KEY (end_location_id) REFERENCES location(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_end_location_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_end_location_id_tour FOREIGN KEY (end_location_id) REFERENCES location(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_end_transport_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_end_transport_id_tour FOREIGN KEY (end_transport_id) REFERENCES transport(id);


--
-- Name: fk_foodcat_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_foodcat_id_tour FOREIGN KEY (foodcat_id) REFERENCES foodcat(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_hotel_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_hotel_id_tour FOREIGN KEY (hotel_id) REFERENCES hotel(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_hotelcat_id_hotel; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY hotel
    ADD CONSTRAINT fk_hotelcat_id_hotel FOREIGN KEY (hotelcat_id) REFERENCES hotelcat(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_income_id_income_cashflow; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY income_cashflow
    ADD CONSTRAINT fk_income_id_income_cashflow FOREIGN KEY (income_id) REFERENCES income(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_invoice_id_income; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY income
    ADD CONSTRAINT fk_invoice_id_income FOREIGN KEY (invoice_id) REFERENCES invoice(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_invoice_id_invoice_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT fk_invoice_id_invoice_item FOREIGN KEY (invoice_id) REFERENCES invoice(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_lead_id_lead_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_item
    ADD CONSTRAINT fk_lead_id_lead_item FOREIGN KEY (lead_id) REFERENCES lead(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_lead_id_lead_offer; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_offer
    ADD CONSTRAINT fk_lead_id_lead_offer FOREIGN KEY (lead_id) REFERENCES lead(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_lead_id_order; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT fk_lead_id_order FOREIGN KEY (lead_id) REFERENCES lead(id);


--
-- Name: fk_location_id_address; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_location_id_address FOREIGN KEY (location_id) REFERENCES location(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_location_id_hotel; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY hotel
    ADD CONSTRAINT fk_location_id_hotel FOREIGN KEY (location_id) REFERENCES location(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_navigation_position_id; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY navigation
    ADD CONSTRAINT fk_navigation_position_id FOREIGN KEY (position_id) REFERENCES "position"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_note_id_note_resource; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY note_resource
    ADD CONSTRAINT fk_note_id_note_resource FOREIGN KEY (note_id) REFERENCES note(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_notification_id_notification_resource; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY notification_resource
    ADD CONSTRAINT fk_notification_id_notification_resource FOREIGN KEY (notification_id) REFERENCES notification(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_order_id_invoice; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT fk_order_id_invoice FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- Name: fk_order_id_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT fk_order_id_order_item FOREIGN KEY (order_id) REFERENCES "order"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_order_item_id_caluclation; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY calculation
    ADD CONSTRAINT fk_order_item_id_caluclation FOREIGN KEY (order_item_id) REFERENCES order_item(id);


--
-- Name: fk_order_item_id_invoice_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT fk_order_item_id_invoice_item FOREIGN KEY (order_item_id) REFERENCES order_item(id);


--
-- Name: fk_order_item_id_person_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person_order_item
    ADD CONSTRAINT fk_order_item_id_person_order_item FOREIGN KEY (order_item_id) REFERENCES order_item(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_order_item_id_spassport_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY spassport_order_item
    ADD CONSTRAINT fk_order_item_id_spassport_order_item FOREIGN KEY (order_item_id) REFERENCES order_item(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_order_item_id_ticket_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY ticket_order_item
    ADD CONSTRAINT fk_order_item_id_ticket_order_item FOREIGN KEY (order_item_id) REFERENCES order_item(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_order_item_id_tour_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour_order_item
    ADD CONSTRAINT fk_order_item_id_tour_order_item FOREIGN KEY (order_item_id) REFERENCES order_item(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_order_item_id_visa_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY visa_order_item
    ADD CONSTRAINT fk_order_item_id_visa_order_item FOREIGN KEY (order_item_id) REFERENCES order_item(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_outgoing_id_outgoing_cashflow; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY outgoing_cashflow
    ADD CONSTRAINT fk_outgoing_id_outgoing_cashflow FOREIGN KEY (outgoing_id) REFERENCES outgoing(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_parent_id_navigation; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY navigation
    ADD CONSTRAINT fk_parent_id_navigation FOREIGN KEY (parent_id) REFERENCES navigation(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_passport_id_employee_passport; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee_passport
    ADD CONSTRAINT fk_passport_id_employee_passport FOREIGN KEY (passport_id) REFERENCES passport(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_passport_id_person_passport; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person_passport
    ADD CONSTRAINT fk_passport_id_person_passport FOREIGN KEY (passport_id) REFERENCES passport(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_permision_structure_id; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY permision
    ADD CONSTRAINT fk_permision_structure_id FOREIGN KEY (structure_id) REFERENCES structure(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_person_id_person_address; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person_address
    ADD CONSTRAINT fk_person_id_person_address FOREIGN KEY (person_id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_person_id_person_contact; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person_contact
    ADD CONSTRAINT fk_person_id_person_contact FOREIGN KEY (person_id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_person_id_person_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person_order_item
    ADD CONSTRAINT fk_person_id_person_order_item FOREIGN KEY (person_id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_person_id_person_passport; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person_passport
    ADD CONSTRAINT fk_person_id_person_passport FOREIGN KEY (person_id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_person_id_person_subaccount; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person_subaccount
    ADD CONSTRAINT fk_person_id_person_subaccount FOREIGN KEY (person_id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_position_id_appointment; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY appointment
    ADD CONSTRAINT fk_position_id_appointment FOREIGN KEY (position_id) REFERENCES "position"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_position_id_permision; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY permision
    ADD CONSTRAINT fk_position_id_permision FOREIGN KEY (position_id) REFERENCES "position"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_position_structure_id; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "position"
    ADD CONSTRAINT fk_position_structure_id FOREIGN KEY (structure_id) REFERENCES structure(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_region_country_id; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY region
    ADD CONSTRAINT fk_region_country_id FOREIGN KEY (country_id) REFERENCES country(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_region_id_location; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY location
    ADD CONSTRAINT fk_region_id_location FOREIGN KEY (region_id) REFERENCES region(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_accomodation; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY accomodation
    ADD CONSTRAINT fk_resource_id_accomodation FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_account; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY account
    ADD CONSTRAINT fk_resource_id_account FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_account_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY account_item
    ADD CONSTRAINT fk_resource_id_account_item FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_address; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_resource_id_address FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_advsource; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY advsource
    ADD CONSTRAINT fk_resource_id_advsource FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_appointment; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY appointment
    ADD CONSTRAINT fk_resource_id_appointment FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_bank; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bank
    ADD CONSTRAINT fk_resource_id_bank FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_bank_detail; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bank_detail
    ADD CONSTRAINT fk_resource_id_bank_detail FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_bperson; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY bperson
    ADD CONSTRAINT fk_resource_id_bperson FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_calculation; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY calculation
    ADD CONSTRAINT fk_resource_id_calculation FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_commission; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY commission
    ADD CONSTRAINT fk_resource_id_commission FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_company; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY company
    ADD CONSTRAINT fk_resource_id_company FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_contact; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT fk_resource_id_contact FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_country; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY country
    ADD CONSTRAINT fk_resource_id_country FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_crosspayment; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY crosspayment
    ADD CONSTRAINT fk_resource_id_crosspayment FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_currency; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT fk_resource_id_currency FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_email_campaign; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY email_campaign
    ADD CONSTRAINT fk_resource_id_email_campaign FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_employee; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT fk_resource_id_employee FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_foodcat; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY foodcat
    ADD CONSTRAINT fk_resource_id_foodcat FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_hotel; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY hotel
    ADD CONSTRAINT fk_resource_id_hotel FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_hotelcat; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY hotelcat
    ADD CONSTRAINT fk_resource_id_hotelcat FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_income; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY income
    ADD CONSTRAINT fk_resource_id_income FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_invoice; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT fk_resource_id_invoice FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_lead; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead
    ADD CONSTRAINT fk_resource_id_lead FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_lead_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_item
    ADD CONSTRAINT fk_resource_id_lead_item FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_lead_offer; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_offer
    ADD CONSTRAINT fk_resource_id_lead_offer FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_licence; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY contract
    ADD CONSTRAINT fk_resource_id_licence FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_location; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY location
    ADD CONSTRAINT fk_resource_id_location FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_navigation; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY navigation
    ADD CONSTRAINT fk_resource_id_navigation FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_note; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY note
    ADD CONSTRAINT fk_resource_id_note FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_note_resource; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY note_resource
    ADD CONSTRAINT fk_resource_id_note_resource FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_notification; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT fk_resource_id_notification FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_notification_resource; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY notification_resource
    ADD CONSTRAINT fk_resource_id_notification_resource FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_order; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT fk_resource_id_order FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT fk_resource_id_order_item FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_outgoing; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY outgoing
    ADD CONSTRAINT fk_resource_id_outgoing FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_passport; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY passport
    ADD CONSTRAINT fk_resource_id_passport FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_person; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_resource_id_person FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_position; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "position"
    ADD CONSTRAINT fk_resource_id_position FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_region; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY region
    ADD CONSTRAINT fk_resource_id_region FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_resource_log; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY resource_log
    ADD CONSTRAINT fk_resource_id_resource_log FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_resource_id_resource_type; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY resource_type
    ADD CONSTRAINT fk_resource_id_resource_type FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_roomcat; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY roomcat
    ADD CONSTRAINT fk_resource_id_roomcat FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_service; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY service
    ADD CONSTRAINT fk_resource_id_service FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_spassport; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY spassport
    ADD CONSTRAINT fk_resource_id_spassport FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_structure; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY structure
    ADD CONSTRAINT fk_resource_id_structure FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_subaccount; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY subaccount
    ADD CONSTRAINT fk_resource_id_subaccount FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_supplier_type; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier_type
    ADD CONSTRAINT fk_resource_id_supplier_type FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_task; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk_resource_id_task FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_task_resource; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY task_resource
    ADD CONSTRAINT fk_resource_id_task_resource FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_ticket; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fk_resource_id_ticket FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_ticket_class; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY ticket_class
    ADD CONSTRAINT fk_resource_id_ticket_class FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY currency_rate
    ADD CONSTRAINT fk_resource_id_tour FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_resource_id_tour FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_touroperator; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier
    ADD CONSTRAINT fk_resource_id_touroperator FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_transfer; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY transfer
    ADD CONSTRAINT fk_resource_id_transfer FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_transport; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY transport
    ADD CONSTRAINT fk_resource_id_transport FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_user; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT fk_resource_id_user FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_id_visa; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY visa
    ADD CONSTRAINT fk_resource_id_visa FOREIGN KEY (resource_id) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_type_id_permission; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY permision
    ADD CONSTRAINT fk_resource_type_id_permission FOREIGN KEY (resource_type_id) REFERENCES resource_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_resource_type_id_resource; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT fk_resource_type_id_resource FOREIGN KEY (resource_type_id) REFERENCES resource_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_resource_type_id_service; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY service
    ADD CONSTRAINT fk_resource_type_id_service FOREIGN KEY (resource_type_id) REFERENCES resource_type(id);


--
-- Name: fk_roomcat_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_roomcat_id_tour FOREIGN KEY (roomcat_id) REFERENCES roomcat(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_service_id_commission; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY commission
    ADD CONSTRAINT fk_service_id_commission FOREIGN KEY (service_id) REFERENCES service(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_service_id_lead_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_item
    ADD CONSTRAINT fk_service_id_lead_item FOREIGN KEY (service_id) REFERENCES service(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_service_id_lead_offer; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_offer
    ADD CONSTRAINT fk_service_id_lead_offer FOREIGN KEY (service_id) REFERENCES service(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_service_id_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT fk_service_id_order_item FOREIGN KEY (service_id) REFERENCES service(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_spassport_id_spassport_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY spassport_order_item
    ADD CONSTRAINT fk_spassport_id_spassport_order_item FOREIGN KEY (spassport_id) REFERENCES spassport(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_start_location_id_ticket; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fk_start_location_id_ticket FOREIGN KEY (start_location_id) REFERENCES location(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_start_location_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_start_location_id_tour FOREIGN KEY (start_location_id) REFERENCES location(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_start_transport_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_start_transport_id_tour FOREIGN KEY (start_transport_id) REFERENCES transport(id);


--
-- Name: fk_structure_company_id; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY structure
    ADD CONSTRAINT fk_structure_company_id FOREIGN KEY (company_id) REFERENCES company(id);


--
-- Name: fk_structure_id_resource; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT fk_structure_id_resource FOREIGN KEY (structure_id) REFERENCES structure(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_structure_id_structure_address; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY structure_address
    ADD CONSTRAINT fk_structure_id_structure_address FOREIGN KEY (structure_id) REFERENCES structure(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_structure_id_structure_bank_detail; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY structure_bank_detail
    ADD CONSTRAINT fk_structure_id_structure_bank_detail FOREIGN KEY (structure_id) REFERENCES structure(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_structure_id_structure_contact; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY structure_contact
    ADD CONSTRAINT fk_structure_id_structure_contact FOREIGN KEY (structure_id) REFERENCES structure(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_structure_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY structure
    ADD CONSTRAINT fk_structure_parent_id FOREIGN KEY (parent_id) REFERENCES structure(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_subaccount_account_id; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY subaccount
    ADD CONSTRAINT fk_subaccount_account_id FOREIGN KEY (account_id) REFERENCES account(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_subaccount_from_id_transfer; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY cashflow
    ADD CONSTRAINT fk_subaccount_from_id_transfer FOREIGN KEY (subaccount_from_id) REFERENCES subaccount(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_subaccount_id_company_subaccount; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY company_subaccount
    ADD CONSTRAINT fk_subaccount_id_company_subaccount FOREIGN KEY (subaccount_id) REFERENCES subaccount(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_subaccount_id_employee_subaccount; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY employee_subaccount
    ADD CONSTRAINT fk_subaccount_id_employee_subaccount FOREIGN KEY (subaccount_id) REFERENCES subaccount(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_subaccount_id_outgoing; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY outgoing
    ADD CONSTRAINT fk_subaccount_id_outgoing FOREIGN KEY (subaccount_id) REFERENCES subaccount(id);


--
-- Name: fk_subaccount_id_person_subaccount; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY person_subaccount
    ADD CONSTRAINT fk_subaccount_id_person_subaccount FOREIGN KEY (subaccount_id) REFERENCES subaccount(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_subaccount_id_supplier_subaccount; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier_subaccount
    ADD CONSTRAINT fk_subaccount_id_supplier_subaccount FOREIGN KEY (subaccount_id) REFERENCES subaccount(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_subaccount_to_id_transfer; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY cashflow
    ADD CONSTRAINT fk_subaccount_to_id_transfer FOREIGN KEY (subaccount_to_id) REFERENCES subaccount(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_supplier_id_currency_rate; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY currency_rate
    ADD CONSTRAINT fk_supplier_id_currency_rate FOREIGN KEY (supplier_id) REFERENCES supplier(id);


--
-- Name: fk_supplier_id_lead_offer; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY lead_offer
    ADD CONSTRAINT fk_supplier_id_lead_offer FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_supplier_id_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT fk_supplier_id_order_item FOREIGN KEY (supplier_id) REFERENCES supplier(id);


--
-- Name: fk_supplier_id_supplier_bank_detail; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier_bank_detail
    ADD CONSTRAINT fk_supplier_id_supplier_bank_detail FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_supplier_id_supplier_bperson; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier_bperson
    ADD CONSTRAINT fk_supplier_id_supplier_bperson FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_supplier_id_supplier_contract; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier_contract
    ADD CONSTRAINT fk_supplier_id_supplier_contract FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_supplier_id_supplier_subaccount; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier_subaccount
    ADD CONSTRAINT fk_supplier_id_supplier_subaccount FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_supplier_type_id_supplier; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY supplier
    ADD CONSTRAINT fk_supplier_type_id_supplier FOREIGN KEY (supplier_type_id) REFERENCES supplier_type(id);


--
-- Name: fk_task_id_task_resource; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY task_resource
    ADD CONSTRAINT fk_task_id_task_resource FOREIGN KEY (task_id) REFERENCES task(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_ticket_class_id_ticket; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fk_ticket_class_id_ticket FOREIGN KEY (ticket_class_id) REFERENCES ticket_class(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_ticket_id_ticket_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY ticket_order_item
    ADD CONSTRAINT fk_ticket_id_ticket_order_item FOREIGN KEY (ticket_id) REFERENCES ticket(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_tour_id_tour_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour_order_item
    ADD CONSTRAINT fk_tour_id_tour_order_item FOREIGN KEY (tour_id) REFERENCES tour(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_transfer_id_tour; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY tour
    ADD CONSTRAINT fk_transfer_id_tour FOREIGN KEY (transfer_id) REFERENCES transfer(id);


--
-- Name: fk_transport_id_ticket; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fk_transport_id_ticket FOREIGN KEY (transport_id) REFERENCES transport(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: fk_visa_id_visa_order_item; Type: FK CONSTRAINT; Schema: public; Owner: mazvv
--

ALTER TABLE ONLY visa_order_item
    ADD CONSTRAINT fk_visa_id_visa_order_item FOREIGN KEY (visa_id) REFERENCES visa(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
