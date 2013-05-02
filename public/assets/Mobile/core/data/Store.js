/**
 * @class Core.data.Store
 * @extends Ext.data.Store
 * This is the Notifications store of Cursame
 */
Ext.define('Core.data.Store', {
    extend: 'Ext.data.Store',
    
    config: {
        listeners:{
			beforeload:function(store, operation, ops){
				store.getProxy().setExtraParam('auth_token',localStorage.getItem("Token"));
			}
		}
    }
});