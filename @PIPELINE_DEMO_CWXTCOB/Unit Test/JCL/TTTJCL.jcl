${TOTALTEST_JOBCARD}
//*JOBPARM S=*
//*
//*** THE JOB CARD MUST INCLUDE A NOTIFY STATEMENT SUCH
//*** AS NOTIFY=&SYSUID and also a REGION=0M parameter
//*
//********************************************************************
//* Execute Target Runner
//********************************************************************
//RUNNER EXEC PGM=TTTRUNNR
//*
//* This is a dynamic JCL skeleton for submitting Total Test that can
//* be reused for all test cases.
//* The first DD statement is automatically setup at execution time
//* with the ECC SLCXLOAD dataset that contains the Topaz for Total
//* Test TTTRUNNR program.
//* The second DD statement is automatically setup with the loadlib(s)
//* containing the programs to run during the test.
//* The third DD statement is only required if running the JCL
//* from Topaz for Total Test CLI with Code Coverage support.
//* If testing an LE application it should be changed to the
//* loadlib containing the COBOL runtime(CEE.SCEERUN), otherwise
//* it can be removed.
//*
//* The skeleton can be modified as needed
//*
//STEPLIB DD DISP=SHR,DSN=SYS2.CW.&CWGACX..SLCXLOAD
//        DD DISP=SHR,DSN=CEE.SCEERUN
//        DD DISP=SHR,DSN=SALESSUP.ISPW.DEMJ.UT1.LOAD
//        DD DISP=SHR,DSN=SALESSUP.ISPW.DEMJ.SI1.LOAD
//        DD DISP=SHR,DSN=SALESSUP.ISPW.DEMJ.PT.LOAD
//        DD DISP=SHR,DSN=SALESSUP.ISPW.DEMJ.HON.LOAD
//*
//* The following lines will initialize storage to zeroes to avoid
//* uninitialized storage assertion miscompares.
//CEEOPTS  DD  *
STORAGE(00,00,00)
/*
//TRPARM DD *
*
*        Optionally set your custom exit program here:
*
EXIT(NONE)
*
REPEAT(${TOTALTEST_REPEAT}),STUBS(${TOTALTEST_STUBS}),
DEBUG(OFF)
/*
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD
//*
//*      Optionally add your custom DD statements
//*DD1 DD DSN=HLQ.CUSTOM.TEST.LOAD,DISP=SHR
//SYSPRINT DD SYSOUT=*
//*
