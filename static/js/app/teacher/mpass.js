/**
 * Created by Administrator on 2017-06-01.
 */
define(function(require, exports, module){
    var mpass,
        elems = {},
        sels={
            old: 'old',
            _old: '#user-opass',
            newp: 'newp',
            _newp: '#user-npass',
            confp: 'confp',
            _confp: '#user-cpass',
            form: '.form-m-pass',
            _in: '.u-in',
            tip: '.u-tip',
            red: 's-red-border',
            data: 'tip',
            btn: '.btn-modify'
        },
        api= require('api'),
        sysTip= require('tip'),
        CON= {
            TIP_SAME: '请输入与原密码不同的新密码',
            TIP_UNSAME: '两次输入的新密码不同',
            WRONG: '密码错误，请重新填写'
        }
        flagM= false;
    console.log(sysTip)
    mpass= {
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            elems.form= $(sels.form);
            elems._old= elems.form.find(sels._old);
            elems._newp= elems.form.find(sels._newp);
            elems._confp= elems.form.find(sels._confp);
            elems._in= elems.form.find(sels._in);
            elems.btn= $(sels.btn);
            elems.tip= elems.form.find(sels.tip);
            this.bindEvent();
        },
        bindEvent: function(){
            elems._in.on('keyup', function () {
                var flag= setBtn();
                if(flag){
                    elems.btn.removeAttr('disabled');
                }
            }).on('focus', function () {
                var tip= $(this).siblings(sels.tip);
                $(this).removeClass(sels.red);
                tip.html('');
            });
            elems.form.submit(function(){
                var len= elems._in.length,
                    cur;
                if(flagM){
                    return false;
                }
                flagM= true;
                elems._in.removeClass(sels.red);
                elems.tip.html('');
                for(var i=0; i<len; i++){
                    cur= elems._in.eq(i);
                    if(!validate(cur)){
                        flagM= false;
                        return false;
                    }
                }
                // console.log(elems.form.serializeArray())
                $.ajax({
                  type: 'POST',
                  url: api.mpass,
                  dataType: 'json',
                  data: elems.form.serializeArray(),
                  success: function(response, stutas, xhr){
                      if(response==200){
                          location.href=location.href;
                      }else if(response==13){
                          elems._old.addClass(sels.red).siblings(sels.tip).html(CON.WRONG);
                      }else{
                          sysTip.init();
                      }
                      flagM= false;
                  },
                  error: function(){
                     flagM= false;
                     sysTip.init();
                  }
                });
                return false;
            });
            function validate(obj){
              var val= obj.val().trim(),
                  data= obj.data('tip'),
                  flag= false,
                  len,
                  tip= obj.siblings(sels.tip);
              if(!val){
                obj.addClass(sels.red);
                tip.html(data);
                return false;
              }else{
                if(obj.hasClass(sels.newp)){
                  var old= elems._old.val().trim(),
                      // _confp= elems._confp.val().trim(),
                      tips= CON.TIP_SAME;
                  flag= (val==old);
                  // if(!flag){
                  //     if(_confp){
                  //         flag= (val!=_confp);
                  //         tips= CON.TIP_UNSAME;
                  //     }else{
                  //         flag= (val==_confp);
                  //
                  //     }
                  // }
                  if(!vSpecial(obj, data, flag, tips)){
                    return false;
                  }
                }else if(obj.hasClass(sels.confp)){
                  var newp= elems._newp.val().trim();
                  flag= (newp!=val);
                  if(!vSpecial(obj, data, flag, CON.TIP_UNSAME)){
                    return false;
                  }
                }
              }
              return true;
            }
            function vSpecial(obj, data, flag, tip){
                var da= tip?tip:data
                if(flag){
                    obj.addClass(sels.red);
                    obj.siblings(sels.tip).html(da);
                    return false;
                }
                return true;
             }
            function setBtn(){
                var flag= true;
                elems._in.each(function(index, elem){
                    var value= $(elem).val(),
                        hasVal= value?true:false;
                    flag= flag && hasVal;
                });
                return flag;
            }
        }
    }
    module.exports= mpass;
});
