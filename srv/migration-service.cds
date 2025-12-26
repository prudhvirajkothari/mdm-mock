using { sap.capire.dmd as db } from '../db/schema';

service MockService {

    @readonly
    entity MockOverview as projection on db.Mocks {
        key ID                as MockID,
        name                  as MockName,
        
        @Common.Text: StatusText 
        @Common.TextArrangement: #TextOnly
        status                as Status,

        case
            when status = 'COMPLETED'    then 'Completed'
            when status = 'IN_PROGRESS'  then 'In Progress'
            when status = 'ON_HOLD'      then 'On Hold'
            when status = 'YET_TO_START' then 'Yet to Start'
            else status
        end as StatusText : String,

        case
            when status = 'COMPLETED'    then 3
            when status = 'IN_PROGRESS'  then 2
            when status = 'ON_HOLD'      then 1
            when status = 'YET_TO_START' then 5
            else 0
        end as StatusCriticality : Integer,

        startDate             as StartDate,
        endDate               as EndDate,
        completionPercent     as LoadingStatus,
        streams               as TotalStreams,
        streams               as StreamsCompleted,
        streams as Time
    };

    @readonly
    entity StatusValues {
        key code : String;
    }
}