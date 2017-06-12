/**
 * Created by Administrator on 2017-05-23.
 */
define(function(require, exports, module) {
    var collect,
        elems = {},
        sels = {
            fileForm: '#testform',
            upload: '.u-upload',
            img: '#imgFile',
            uname: '.u-user-name'
        },
        form= require('form'),
        api = require('api'),
        CON= {
            LEN: 10
        },
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
            elems.uname= $(sels.uname);
            elems.access_token = $(sels.access_token);
            elems.callb= $(sels.callb);
            elems.access_token.each(function(index, elem){
                elem.value = localStorage.getItem('access_token')
            });
            this.setUsername();
            form.init({
                flag: sels.flag,
                _form: sels.form,
                url_2: api.modify_basicinfo,        //2.0修改信息采集的接口
                url_brain: api.modify_get_teac_info, //脑适能老师资料设置
                isModify: true,
                isTeacher: true
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
                // location.href = location.href;
            });
            elems.callb.on('load', function(){
                location.href = location.href;
            });
        },
        setUsername: function(){
            // console.log(elems.uname)
            elems.uname.dealtext(CON.LEN);
        }
    };

    module.exports= collect;
});