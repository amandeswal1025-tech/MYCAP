sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"aman/capm/purchaseorderapp/test/integration/pages/POsList.gen",
	"aman/capm/purchaseorderapp/test/integration/pages/POsObjectPage.gen",
	"aman/capm/purchaseorderapp/test/integration/pages/POItemsObjectPage.gen"
], function (JourneyRunner, POsListGenerated, POsObjectPageGenerated, POItemsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('aman/capm/purchaseorderapp') + '/test/flp.html#app-preview',
        pages: {
			onThePOsListGenerated: POsListGenerated,
			onThePOsObjectPageGenerated: POsObjectPageGenerated,
			onThePOItemsObjectPageGenerated: POItemsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

