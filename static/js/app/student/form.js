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
            name: 'realname',
            usercontact: '#user-contact',
            userrel: '#user-relation',
            age: 'age',
            birthday: 'input[name=birthday]',
            gender: 'gender',
            education: 'education',
            tel: 'tel',
            rel: 'relation',
            contact: 'contact',
            hide: 'fn-hide',
            red: 's-red-border',
            isModify: false,
            isTeacher: false,
            savebtn: '.btn-save',
            cancel: '.u-btn-cancel',
            sexHandler: '.control-label-gender',
            CUR: 'cur',
            tips: '.u-tip-form'
          },
          initValue= {},
          CON= {
            NUM: /^([1-9]\d?|100)$/,
            AGE: /\D/g,
            USERNAME: /[^\w\.\/]/ig,                  //数字或英文
            REALNAME: /[^\u4E00-\u9FA5]/g,          //汉字
            NAME: /^[\u4E00-\u9FA5\uF900-\uFA2D\w]+$/, //中文或字符
            REL: /^[\u4e00-\u9fa5]+$/,
            TEL: /^1\d{10}$/,
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
            elems.usercontact= elems._form.find(sles.usercontact);
            elems.userrel= elems._form.find(sles.userrel);
            elems.submitFlag= false;
            elems.birthday= $(sles.birthday);
            elems.savebtn= $(sles.savebtn);
            if(sles.isModify){
                initValue= {
                    id: $("#user-id").val(),
                    username: elems.user.val()?elems.user.val(): '',
                    realname: elems.realname.val()?elems.realname.val():'',
                    age: elems.userage.val(),
                    grade: $("#user-edu").val(),
                    sex: $("input[name='gender']:checked").val(),
                    mobile: elems.usertel.val(),
                    guardian: elems.usercontact.val() ? elems.usercontact.val() : '',
                    relationship: elems.userrel.val() ? elems.userrel.val() : ''
                }
            }
            elems._form.each(this.bindEvent);
        },
        bindEvent: function() {
            var _self = $(this),
                _in = _self.find(sles._in),
                tip = _self.find(sles.tip),
                cancel= _self.find(sles.cancel),
                sexHandler= _self.find(sles.sexHandler);
            console.log(sexHandler)
            sexHandler.on('click', function(){
                $(this).siblings().removeClass(CON.CUR).end().addClass(CON.CUR);
            });
            _in.on('blur', function () {
                validate($(this));
            }).on('focus', function () {
                $(this).removeClass(sles.red);
                // if (tip.html() == $(this).data(sles.data)) {
                // tip.html('');
                // }
                $(this).siblings(sles.tips).html('');
            });
            // elems.user.on('keyup', function(){
            //     if(this.value.length>20)
            //         this.value=this.value.slice(0, 20);
            // }).on('afterpaste', function(){
            //     if(this.value.length>20)
            //         this.value=this.value.slice(0, 20);
            // });
            elems.user.on('keyup', function(){
                this.value= this.value.replace(CON.USERNAME,'')
                if(this.value.length>20)
                    this.value=this.value.slice(0, 20);
            }).on('afterpaste', function(){
                this.value= this.value.replace(CON.USERNAME,'')
                if(this.value.length>20)
                    this.value=this.value.slice(0, 20);
            });
            elems.realname.on('keyup', function(){
                if(this.value.length>20)
                    this.value=this.value.slice(0, 20);
            }).on('afterpaste', function(){
                if(this.value.length>20)
                    this.value=this.value.slice(0, 20);
            });
            elems.usercontact.on('keyup', function(){
                if(this.value.length>20)
                    this.value=this.value.slice(0, 20);
            }).on('afterpaste', function(){
                if(this.value.length>20)
                    this.value=this.value.slice(0, 20);
            });
            elems.userrel.on('keyup', function(){
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
                location.href= location.href;
            });
            _self.submit(function(){
                var len= _in.length,
                    cur, args_brain;
                if(elems.submitFlag){
                    return false;
                }
                elems.submitFlag = true;
                _in.removeClass(sles.red);
                _in.siblings(sles.tips).html('');
                args_brain= {
                    id: $("#user-id").val(),
                    username: elems.user.val()?elems.user.val():'',
                    realname: elems.realname.val()?elems.realname.val():'',
                    age: elems.userage.val(),
                    grade: $("#user-edu").val(),
                    sex: $("input[name='gender']:checked").val(),
                    mobile: elems.usertel.val(),
                    guardian: elems.usercontact.val() ? elems.usercontact.val() : '',
                    relationship: elems.userrel.val() ? elems.userrel.val() : ''
                };

                if(sles.isModify && !getStatus(initValue, args_brain)){
                    alert('您未做任何修改');
                    elems.submitFlag= false;
                    // location.href= location.href;
                    return false;
                }
                // elems.savebtn.removeAttr('disabled');
                for(var i=0; i<len; i++){
                    cur= _in.eq(i);
                    if(!validate(cur)){
                        elems.submitFlag= false;
                        return false;
                    }
                }
                elems.birthday.val(form.getBirthday($('.age').val()));
                // if(sles.flag=='collect'){
                    // args_brain= {
                    //     id: $("#user-id").val(),
                    //     username: $("#user-name").val(),
                    //     age: $("#user-age").val(),
                    //     grade: $("#user-edu").val(),
                    //     sex: $("input[name='gender']:checked").val(),
                    //     guardian: $("#user-contact").val(),
                    //     relationship: $("#user-relation").val(),
                    //     mobile: $("#user-tel").val()
                    // }
                // }else if(sles.flag=='basic'){
                //
                //     args_brain= {
                //         id: $("#user-id").val(),
                //         username: $("#user-name").val(),
                //         age: $("#user-age").val(),
                //         grade: $("#user-edu").val(),
                //         sex: $("input[name='gender']:checked").val(),
                //         mobile: $("#user-tel").val()
                //     }
                // }
                $.ajax({
                    type: 'POST',
                    url: sles.url_brain,
                    dataType: 'json',
                    data: args_brain,
                    //     {
                    //     id: $("#user-id").val(),
                    //     username: $("#user-name").val(),
                    //     age: $("#user-age").val(),
                    //     grade: $("#user-edu").val(),
                    //     sex: $("input[name='gender']:checked").val()
                    // },
                    success: function (response) {
                        if(response == '200'){
                            location.href=location.href;
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
                            //         alert('无法修改');
                            //         elems.submitFlag= false;
                            //     }
                            // });
                        }else if(response == '901'){
                            elems.user.addClass(sles.red);
                            elems.user.siblings(sles.tips).html(CON.UNAMETIP);
                            // tip.html(CON.UNAMETIP);
                            elems.submitFlag= false;
                        }else if(response == '900'){
                            elems.usertel.addClass(sles.red);
                            elems.usertel.siblings(sles.tips).html(CON.TELTIP);
                            // tip.html(CON.TELTIP);
                            elems.submitFlag= false;
                        }else{
                            elems.submitFlag= false;
                            alert('无法修改')
                        }
                    },
                    error: function(a, b, c){
                        alert('无法修改');
                        elems.submitFlag= false;
                    }
                });
                return false;
            });
            function validate(obj){
              var val= obj.val().trim(),
                data= obj.data('tip'),
                flag= false,
                len;
              if(!val){
                obj.addClass(sles.red);
                // tip.html(data);
                obj.siblings(sles.tips).html(data);
                return false;
              }else{
                  // if(obj.hasClass(sles.username)){
                  //     len= val.length;
                  //     flag= !(len <= 20&&val.match(CON.NAME));
                  //     if(!vSpecial(obj, data, flag)){
                  //       return false;
                  //     }
                  // }
                 if(obj.hasClass(sles.username)){
                  len= val.length;
                  console.log(val, !val.match(CON.USERNAME))
                  flag= !(len <= 20&&!val.match(CON.USERNAME));
                  if(!vSpecial(obj, data, flag)){
                    return false;
                  }
                }else if(obj.hasClass(sles.name)){
                  len= val.length;
                  flag= !(len <= 20);
                  if(!vSpecial(obj, data, flag)){
                    return false;
                  }
                }else if(obj.hasClass(sles.age)){
                  flag= !(val.match(CON.NUM));
                  if (!vSpecial(obj, data, flag)) {
                    return false;
                  }
                }else if(obj.hasClass(sles.contact)){
                  len= val.length;
                  // flag= !(len <= 20&&val.match(CON.NAME));
                  flag= (len > 20);
                  if(!vSpecial(obj, data, flag)){
                    return false;
                  }
                }else if(obj.hasClass(sles.rel)){
                  len= val.length;
                  flag= !(len <= 20&&val.match(CON.REL));
                  if(!vSpecial(obj, data, flag)){
                    return false;
                  }
                }else if(obj.hasClass(sles.tel)){
                  len= val.length;
                  flag= (11!=val.length || !val.match(CON.TEL));
                  if(!vSpecial(obj, data, flag)){
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
                    // tip.html(data);
                    return false;
                }
                return true;
             }
            function getStatus (old, newV){
                var flag= old.realname==newV.realname&&old.age==newV.age&&old.grade==newV.grade&&old.sex==newV.sex&&old.mobile==newV.mobile;

                if(sles.isTeacher){
                    flag= flag&&(old.username==newV.username);
                }else{
                    flag= flag&&old.guardian==newV.guardian&&old.relationship==newV.relationship;
                }
                if(flag){
                    return false;
                }else{
                    return true;
                }
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