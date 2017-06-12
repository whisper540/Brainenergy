/**
 * Created by Administrator on 2017-06-07.
 */
define(function(require, exports, module){
    var tip=null,
        elems= {},
        sels={
            wrap: '.m-wrap-mask'
        },
        CON= {
            HIDE: 'fn-hide'
        };
    tip={
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            elems.wrap= $(sels.wrap);
            this.getMask();
        },
        getMask: function(){
            elems.wrap.removeClass(CON.HIDE).hide(3000, function(){
                location.href= location.href;
            });
        }
    };
    module.exports= tip;
});