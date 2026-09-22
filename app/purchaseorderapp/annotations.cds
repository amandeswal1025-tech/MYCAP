using catalogService as service from '../../srv/catalogMyService';

annotate service.POs with @(

UI.SelectionFields:[
    PO_ID,
    PARTNER_GUID.COMPANY_NAME,
    PARTNER_GUID.ADDRESS_GUID.COUNTRY,
    GROSS_AMOUNT,
    CURRENCY_code
],
UI.LineItem :[

{
     $Type : 'UI.DataField',
     Value  :PO_ID ,
},
{
    $Type : 'UI.DataField',
    Value :PARTNER_GUID.COMPANY_NAME ,
},
{
    $Type : 'UI.DataField',
    Value :GROSS_AMOUNT ,
},
{
    $Type : 'UI.DataField',
    Value : CURRENCY_code,
},
 {
     $Type : 'UI.DataFieldForAction',
     Action : 'catalogservice.boost',
     Label : 'Boost',
     Inline : true,
 },
{
    $Type : 'UI.DataField',
    Value : OverallStatus,
    Criticality : Criticality
},
],
UI.HeaderInfo:

    {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title : {Value : PO_ID},
        Description : {Value: PARTNER_GUID.COMPANY_NAME},
        ImageUrl :'https://www.bing.com/th/id/OIP.Uk1Ex4nGPtWpV_A6JoK0oAHaHa?w=193&h=193&c=8&rs=1&qlt=90&o=6&pid=ImgAns&rm=2',
    },
    UI.Facets: [
        {
            $Type : 'UI.CollectionFacet',
            Label: 'More Info',
            Facets: [
               {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.Identification',
                Label : 'Details'
               },
                {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#Jat',
                Label : 'JAT'
               },
                {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#Deswal',
                Label : 'Deswal'
               },
               {
                $Type : 'UI.ReferenceFacet',
                Target: 'Items/@UI.LineItem',
                Label : 'Items'
               },
            ],
        },
        
    ],
    UI.Identification: [
       {
           $Type : 'UI.DataField',
           Value : PO_ID,
       },
       {
           $Type : 'UI.DataField',
           Value : PARTNER_GUID_NODE_KEY           
       },     
    ],
    UI.FieldGroup #Jat:{
Data: [
    {
        $Type : 'UI.DataField',
        Value : GROSS_AMOUNT,
    },
    {
        $Type : 'UI.DataField',
        Value : NET_AMOUNT,
    },
    {
        $Type : 'UI.DataField',
        Value : TAX_AMOUNT,
    },
       ]
    },

    UI.FieldGroup #Deswal:{
        Data:[
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ]
    }
) ; 
annotate service.POItems with @(
UI.LineItem: [
    {
        $Type : 'UI.DataField',
        Value : PO_ITEM_POS,
    },
    {
        $Type : 'UI.DataField',
        Value : CURRENCY,
    },
    {
        $Type : 'UI.DataField',
        Value : GROSS_AMOUNT,
    },
],
UI.HeaderInfo:
{
    TypeName: 'PO ITEM',
    TypeNamePlural: 'PO Items',
    Title: {Value: PO_ITEM_POS},
    Description: {Value: PRODUCT_GUID.DESCRIPTION}
},
UI.Facets: [
    {
        $Type : 'UI.ReferenceFacet',
         Target: @UI.Identification,
         Label: 'Line Details'
    }
],
UI.Identification: [
    {
        $Type : 'UI.DataField',
        Value : PO_ITEM_POS,
    },
    {
        $Type : 'UI.DataField',
        Value : PRODUCT_GUID,
    },
    {
        $Type : 'UI.DataField',
        Value : GROSS_AMOUNT,
    },
    {
        $Type : 'UI.DataField',
        Value : TAX_AMOUNT,
    },
    {
        $Type : 'UI.DataField',
        Value : CURRENCY,
    },
]
) ;
annotate service.POItems with{
    PRODUCT_GUID @(
        Common.Text: PRODUCT_GUID.DESCRIPTION,
        ValueList.entity: service.BusinessPartnerSet,
     )

} ;

@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(

UI.Identification:[
    {
        $Type : 'UI.DataField',
        Value: COMPANY_NAME
    }
]

);


