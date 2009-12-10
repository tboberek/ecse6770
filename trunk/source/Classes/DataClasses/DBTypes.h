/*
 *  DBTypes.h
 *  MobileHIS
 *
 *  Created by T.J. Boberek on 11/30/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

// Typedef for our ID Types
typedef int PatientID;
typedef int AllergyID;
typedef int ProcedureID;
typedef int DiagnosticTestID;
typedef	int ImmunizationID;
typedef int MedicationID;
typedef	int PrescriptionID;

//typedef int PatientAllergyID;
//typedef int PatientConditionID;

typedef enum ECSResult
{
	ECS_SUCCESS,
	ECS_UNKNOWN_FAILURE,

	ECS_LOGIN_FAILURE,
	ECS_LOGIN_DOCTOR,
	ECS_LOGIN_NURSE,
	ECS_LOGIN_NURSE_P,
	ECS_LOGIN_ADMINISTRATOR,
	ECS_LOGIN_PATIENT,
} ECSResult;