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
            cancel: '.u-btn-cancel',
            isNewtab: false,
            tips: '.u-tip-form'
          },
          initValue= {},
          CON= {
            NUM: /^([1-9]\d?|100)$/,
            AGE: /\D/g,
            USERNAME: /[^\w\.\/]/ig,                  //数字或英文
            REALNAME: /[^\u4E00-\u9FA5]/g,          //汉字
            NAME: /^[\u4E00-\u9FA5\uF900-\uFA2D\w]+$/, //中文或字符
            // NAME: /^[\u4e00-\u9fa5]+$/,
            TEL: /^1\d{10}$/,
            TELTIP: '手机号已经存在',
            UNAMETIP: '用户名已存在'
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
            if(sles.isModify){
                initValue= {
                    username: elems.user.val(),
                    realname: elems.realname.val(),
                    age: elems.userage.val(),
                    grade: $("#user-edu").val(),
                    sex: $("input[name='gender']:checked").val(),
                    mobile: elems.usertel.val()
                    // ,
                    // password: $('#user-pass').val()?$('#user-pass').val():''
                }
            }
            elems._form.each(this.bindEvent);
        },
        bindEvent: function() {
            var _self = $(this),
                _in = _self.find(sles._in),
                tip = _self.find(sles.tip),
                cancel= _self.find(sles.cancel);
            _in.on('blur', function () {
                validate($(this));
            }).on('focus', function () {
                $(this).removeClass(sles.red);
                $(this).siblings(sles.tips).html('');
                // if (tip.html() == $(this).data(sles.data)) {
                // tip.html('');
                // }
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
                    cur, args_brain;
                if(elems.submitFlag){
                    return false;
                }
                elems.submitFlag = true;
                _in.removeClass(sles.red);
                _in.siblings(sles.tips).html('');
                args_brain= {
                    username: elems.user.val(),
                    realname: elems.realname.val(),
                    age: elems.userage.val(),
                    grade: $("#user-edu").val(),
                    sex: $("input[name='gender']:checked").val(),
                    mobile: elems.usertel.val()
                };
                if(sles.flag=='collect'){
                    args_brain.id= $("#user-id").val();
                    // args_brain.password= $('#user-pass').val();
                }else if(sles.flag=='basic'){
                    args_brain.utype= '2';
                    args_brain.adduid= $("input[name='adduid']").val();
                }
                if(sles.isModify && !getStatus(initValue, args_brain)){
                    alert('您未做任何修改');
                    elems.submitFlag= false;
                    // location.href= location.href;
                    return false;
                }
                for(var i=0; i<len; i++){
                    cur= _in.eq(i);
                    if(!validate(cur)){
                        elems.submitFlag= false;
                        return false;
                    }
                }
                elems.birthday.val(form.getBirthday($('.age').val()));
                // if(sles.flag=='collect'){
                //     args_brain= {
                //         id: $("#user-id").val(),
                //         username: $("#user-name").val(),
                //         age: $("#user-age").val(),
                //         grade: $("#user-edu").val(),
                //         sex: $("input[name='gender']:checked").val(),
                //         mobile: $("#user-tel").val(),
                //         password: $('#user-pass').val()
                //     }
                // }else if(sles.flag=='basic'){
                //     args_brain= {
                //         username:$("#user-name").val(),
                //         age: $("#user-age").val(),
                //         grade: $("#user-edu").val(),
                //         sex: $("input[name='gender']:checked").val(),
                //         utype: '2',
                //         adduid: $("input[name='adduid']").val(),
                //         mobile: $("input[name='telephone']").val()
                //     }
                // }
                    console.log(args_brain)
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
              console.log(val);
              if(!val){
                  // console.log(1111)
                obj.addClass(sles.red);
                obj.siblings(sles.tips).html(data);
                // tip.html(data);
                return false;
              }else{
                  // console.log(2222)
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
                  flag= (!val.match(CON.NUM));
                  if (!vSpecial(obj, data, flag)) {
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
                // console.log(old.username,newV.username)&&old.password==newV.password
                if(old.username==newV.username&&old.realname==newV.realname&&old.age==newV.age&&old.grade==newV.grade&&old.sex==newV.sex){
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