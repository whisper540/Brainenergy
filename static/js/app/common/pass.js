/**
 * Created by Administrator on 2017-06-01.
 */
define(function(require, exports, module){
    var pass,
        elems = {},
        sels={
            uid: '#uid',
            mobile: '#mobile',
            tel: 'tel',
            code: '#code',
            _code: 'code',
            password : '#password',
            // repassword: '.u-repassword',
            // oldpassword: '.u-oldpassword',
            form: '.form-active',
            tip: '.u-tip',
            _in: '.u-in',
            red: 's-red-border',
        },
        api= require('api'),
        CON= {
            NUM: /(^[1-9][0-9]$)|(^100&)|(^[1-9]$)$/,
            AGE: /\D/g,
            CODE: /[^\w\.\/]/ig,                  //数字或英文
            TEL: /^1\d{10}$/,
            TELTIP: '手机号已经存在'
        };
    pass= {
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            // elems.uid= $(sels.uid);
            elems._form= $(sels.form);
            elems._form.each(this.bindEvent);
        },
        bindEvent: function(){
            var _self = $(this),
                _in = _self.find(sels._in),
                uid = _self.find(sels.uid),
                tip = _self.find(sels.tip),
                mobile= _self.find(sels.mobile),
                code= _self.find(sels.code),
                password= _self.find(sels.password),
                flagActive= false;
                // repassword= _self.find(sels.repassword),
                // oldpassword= _self.find(sels.oldpassword);
            console.log(_in, tip, mobile, code, password)
            _in.on('blur', function () {
                validate($(this));
            }).on('focus', function () {
                $(this).removeClass(sels.red);
                if (tip.html() == $(this).data(sels.data)) {
                tip.html('');
                }
            });
            mobile.on('keyup', function(){
                if(this.value.length>11)
                    this.value=this.value.slice(0, 11);
            }).on('afterpaste', function(){
                if(this.value.length>11)
                    this.value=this.value.slice(0, 11);
            });
            code.on('keyup', function(){
                this.value= this.value.replace(CON.CODE,'')
                if(this.value.length>6)
                    this.value=this.value.slice(0, 6);
            }).on('afterpaste', function(){
                this.value= this.value.replace(CON.CODE,'')
                if(this.value.length>6)
                    this.value=this.value.slice(0, 60);
            });
            elems._form.submit(function(){
                var cur;
                if(flagActive){
                    return false;
                }
                flagActive= true;
                for(var i=0, len=cur.length; i<len; i++){
                    cur= _in.eq(i);
                    if(!validate(cur)){
                        flagActive= false;
                        return false;
                    }
                }
                $.ajax({
                  type: 'POST',
                  url: '/teacher/m_active/',
                  dataType: 'json',
                  data: {
                      uid: uid.val(),
                      mobile: mobile.val(),
                      code: code.val(),
                      password : password.val()
                  },
                  success:function(response, stutas, xhr){
                      console.log(response);
                      if(response==200){
                          location.href= '/teacher/login';
                      }else if(response==113){
                          alert('请确保输入正确');
                      }else if(response==1313||response==13456){
                          alert('激活失败')
                      }
                      flagActive= false;
                  },
                  error: function(){
                      flagActive= false;
                      alert('系统忙，请稍候重试')
                  }
                });
                return false;
            });
            function validate(obj){
              var val= obj.val().trim(),
                data= obj.data('tip'),
                flag= false,
                len;
              console.log(val);
              if(!val){
                  console.log(1111)
                obj.addClass(sels.red);
                tip.html(data);
                return false;
              }else{
                  console.log(2222)
                if(obj.hasClass(sels.tel)){
                  len= val.length;
                  flag= (11!=val.length || !val.match(CON.TEL));
                  if(!vSpecial(obj, data, flag)){
                    return false;
                  }
                }else if(obj.hasClass(sels._code)){
                  len= val.length;
                  console.log(len <= 6, !val.match(CON.CODE))
                  flag= !(len <= 6&&!val.match(CON.CODE));
                  if(!vSpecial(obj, data, flag)){
                    return false;
                  }
                }
              }
              return true;
            }
            function vSpecial(obj, data, flag){
                if(flag){
                    obj.addClass(sels.red);
                    tip.html(data);
                    return false;
                }
                return true;
             }
        }
    }
    module.exports= pass;
});
