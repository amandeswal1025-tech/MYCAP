module.exports = cds.service.impl(async function() {
    const {POs} = this.entities;

    this.on( 'boost', async(req,res) => {
        try {
            //we will be entited to get free pk values
            const ID = req.params[0];
            //create object for cds
            const tx = cds.tx(req);
            //update order gross amount 
            await tx.update(POs).with({
                GROSS_AMOUNT : {'+=': 20000}
            }).where(ID);
            tx.commit();
        } catch (error)
         {
            
        }
    });
});