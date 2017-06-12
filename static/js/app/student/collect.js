/**
 * Created by Administrator on 2017-05-22.
 */
define(function(require, exports, module) {
    var collect,
        elems = {},
        sels = {
            fileForm: '#testform',
            upload: '.u-upload',
            img: '#imgFile',
            uname: '.u-user-name',
            modify: '.u-btn-modify',
            black: '.m-black-mask',
            mask: '.m-mask-teacher',
            close: '.u-close-mask'
        },
        form= require('./form'),
        CON= {
            LEN: 10
        },
        api = require('api'),
        dealtext= require('dealtext');
    collect= {
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            //上传按钮
            elems.upload= $(sels.upload);
            //选择文件的表单
            elems.fileForm= elems.upload.siblings(sels.fileForm);
            //选择文件的input
            elems.img= elems.fileForm.children(sels.img);
            elems.modify= $(sels.modify);
            elems.black= $(sels.black);
            elems.mask= $(sels.mask);
            elems.close= $(sels.close);
            elems.uname= $(sels.uname);
            elems.access_token = $(sels.access_token);
            elems.callb= $(sels.callb);
            elems.access_token.each(function(index, elem){
                elem.value = localStorage.getItem('access_token')
            });
            this.setUsername();
            form.init({
                isModify: true,
                flag: sels.flag,
                _form: sels.form,
                url_2: api.modify_basicinfo,        //2.0修改信息采集的接口
                url_brain: api.modify_get_info, //脑适能修改信息采集的接口
                // args_brain: sels.args_brain         //脑适能的接口参数
            })
            this.bindEvent();
        },
        bindEvent: function(){
            //上传头像
            elems.upload.on('click', function(){
                var value = elems.img.val();
                if(!value){
                    alert("请选择文件");
                    return false;
                }
                elems.fileForm.submit();
            });
            elems.modify.on('click', function(){
                // console.log(1111)
                // return false;
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
            // elems.callb.on('load', function(){
            //     location.href = location.href;
            // });
        },
        setUsername: function(){
            // console.log(elems.uname)
            elems.uname.dealtext(CON.LEN);
        }
    };

    module.exports= collect;
});