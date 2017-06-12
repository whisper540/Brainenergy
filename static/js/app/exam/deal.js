/**
 * Created by Administrator on 2017-05-27.
 */
define(function(require, exports, module) {
    var deal,
        elems = {},
        sels = {
            uname: '.u-user-name'
        },
        CON= {
            LEN: 10
        },
        dealtext= require('dealtext');
    deal= {
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            elems.uname= $(sels.uname);
            this.setUsername();
        },
        setUsername: function(){
            // console.log(elems.uname)
            elems.uname.dealtext(CON.LEN);
        }
    };

    module.exports= deal;
});