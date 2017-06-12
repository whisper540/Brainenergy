/**
 * Created by Administrator on 2017-05-24.
 */
define(function(require, exports, module){
    var analysis = null,
        elems = {},
        sels = {
            wrap: '.m-single-analysis',
            strong: '.m-strong-brain',
            strong_child: '.strong',
            wrap_weak: '.m-wrap-weak',
            weak: '.m-weak-brain',
            weak_child: '.weak',
            week_score: '.score',
            week_exceed: '.exceed',
            classify: '.u-classify-brain'
        },
        CON={
            HIDE: 'fn-hide'
        },
        introtext= require('introtext');
    require('juicer');

    analysis = {
        init: function (obj) {
            if (obj && Object.prototype.toString.call(obj) != '[object Object]') {
                return;
            }
            sels = $.extend({}, sels, obj);
            elems.wrap= $(sels.wrap);
            elems.strong= $(sels.strong);
            elems.wrap_weak= $(sels.wrap_weak);
            this.getHtml();
        },
        getPercent: function(score){
            if(score<5){
                return {
                    percent: '0%',
                    line: '欠佳'
                };
            }else if(score<=24){
                return {
                    percent: '5%',
                    line: '中下'
                };
            }else if(score<=69){
                return {
                    percent: '25%',
                    line: '中等'
                };
            }else if(score<90){
                return {
                    percent: '70%',
                    line: '良好'
                };
            }else{
                return {
                    percent: '90%',
                    line: '出色'
                };
            }
        },
        getHtml: function(){
            var self= this,
                key, value, desc, res;
            if(sels.score_90.length>0){
                elems.strong.find(sels.strong_child).html(sels.score_90.join('、')).end().removeClass(CON.HIDE);
            }
            if(sels.score_70.length>0){
                elems.wrap_weak.find(sels.weak_child).html(sels.score_70.join('、'));

                for(key in total_70){
                    value= total_70[key];
                    res= self.getPercent(value);
                    // percent= res.percent;
                    // line= res.line;
                    desc= introtext[key];
                    elems.wrap_weak.append(self.getString(key, value, res, desc));
                }
                elems.wrap_weak.removeClass(CON.HIDE);
            }
            elems.wrap.removeClass(CON.HIDE);
        },
        getString: function(key, value, res, desc){
            return ['<div class="m-lst-weak">',
                        '<p class="m-result-brain">您孩子的'+ key +'评估分数为：<span class="f-text-red score">'+value + '分</span>，处于<span class="f-text-red">'+ res.line +'水平</span>，这一分数超过同龄人的<span class="f-text-red exceed">'+ res.percent +'</span></p>',
                        '<table class="table">',
                          '<thead>',
                            '<tr class="top-line">',
                              '<th>&nbsp;</th>',
                              '<th class="s-excellent">出色</th>',
                              '<th class="s-well">良好</th>',
                              '<th class="s-good">中等</th>',
                              '<th class="s-weak">中下</th>',
                              '<th class="s-low">欠佳</th>',
                            '</tr>',
                          '</thead>',
                          '<tbody>',
                            '<tr>',
                              '<th scope="row">'+ key +'</th>',
                              '<td>大于89</td>',
                              '<td>70~89</td>',
                              '<td>25~69</td>',
                              '<td>5~24</td>',
                              '<td>小于5</td>',
                            '</tr>',
                            '<tr class="bottom-line">',
                              '<th scope="row">超过同龄人</th>',
                              '<td>90%</td>',
                              '<td>70%</td>',
                              '<td>25%</td>',
                              '<td>5%</td>',
                              '<td>0%</td>',
                            '</tr>',
                          '</tbody>',
                        '</table>',
                        '<p><span class="u-classify-brain f-text-red">'+ key+'</span>' + desc + '</p>',
                    '</div>',
                ].join('');
        }
    }
    module.exports= analysis;
})