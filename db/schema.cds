using { managed } from '@sap/cds/common';
namespace sap.capire.dmd;

type WaveStatus : String enum {
  YET_TO_START;
  IN_PROGRESS;
  COMPLETED;
  ON_HOLD;
}

// NEW: This entity provides the clean list for the dropdown
entity StatusValues {
  key code : String;
      text : String;
}

entity Mocks : managed {
  key ID            : Integer;
  name              : String(10);
  owner             : String(12);
  startDate         : Date;
  endDate           : Date;
  actualStartDate   : Date;
  actualEndDate     : Date;
  status            : WaveStatus;
  completionPercent : Integer;
  streams           : String(10);
}