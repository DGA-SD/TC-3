-- Database: dgahici_db_t1

-- DROP DATABASE dgahici_db_t1;

CREATE DATABASE dgahici_db_t1
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE dgahici_db_t1
    IS 'for DGA_RC project local db test1';


--# crNationality
CREATE TABLE IF NOT EXISTS crNationality
(
    NationalityCode character varying(3) NOT NULL,
    NationalityTextTH character varying(100),
    NationalityTextEN character varying(100),
    PRIMARY KEY (NationalityCode)
);

--# crPersonNameTitle
CREATE TABLE IF NOT EXISTS crPersonNameTitle
(
    PersonNameTitleCode integer NOT NULL,
    PersonNameTitleTextTH character varying(50),
    PersonNameTitleTextEN character varying(50),
    PRIMARY KEY (PersonNameTitleCode)
);

--# crGender
CREATE TABLE IF NOT EXISTS crGender
(
	GenderCode integer NOT NULL,
    GenderTextTH character varying(50),
    GenderTextEN character varying(50),
    PRIMARY KEY (GenderCode)
);

--#emPatientCommitStatus
CREATE TABLE IF NOT EXISTS emPatientCommitStatus
(
	PatientCommitStatusCode integer NOT NULL,
    PatientCommitStatusTextTH character varying(50),
    PatientCommitStautsTextEN character varying(50),
    PRIMARY KEY (PatientCommitStatusCode)
);

--#emHICI
CREATE TABLE IF NOT EXISTS emHICI
(
	HICICode character varying(2) NOT NULL,
    HICIName character varying(50),
    HICIText character varying(50),
    PRIMARY KEY (HICICode)
);

--#emHICIType
CREATE TABLE IF NOT EXISTS emHICIType
(
	HICITypeCode character varying(2) NOT NULL,
    HICITypeText character varying(100),
    
    PRIMARY KEY (HICITypeCode)
);

--#cdMedicalDoctor

CREATE TABLE IF NOT EXISTS cdMedicalDoctor
(
	MedicalDoctorCode character varying(10) NOT NULL,
    MedicalDoctorFirstName character varying(100),
    MedicalDoctorLastName character varying(100),
	MedicalDoctorMiddleName character varying(100),
	MedicalDoctorText character varying(200),
	HICICode character varying(2),
    PRIMARY KEY (MedicalDoctorCode)
	
);

--#crProvince
CREATE TABLE IF NOT EXISTS crProvince
(
	ProvinceCode character varying(2) NOT NULL,
    ProvinceTextTH character varying(100),
    ProvinceTextEN character varying(100),
    PRIMARY KEY (ProvinceCode)
);

--#crAmpur

CREATE TABLE IF NOT EXISTS crAmpur
(
	AmpurCode character varying(4) NOT NULL,
    AmpurTextTH character varying(100),
    AmpurTextEN character varying(100),
    PRIMARY KEY (AmpurCode)
);

--#crTumbol

CREATE TABLE IF NOT EXISTS crTumbol
(
	TumbolCode character varying(6) NOT NULL,
    TumbolTextTH character varying(100),
    TumbolTextEN character varying(100),
    PRIMARY KEY (TumbolCode)
);

--#crZone
CREATE TABLE IF NOT EXISTS crZone
(
	ZoneCode integer NOT NULL,
    ZoneTextTH character varying(100),
    ZoneTextEN character varying(100),
    PRIMARY KEY (ZoneCode)
);

--#cdOrganizationMedicalUnitType
CREATE TABLE IF NOT EXISTS cdOrganizationMedicalUnitType
(
	OrganizationMedicalUnitTypeCode integer NOT NULL,
    OrganizationMedicalUnitTypeText character varying(100),
    
    PRIMARY KEY (OrganizationMedicalUnitTypeCode)
);

