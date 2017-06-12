/**
 * Created by Administrator on 2017-05-26.
 */
define(function(require, exports, module){
    var exam= null,
        sels= {
            sbBtn: '#sbBtn',
            brainForm: '#brainForm'
        },
        elems={},
        api= require('api'),
        flag= false;
    exam= {
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            elems.sbBtn= $(sels.sbBtn);
            elems.brainForm= $("#brainForm")
            this.bindEvent();
        },
        bindEvent: function(){
            var self= this;
            elems.sbBtn.on('click',function () {
              var questions = elems.brainForm.serializeArray();
              var qdatas = JSON.stringify(questions);
              var qtest = JSON.parse(qdatas);
              var comscore = 0;
              var datas = {};
              var datastotal = {};
              var tag = 0;
              //处理做题完毕后，数据格式
              var totalscore = 0;
              if(flag){
                  flag= false;
                  return false;
              }
              flag= true;
              for(var q in qtest){
                  datas[q]={}
                  var abilityid = $("#qid"+qtest[q]['name']).val();
                  var m = $("#m"+qtest[q]['name']).val();
                  var sd = $("#sd"+qtest[q]['name']).val();
                  datas[q]['qid']=qtest[q]['name'];
                  datas[q]['scoreR']=qtest[q]['value'];//真实分数
                  datas[q]['scoreX']=self.doX(datas[q]['scoreR'],m,sd);//X得分
                  datas[q]['scoreT']=self.doT(datas[q]['scoreX']);//展示分数
                  datas[q]['ability']=abilityid;
                  datas[q]['m']=m;
                  datas[q]['sd']=sd;
                  //计算标准分的平均值，并计算出综合得分
                  comscore += datas[q]['scoreX'];
                  if(q == qtest.length-1){
                      comscore = comscore/(qtest.length);
                      comscore=self.doC(comscore);
                  }
                  //End计算标准分的平均值，并计算出综合得分
              }
              datastotal['history']=datas;
              datastotal['com']=comscore;
              datastotal = JSON.stringify(datastotal);
              localStorage.setItem('qhistory',datastotal);
              console.log(localStorage.getItem('qhistory'));

              //End处理做题完毕后，数据格式
              $.ajax({
                  type: 'POST',
                  url: api.save_report,
                  dataType: 'json',
                  data: {
                      userid: sels.uid,
                      stype: sels.stype,
                      questions: datastotal
                  },
                  success:function(response, stutas, xhr){
                      console.log(response)
                      flag= false;
                      //跳转到测评页面
                      if(response){
                          $(location).prop('href', api.save_report + '?uid=' + sels.uid);
                      }

                  },
                  error: function(){
                      flag= false;
                      // alert(1111)
                  }
              });
          });
        },
        //进行X得分操作(标准分X)
        doX: function (scoreR,m,sd){
          var scoreX=(scoreR-m)/sd;
          return scoreX;
        },
        //End进行X得分操作(标准分X)
        //计算展示在测评报告的分数
        doT: function (scoreX){
          var scoreT=scoreX*0.9;
          return scoreT;
        },
        //End计算展示在测评报告的分数
        //计算综合得分
        doC: function (scoreAvg){
          var scoreC=scoreAvg*0.9;
          return scoreC;
        }
        //End计算综合得分
    };
    module.exports= exam;
});