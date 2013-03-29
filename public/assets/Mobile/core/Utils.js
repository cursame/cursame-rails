/**
 * @class Core
 * @extends --
 * This is the definition class utils of the application
 */
 Ext.define('Core.Utils', {
    user:undefined,
    url:Cursame.APIURL,
    src:'/assets/Cursame/',
    requires: ['Ext.data.JsonP'],

    ajax :function(obj){
        var token = localStorage.getItem("Token");
        obj.url = this.url + obj.url;
        if (token) {
            obj.params = Ext.applyIf({
                auth_token: token
            },obj.params);
        }
        var o = Ext.applyIf({
            disableCaching:false,
            method :'GET'//,
            // callbackKey: 'callback'
        },obj);
        Ext.data.JsonP.request(o);
        // Ext.data.JsonP.request(o);
    },
    toFirstUpperCase:function  (txt) {
        return txt.charAt(0).toUpperCase()+txt.slice(1);
    }
});

 var Core = Ext.create('Core.Utils');

