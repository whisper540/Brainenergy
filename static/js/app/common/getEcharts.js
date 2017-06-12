/**
 * Created by Administrator on 2017-05-18.
 */
define(function(require, exports, module){
    var getEcharts = null,
        elems = {},
        sels = {
            chart : '.m-echarts'
        };
        require('echarts');
    getEcharts = {
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            elems.chart = $(sels.sels);
            elems.container = $(sels.container)[0];
            this.setOption(sels.echartData);
            this.getChart(elems.container);
        },
        getChart: function(){
            // console.log(elems.container, this.option)
            var chart = echarts.init(elems.container)
            chart.setOption(this.option);
            window.onresize = chart.resize;
        },
        setOption: function(opts){
            this.option = {
                color: ['#3398DB'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis : [
                    {
                        type : 'category',
                        data : opts.datas,
                        axisTick: {
                            alignWithLabel: true
                        }
                    }
                ],
                yAxis : [
                    {
                        min: 0,
                        type : 'value',
                        name: '分项结果'
                    }
                ],
                series : [
                    {
                        name:'分项结果',
                        type:'bar',
                        barWidth: '60%',
                        // data:[10, 52, 200, 334, 390, 330, 220]
                        data: opts.serias,
                         markLine : {
                            data : [
                                {
                                    name: '良好',
                                    yAxis: 70,
                                    lineStyle:{
                                        normal:{
                                            color:'green'
                                        }
                                    }
                                },
                                {
                                    name: '中下',
                                    yAxis: 25,
                                    lineStyle:{
                                        normal:{
                                            color:'red'
                                        }
                                    }
                                },
                            ]
                        }
                    }
                ]
            };
        }
    };
    module.exports = getEcharts;
});