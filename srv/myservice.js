const cds =  require("@sap/cds");
const { SELECT } = require("@sap/cds/lib/ql/cds-ql");
const{ employees } = cds.entities("anubhav.db.master");

module.exports = (srv) => {

    //implemention of service
    srv.on('hello', (req, res) =>{
        return "hello" + req.data.name + "on cap app";
    });



   // reaplacing standard behaviour and plac our custom on logic 
    srv.on( "READ", "ReadEmployeeSrv" , async (req,res) =>{

const tx = cds.tx(req);
let data = await tx.run(SELECT.from(employees).limit(5).where({
    "bankName": "My Bank of Antioch"
}));

for ( let i =0 ; i < data.length; i++) {
    const element = data[i];
    element.nameMiddle = element.nameFirst + " " + element.nameLast;
}
return data;
// return{
//     "ID" :"Dummy",
//     "FirstName": "Aman",
//     "LastName": "Deswal"
// };
    } );
}