--#cdOrganizationMedicalUnit
CREATE TABLE IF NOT EXISTS cdOrganizationMedicalUnit
(
	OrganizationMedicalUnitCode character varying(10) NOT NULL,
	OrganizationMedicalUnitTypeCode integer NOT NULL,
    OrganizationMedicalUnitName character varying(100),
    OrganizationMedicalUnitText character varying(100),
    PRIMARY KEY (OrganizationMedicalUnitCode,OrganizationMedicalUnitTypeCode)
);

--#emMovementMethod
CREATE TABLE IF NOT EXISTS emMovementMethod
(
	MovementMethodCode integer NOT NULL,
    MovementMethodText character varying(100),
    
    PRIMARY KEY (MovementMethodCode)
);

--#emPatient  ;The fact table.
CREATE TABLE IF NOT EXISTS emPatient
(
	emPatientID SERIAL PRIMARY KEY,
	PersonID character varying(13) ,
	PersonForeignID character varying(20) ,
    PersonPassportID character varying(20),
    PersonNationalityCode character varying(3),
    PersonNameTitleCode integer,
	PersonFirstName character varying(100),
	PersonMiddleName character varying(100),
	PersonLastName	character varying(100),
	PersonGenderCode integer,
	PersonAge	integer,
	PersonBirthDate	character varying(8),
	PersonPhone1 character varying(50),
	PersonPhone2 character varying(50),
	PersonCustodialPhone1 character varying(50),
	PersonCustodialPhone2 character varying(50),
	PersonWeightMeasure numeric(5,2),
	PersonHeightMeasure numeric(5,2),
	PersonBMIMeasure	numeric(5,2),
	PatientCommitStatusCode integer,
	
	PatientCommitTemperature numeric(5,2),
	PatientCommitPulse numeric(5,2),
	PatientCommitOxygenSaturation numeric(5,2),
	PatientCommitOxygenSaturationPost numeric(5,2),
	PatientCommitOxygenSaturationDiff numeric(5,2),
	PatientCommitSystolic numeric(5,2),
	PatientCommitDiastolic numeric(5,2),
	PatientCommitInspirationRate numeric(5,2),
	PatientCommitSymptomsText character varying(500),
	
	PatientSymptomsCL1 boolean,
	PatientSymptomsCL2 boolean,
	PatientSymptomsCL3 boolean,
	PatientSymptomsCL4 boolean,
	PatientSymptomsCL5 boolean,
	PatientSymptomsCL6 boolean,
	PatientSymptomsCL7 boolean,
	PatientSymptomsCL8 boolean,
	PatientSymptomsCL9 boolean,
	PatientSymptomsCL10 boolean,
	PatientSymptomsCL11 boolean,
	PatientSymptomsCL12 boolean,
	PatientSymptomsCL13 boolean,
	PatientSymptomsCL14 boolean,
	PatientDiseaseCD1 boolean,
	PatientDiseaseCD2 boolean,
	PatientDiseaseCD3 boolean,
	PatientDiseaseCD4 boolean,
	PatientDiseaseCD5 boolean,
	PatientDiseaseCD6 boolean,
	PatientDiseaseCD7 boolean,
	PatientDiseaseCD8 boolean,
	
	HICICode character varying(2),
	HICITypeCode character varying(2),
	MedicalDoctorCode character varying(10),
	PatientCheckInDate TIMESTAMP,
	PatientCheckOutDate TIMESTAMP,
	
	ProvinceCode character varying(2),
	AmpurCode character varying(4),
	TumbolCode character varying(6),
	Road	character varying(50),
	Trok	character varying(50),
	Soi		character varying(50),
	Village character varying(50),
	ZoneCode integer,
	BuildingName character varying(100),
	AddressText character varying(200),
	GeographicCoordinateLatitude float8,
	GeographicCoordinateLongitude float8,
	
	PatientCommitDateTime TIMESTAMP,
	PatientPickupDateTime TIMESTAMP,	
	PatientWaitingHour integer,

	MoveToLocationCode integer,
	MoveToLocationTypeCode integer,

	MoveToMethodCode integer
	
);
	
	
	
)

