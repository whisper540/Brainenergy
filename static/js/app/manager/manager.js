/**
 * Created by Administrator on 2017-05-16.
 */
define(function(require, exports, module) {
    var manager= null,
        elems={},
        sels={
            uname: '.u-user-name'
        },
        CON= {
            LEN: 10
        },
        api= require('api'),
        form= require('./form'),
        dealtext= require('dealtext');
    manager = {
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            //点击标志位
            // elems.submitButton= false;
            elems.access_token = $(sels.access_token);
            elems.access_token.each(function(index, elem){
                elem.value = localStorage.getItem('access_token')
            })
            elems.form = $(sels.form);
            elems.uname= $(sels.uname);

            this.setUsername();
            form.init({
                isNewtab: true,
                flag: sels.flag,
                _form: sels.form,
                //2.0接口
                // url_2: api.save,
                url_brain: api.save_doctor_brain
            })
        },
        setUsername: function(){
            // console.log(elems.uname)
            elems.uname.dealtext(CON.LEN);
        }
    }
    module.exports = manager;
})
