using { MockService } from '../srv/migration-service';

annotate MockService.MockOverview with @UI: {
    // FIX: This section replaces the ID with the Mock Name in the detail page header
    HeaderInfo: {
        TypeName: 'Mock',
        TypeNamePlural: 'Mocks',
        Title: { 
            $Type: 'UI.DataField', 
            Value: MockName 
        },
        Description: {
            $Type: 'UI.DataField',
            Value: Status
        }
    },
    SelectionFields: [ MockName, Status ],
    LineItem: [
        { $Type: 'UI.DataField', Value: MockID, Label: 'S.NO' },
        { $Type: 'UI.DataField', Value: MockName, Label: 'Mock' },
        {
            $Type: 'UI.DataField',
            Value: Status,
            Criticality: StatusCriticality,
            Label: 'Status'
        },
        { $Type: 'UI.DataField', Value: StartDate, Label: 'Start Date' },
        { $Type: 'UI.DataField', Value: EndDate, Label: 'End Date' },
        { $Type: 'UI.DataField', Value: LoadingStatus, Label: 'Loading Status' },
        { $Type: 'UI.DataField', Value: TotalStreams, Label: 'Total Streams' },
        { $Type: 'UI.DataField', Value: StreamsCompleted, Label: 'Streams Completed' },
        { $Type: 'UI.DataField', Value: Time, Label: 'Time' }
    ]
};

annotate MockService.MockOverview with {
    Status @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            CollectionPath: 'StatusValues',
            Parameters: [
                // FIX: Only one parameter here ensures the dropdown box is narrow
                { 
                    $Type: 'Common.ValueListParameterInOut', 
                    LocalDataProperty: Status, 
                    ValueListProperty: 'code' 
                }
            ]
        }
    );
};

annotate MockService.MockOverview with @Capabilities.SearchRestrictions : {
    Searchable : false
};