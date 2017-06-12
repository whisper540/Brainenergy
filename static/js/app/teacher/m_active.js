/**
 * Created by Administrator on 2017-06-01.
 */
define(function(require, exports, module){
    var m_active,
        elems = {},
        sels={
            uid: '#uid',
            mobile: '#mobile',
            code: '#code',
            password : '#password',
            getCode: '.u-getCode',
            active: '.u-active',
            form: '.form-active'
        },
        api= require('api'),
        pass= require('pass'),
        flagCode= false;
    m_active= {
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            elems.uid= $(sels.uid);
            elems.mobile= $(sels.mobile);
            elems.code= $(sels.code);
            elems.password= $(sels.password);
            elems.getCode= $(sels.getCode);
            elems.active= $(sels.active);
            elems.form= $(sels.form);
            console.log(22)

            this.bindEvent();
            pass.init({
                _form: sels.form
            })
        },
        bindEvent: function(){
            elems.getCode.on('click', function(){
                if(flagCode){
                    return false;
                }
                console.log(333, elems.uid.val())
                flagCode= true;
                $.ajax({
                  type: 'POST',
                  url: '/teacher/getcode/',
                  dataType: 'json',
                  data: {
                      uid: elems.uid.val(),
                      mobile: elems.mobile.val()
                  },
                  success:function(response, stutas, xhr){
                      if(response==133){
                          alert('用户不存在或手机号错误');
                      }else if(response==200){
                          alert('短信已发送，请注意查收');
                      }else if(response==13){
                          alert('系统忙，请稍候重试')
                      }else{
                          alert('验证码发送失败')
                      }
                      flagCode= false;
                  },
                  error: function(){
                     flagCode= false;
                     alert('验证码发送失败')
                  }
              });
            });
        }
    }
    module.exports= m_active;
});
