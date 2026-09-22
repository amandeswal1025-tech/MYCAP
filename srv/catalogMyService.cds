using { anubhav.db.master,anubhav.db.transaction   } from '../db/datamodel';


service catalogService @(path: 'CatalogService') {

//odata services//enityt set to perform all crud/odatav4
    entity EmployeeSet as projection on master.employees;
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity POs @( odata.draft.enabled: true ) as projection on transaction.purchaseorder{
        *,
        case OVERALL_STATUS
        when 'N' then 'New'
        when 'A' then 'Approved'
        when 'X' then 'rejected'
        When 'P' then 'Paid'
        end as OverallStatus: String(10),
          case OVERALL_STATUS
        when 'N' then 1
        when 'A' then 3
        when 'X' then 2
        When 'P' then 3
        end as Criticality: Integer
    }
    actions {
        @Common.SideEffects:{
            TargetProperties: ['in/GROSS_AMOUNT']
        }
        action boost() returns POs;
    };
    entity POItems as projection on transaction.poitems;

}