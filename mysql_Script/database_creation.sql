CREATE DATABASE NURSE_WORKFLOW;

USE NURSE_WORKFLOW;
CREATE TABLE ACTIVITY(
       ACTIVITY_ID INT NOT NULL AUTO_INCREMENT,
       ACTIVITY_NAME VARCHAR(100) NOT NULL, 
       ACTIVITY_DESCRIPTION VARCHAR(40) NOT NULL, 
       PRIMARY KEY ( ACTIVITY_ID ));
	   
	   
CREATE TABLE LAYOUT(
       LAYOUT_ID INT NOT NULL AUTO_INCREMENT,
       LAYOUT_NAME VARCHAR(100) NOT NULL, 
       FILENAME VARCHAR(40) NOT NULL, 
       PRIMARY KEY ( LAYOUT_ID ));
	   
CREATE TABLE PARTICIPANT(
       PARTICIPANT_ID INT NOT NULL AUTO_INCREMENT,
       PARTICIPANT_NAME VARCHAR(100) NOT NULL, 
       PARTICIPANT_DESCRIPTION VARCHAR(40) NOT NULL, 
       PRIMARY KEY ( PARTICIPANT_ID));	   
	   
CREATE TABLE PROJECT(
       PROJECT_ID INT NOT NULL AUTO_INCREMENT,
       PROJECT_NAME VARCHAR(100) NOT NULL, 
       PROJECT_DESCRIPTION VARCHAR(40) NOT NULL, 
	   LAYOUT_ID_FK INT NOT NULL, 
       PRIMARY KEY ( PROJECT_ID ));	   
	   
CREATE TABLE ACTIVITY_REL(
       ACTIVITY_REL_ID INT NOT NULL AUTO_INCREMENT,
       ACTIVITY_ID_FK INT NOT NULL,
       PROJECT_ID_FK INT NOT NULL	   
       PRIMARY KEY ( ACTIVITY_REL_ID ));	  	   
	   
CREATE TABLE PARTICIPANT_REL(
       PARTICIPANT_REL_ID INT NOT NULL AUTO_INCREMENT,
       PARTICIPANT_ID_FK INT NOT NULL,
       PROJECT_ID_FK INT NOT NULL	   
       PRIMARY KEY ( PARTICIPANT_REL_ID ));	   
	   
CREATE TABLE LAYOUT_LOC_REL(
       LAYOUT_LOC_REL_ID INT NOT NULL AUTO_INCREMENT,
       LAYOUT_ID_FK INT NOT NULL,
       LOCATION_ID INT NOT NULL,
       LOCATION_NAME VARCHAR(100) NOT NULL,	
       X1_Y2  INT NOT NULL,
       X2_Y1  INT NOT NULL,  	   
       PRIMARY KEY ( LAYOUT_LOC_REL_ID ));	
	   
CREATE TABLE DATA_LOGGER(
       DATA_LOGGER_ID INT NOT NULL AUTO_INCREMENT,
       PROJECT_ID_FK INT NOT NULL,
       PARTICIPANT_ID INT NOT NULL,
       LAYOUT_LOC_REL_FK INT NOT NULL,	
	   ACTIVITY_ID INT NOT NULL,
       TIME_IN  INT NOT NULL,
       TIME_OUT  INT NOT NULL,  	   
       PRIMARY KEY ( DATA_LOGGER_ID ));	
	   
	   