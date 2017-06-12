/**
 * Created by Administrator on 2017-05-16.
 */
define(function(require, exports, module) {
    var teacher= null,
        elems={},
        sels={
            uname: '.u-user-name',
            create: '.u-btn-create',
            black: '.m-black-mask',
            mask: '.m-mask-teacher',
            close: '.u-close-mask'
        },
        CON= {
            LEN: 10,
            HIDE: 'fn-hide'
        },
        api= require('api'),
        form= require('./form'),
        dealtext= require('dealtext');
    teacher = {
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
            elems.create= $(sels.create);
            elems.black= $(sels.black);
            elems.mask= $(sels.mask);
            elems.close= $(sels.close);
            elems.uname= $(sels.uname);
            // this.bindEvent();
            this.setUsername();
            this.bindEvent();
            form.init({
                isNewtab: true,
                _form: sels.form,
                url_2: api.save,
                url_brain: api.save_brain
            })
        },
        bindEvent: function () {
            elems.create.on('click', function(){
                elems.black.show(10, function(){
                    elems.mask.show(300);
                });
            });
            elems.close.on('click', function(){
                elems.mask.hide(300, function(){
                    elems.black.hide(100, function(){
                       location.href= location.href;
                    });
                });
            });
        },
        setUsername: function(){
            elems.uname.dealtext(CON.LEN);
        }
        // bindEvent: function(){
        //     //提交表单
        //     elems.form.submit(function(){
        //         var formData ;
        //         if(elems.submitButton){
        //             return false;
        //         }
        //         elems.submitButton= true;
        //         formData= elems.form.serializeArray();
        //         $.ajax({
        //             type: 'POST',
        //             url: '/teacher/newtab/',
        //             dataType: 'json',
        //             data: formData,
        //             success: function (response) {
        //                 console.log(response);
        //                 if(response == '200'){
        //                     $.ajax({
        //                         url: api.save,
        //                         type: 'post',
        //                         data: formData,
        //                         dataType: 'json',
        //                         success: function(res){
        //                             console.log(res)
        //                             elems.submitButton= false;
        //                             // location.href="/teacher/home";
        //                             // location.href="/teacher/home";
        //                         },
        //                         error: function(){
        //                             elems.submitButton= false;
        //                         }
        //                     });
        //                 }else{
        //                     elems.submitButton= false;
        //                     alert('无法添加')
        //                 }
        //             }
        //         });
        //         // $.ajax({
        //         //     url: api.save,
        //         //     type: 'post',
        //         //     data: elems.form.serializeArray(),
        //         //     dataType: 'json',
        //         //     success: function(res){
        //         //         console.log(res)
        //         //         elems.submitButton= false;
        //         //         // location.href = location.href;
        //         //     },
        //         //     error: function(){
        //         //         elems.submitButton= false;
        //         //     }
        //         // });
        //         return false;
        //     })
        // }
    }
    module.exports = teacher;
})
