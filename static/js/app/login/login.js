/**
 * Created by Administrator on 2017-05-19.
 */
define(function(require, exports, module) {
    var login,
        elems = {},
        sels = {
            uname: 'username',
            psw: 'password',
            form: '.form-signin',
            in: '.u-in',
            tip: '.u-tip-login',
            data: 'tip'
        },
        api= require('api'),
        CON= {
            WRONG: '请输入正确的账号或密码',
            VISI: 'fn-unvisi'
        };
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
            elems.in = elems.form.find(sels.in);
            elems.tip = elems.form.find(sels.tip);
            elems.hiddenForm= $(sels.hiddenForm);
            this.bindEvent();
        },
        bindEvent: function(){
            var self = this,
                _in = elems.in;
            _in.on('focus', function () {
                console.log(111);
                elems.tip.html('');
            });
            //提交表单
            elems.form.submit(function(){
                var len = _in.length, cur;
                if(elems.submitButton){
                    return false;
                }
                elems.submitButton = true;
                for(var i=0; i<len; i++){
                    cur= _in.eq(i);
                    if(!validate(cur)){
                        elems.submitButton= false;
                        return false;
                    }
                }
                //此处以后需要删掉 start
                elems.hiddenForm.find('input[name="password"]').val(elems.form.find('input[name="password"]').val());
                elems.hiddenForm.find('input[name="username"]').val(elems.form.find('input[name="username"]').val());
                elems.submitButton = false;
                elems.hiddenForm.submit();
                return false;
            });
            function validate(obj){
              var val= obj.val().trim(),
                  flag= false,
                  data= obj.data(sels.data);
              console.log(elems.tip, data)
              if(!val){
                elems.tip.html(data).addClass(CON.VISI);
                return false;
              }
              return true;
            }
        }
    }
    module.exports = login;
    })