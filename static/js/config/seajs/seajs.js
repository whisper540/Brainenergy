seajs.config({
    //http://127.0.0.1:8888/static/js
    base: "/static/js",
    alias: {
        api: 'config/api/api',
        slide: 'app/common/slide',
        //处理字符
        dealtext: 'app/common/dealtext',
        //echarts
        echarts: 'framework/echarts/source/common/echarts.common.min',
        //获取echarts图表
        getEcharts: 'app/common/getEcharts',
        //juicer模板
        juicer: 'framework/juicer/source/0.6.10/juicer-min',
        //cookie
        cookie: 'framework/jquery/plugin/cookie/1.4.1/jquery.cookie',
        //表单验证
        form: 'app/student/form',
        //分项目介绍文字
        introtext: 'app/common/introtext',
        //处理密码部分
        pass: 'app/common/pass',
        // 确认密码
        confirm: 'app/common/confirm',
        // swiper
        swiper: 'framework/swiper/swiper',
        // tip
        tip: 'app/common/tip'
    }
});