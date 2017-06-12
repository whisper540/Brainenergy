/**
 * Created by Administrator on 2017-05-24.
 */
define(function(require, exports, module) {
    var collect,
        elems = {},
        sels = {
            fileForm: '#testform',
            upload: '.u-upload',
            img: '#imgFile',
            uname: '.u-user-name',
            formM: '.m-form-mpass',
            fade1: '.modal-mpass',
            fade2: '.modal-backdrop'
        },
        CON= {
            LEN: 10
        },
        form= require('./form'),
        api = require('api'),
        dealtext= require('dealtext'),
        initFlag= false;
        // confirm= require('confirm');
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
            elems.access_token = $(sels.access_token);
            elems.access_token.each(function(index, elem){
                elem.value = localStorage.getItem('access_token')
            });
            elems.callb= $(sels.callb);
            elems.uname= $(sels.uname);
            elems.formM= $(sels.formM);
            elems.fade1= $(sels.fade1);

            this.setUsername();
            form.init({
                isModify: true,
                flag: sels.flag,
                _form: sels.form,
                url_2: api.modify_basicinfo,        //2.0修改信息采集的接口
                url_brain: api.modify_teacher, //脑适能管理员修改老师
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
            elems.callb.on('load', function(){
                location.href = location.href;
            });
            elems.formM.submit(function(){
                if(initFlag){
                    return false;
                }
                initFlag= true;
                $.ajax({
                    url: '/manager/resetpwd/',
                    datatype: 'json',
                    data: {
                        uid: sels.uid
                    },
                    type: 'post',
                    success: function(res){
                        console.log(sels.uid)
                        // if(res=='200'){
                            // alert('初始化成功');
                        // }else{
                            // alert('初始化失败')
                        // }

                        initFlag= false;
                        location.href= location.href;
                    },
                    error: function(){
                        alert('系统忙，请稍后重试');
                        initFlag= false;
                        location.href= location.href;
                    }
                });
                return false;
            })
        },
        setUsername: function(){
            // console.log(elems.uname)
            elems.uname.dealtext(CON.LEN);
        }
    };

    module.exports= collect;
});