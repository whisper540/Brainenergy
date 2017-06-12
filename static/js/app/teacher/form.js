/**
 * Created by Administrator on 2017/5/15.
 */
define(function(require, exports, module) {
    var form,
        elems = {},
        sles= {
            _in: '.u-in',
            _form: '.m-form',
            tip: '.u-tip',
            data: 'tip',
            user: '#user-name',
            realname: '#user-real-name',
            userage: '#user-age',
            usertel: '#user-tel',
            username: 'username',
            age: 'age',
            birthday: 'input[name=birthday]',
            gender: 'gender',
            education: 'education',
            tel: 'tel',
            hide: 'fn-hide',
            red: 's-red-border',
            cancel: '.u-btn-cancel',
            isNewtab: false,
            sexHandler: '.control-label-gender',
            tips: '.u-tip-form'
          },
          CON= {
            NUM: /^([1-9]\d?|100)$/,
            AGE: /\D/g,
            // NAME: /^[\u4e00-\u9fa5]+$/,
            TEL: /^1\d{10}$/,
            NAME: /^[\u4E00-\u9FA5\uF900-\uFA2D\w]+$/,
            TELTIP: '手机号已经存在',
            UNAMETIP: '用户名已存在',
            CUR: 'cur'
          },
          api= require('api');

    form= {
        init: function (obj) {
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sles = $.extend({}, sles, obj);
            elems._form= $(sles._form);
            elems.user= elems._form.find(sles.user);
            elems.realname= elems._form.find(sles.realname);
            elems.userage= elems._form.find(sles.userage);
            elems.usertel= elems._form.find(sles.usertel);
            elems.submitFlag= false;
            elems.birthday= $(sles.birthday);
            elems._form.each(this.bindEvent);
        },
        bindEvent: function() {
            var _self = $(this),
                _in = _self.find(sles._in),
                tip = _self.find(sles.tip),
                cancel= _self.find(sles.cancel),
                sexHandler= _self.find(sles.sexHandler);
            sexHandler.on('click', function(){
                $(this).siblings().removeClass(CON.CUR).end().addClass(CON.CUR);
            });
            _in.on('blur', function () {
                validate($(this));
            }).on('focus', function () {
                $(this).removeClass(sles.red);
                // if (tip.html() == $(this).data(sles.data)) {
                $(this).siblings(sles.tips).html('');
                // }
            });
            elems.realname.on('keyup', function(){
                if(this.value.length>20)
                    this.value=this.value.slice(0, 20);
            }).on('afterpaste', function(){
                if(this.value.length>20)
                    this.value=this.value.slice(0, 20);
            });
            elems.userage.on('keyup', function(){
                if(this.value.length==1){
                    this.value = this.value.replace(/[^1-9]/g,'')
                }else{
                    this.value = this.value.replace(CON.AGE,'')
                }
                if(this.value>100)
                    this.value=100
            }).on('afterpaste', function(){
                this.value= this.value.replace(CON.AGE,'');
            });
            elems.usertel.on('keyup', function(){
                if(this.value.length>11)
                    this.value=this.value.slice(0, 11);
            }).on('afterpaste', function(){
                if(this.value.length>11)
                    this.value=this.value.slice(0, 11);
            });
            cancel.on('click', function(e){
                e.preventDefault();
                location.href=location.href;
            });
            _self.submit(function(){
                var len= _in.length,
                    cur;
                if(elems.submitFlag){
                    return false;
                }
                elems.submitFlag = true;
                _in.removeClass(sles.red);
                _in.siblings(sles.tips).html('');
                for(var i=0; i<len; i++){
                    cur= _in.eq(i);
                    if(!validate(cur)){
                        elems.submitFlag= false;
                        return false;
                    }
                }
                elems.birthday.val(form.getBirthday($('.age').val()));
                $.ajax({
                    type: 'POST',
                    url: sles.url_brain,
                    dataType: 'json',
                    data: {
                        realname:elems.realname.val(),
                        age: elems.userage.val(),
                        grade: $("#user-edu").val(),
                        sex: $("input[name='gender']:checked").val(),
                        utype: '3',
                        adduid: $("input[name='adduid']").val(),
                        mobile: elems.usertel.val()
                    },
                    success: function (response) {
                        var loca= sles.isNewtab?location.href.split('?')[0]:location.href;
                        if(response == '200'){
                            location.href= loca;
                            //2.0接口
                            // $.ajax({
                            //     url: sles.url_2,
                            //     type: 'post',
                            //     data: _self.serializeArray(),
                            //     dataType: 'json',
                            //     success: function(res){
                            //         elems.submitFlag= false;
                            //         location.href=location.href;
                            //     },
                            //     error: function(){
                            //         elems.submitFlag= false;
                            //     }
                            // });
                        }else if(response == '901'){
                            elems.user.addClass(sles.red);
                            elems.user.siblings(sles.tips).html(CON.UNAMETIP);
                            elems.submitFlag= false;
                        }else if(response == '900'){
                            elems.usertel.addClass(sles.red);
                            elems.usertel.siblings(sles.tips).html(CON.TELTIP);
                            elems.submitFlag= false;
                        }else{
                            elems.submitFlag= false;
                            alert('无法添加')
                        }
                    },
                    error: function(){
                        elems.submitFlag= false;
                    }
                });

                // $.ajax({
                //     url: api.save,
                //     type: 'post',
                //     data: _self.serializeArray(),
                //     dataType: 'json',
                //     success: function(res){
                //         console.log(res)
                //         elems.submitFlag= false;
                //         return false;
                //         // location.href = location.href;
                //     },
                //     error: function(){
                //         elems.submitFlag= false;
                //     }
                // });
                return false;
            });
            function validate(obj){
              var val= obj.val().trim(),
                data= obj.data('tip'),
                flag= false,
                len;
              // console.log(obj)
              if(!val){
                obj.addClass(sles.red);
                obj.siblings(sles.tips).html(data);
                return false;
              }else{
                if(obj.hasClass(sles.age)){
                    console.log(val.match(CON.NUM))
                  flag= (!val.match(CON.NUM));
                  if (!vSpecial(obj, data, flag)) {
                    return false;
                  }
                }else if(obj.hasClass(sles.username)){
                  len= val.length;
                  flag= !(len <= 20&&val.match(CON.NAME));
                  if(!vSpecial(obj, data, flag)){
                    return false;
                  }
                }else if(obj.hasClass(sles.tel)){
                  len= val.length;
                  flag= (11!=val.length || !val.match(CON.TEL));
                  if(!vSpecial(obj, data, flag)){
                    return false;
                  }
                }else if(obj.hasClass(sles.education)){
                   if(val==0){
                     obj.addClass(sles.red);
                     obj.siblings(sles.tips).html(data);
                     return false;
                   }
                }
              }
              return true;
            }
            function vSpecial(obj, data, flag){
                if(flag){
                    obj.addClass(sles.red);
                    obj.siblings(sles.tips).html(data);
                    return false;
                }
                return true;
             }
        },
        getBirthday: function (val) {
           var date = new Date().getFullYear();
           var birYear = date - val;
           return birYear + '-01-01';
        }
    }
    module.exports = form;
    })