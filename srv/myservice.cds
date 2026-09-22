using { anubhav.db.master } from '../db/datamodel';

service MyService @(path: 'MyService') {

//definition of service 
//implementation will be done in js file
    function hello(name : String(32)) returns String;
@readonly
entity ReadEmployeeSrv as projection on master.employees;
}