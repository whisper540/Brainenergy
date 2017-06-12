/**
 * Created by Administrator on 2017-05-19.
 */
define(function(require, exports, module) {
    var login,
        elems = {},
        sels = {
            form: '.form-signin'
        },
        api= require('api');
        // ,
        // store = require('store');
    login= {
        init: function (obj) {
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            //点击标志位
            elems.submitButton= false;
            elems.form = $(sels.form);
            elems.hiddenForm= $(sels.hiddenForm);
            this.bindEvent();
        },
        bindEvent: function(){
            var self = this;
            //提交表单
            elems.form.submit(function(){
                if(elems.submitButton){
                    return false;
                }
                elems.submitButton = true;
                //此处以后需要删掉 start
                elems.hiddenForm.find('input[name="password"]').val(elems.form.find('input[name="password"]').val());
                elems.hiddenForm.find('input[name="username"]').val(elems.form.find('input[name="username"]').val());
                elems.submitButton = false;
                elems.hiddenForm.submit();
                return false;
                //此处以后需要删掉 end
                //2.0
//                 $.ajax({
//                     url: api.login,
//                     type: 'post',
//                     data: elems.form.serializeArray(),
//                     dataType: 'json',
//                     success: function(res){
//                       elems.submitButton = false;
//
//                       if(res.status===1||res.status==2){
//                          localStorage.setItem('access_token', res.access_token);
//                          localStorage.setItem('refresh_token', res.refresh_token);
//                          self.checkLogin();
// }
//                     },
//                     error: function(res){
//                         elems.submitButton = false;
//                     }
//                 });
//                 return false;
            })
        }
        //2.0
        // ,
        // checkLogin: function(){
        //     var access_token = localStorage.getItem('access_token');
        //     if(access_token){
        //         $.when($.ajax({
        //             url: api.me,
        //             data: {
        //                 access_token: access_token
        //             }
        //         })).done(function(res){
        //             if(res.resultCode==20000){
        //                 elems.hiddenForm.find('input[name="password"]').val(elems.form.find('input[name="password"]').val());
        //                 elems.hiddenForm.find('input[name="username"]').val(elems.form.find('input[name="username"]').val());
        //                 elems.submitButton = false;
        //                 elems.hiddenForm.submit();
        //             }
        //         })
        //     }
        // }
    }
    module.exports = login;
    })