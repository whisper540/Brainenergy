/**
 * Created by Administrator on 2017-05-22.
 */
define(function(require, exports, module) {
    var student,
        elems = {},
        sels = {
            uname: '.u-user-name'
        },
        form= require('./form'),
        api = require('api'),
        CON= {
            LEN: 10
        },
        dealtext= require('dealtext');
    student={
        init: function(obj){
            // var url_2= '',
            //     url_brain= '';
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            elems.access_token = $(sels.access_token);
            elems.access_token.each(function(index, elem){
                elem.value = localStorage.getItem('access_token')
            });
            elems.uname= $(sels.uname);
            this.setUsername();
            // elems.form = $(sels.form);
            // if(sels.flag=='collect'){
            //     url_2= api.modify_basicinfo;         //2.0修改基本信息的接口
            //     url_brain= api.modify_get_info;  //脑适能修改基本信息的接口
            // }else if(sels.flag=='basic'){
            //     url_2= api.modify_basicinfo;         //2.0修改基本信息的接口
            //     url_brain= api. modify_basic_info;  //脑适能修改基本信息的接口
            // }
            form.init({
                isModify: true,
                flag: sels.flag,
                _form: sels.form,
                url_2: api.modify_basicinfo,        //2.0修改基本信息的接口
                url_brain: api.modify_basic_info, //脑适能修改基本信息的接口
                // args_brain: sels.args_brain         //脑适能的接口参数
            })
        },
        setUsername: function(){
            console.log(elems.uname)
            elems.uname.dealtext(CON.LEN);
        }
    };
    module.exports= student;
})