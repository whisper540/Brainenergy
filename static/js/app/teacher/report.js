/**
 * Created by Administrator on 2017-05-17.
 */
define(function(require, exports, module) {
    var teacher= null,
        elems={},
        sels={
            reportRes: '.m-report-result',
            uname: '.u-user-name',
            swiper_slide: '.swiper-slide',
            arrow: '.u-arrow'
        },
        CON= {
            HIDE: 'fn-hide',
            LEN: 10
        },
        api= require('api'),
        getEcharts= require('getEcharts'),
        swiper= require('swiper'),
        dealtext= require('dealtext');
    teacher = {
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);

            sels.pos++;
            elems.reportRes = $(sels.reportRes);
            elems.people= $(sels.people);
            elems.evalution= $(sels.evalution);
            elems.uname= $(sels.uname);
            elems.swiper_slide= $(sels.swiper_slide);
            // console.log('length:' + elems.swiper_slide.length)
            elems.arrow= $(sels.arrow);

            this.setPeople();
            this.setUsername();
            this.getSwiper();
            sels.echarts.forEach(function(elem){
                getEcharts.init(elem);
            })
        },
        setPeople: function(){
            // var size= parseInt(elems.people.eq(sels.pos-1).css('fontSize').split('px')[0])+5;
            // console.log(elems.people.eq(sels.pos-1).css('fontSize'))
            elems.evalution.html(this.getEvalution(sels.pos));
            //u-cur-user
            elems.people.eq(sels.pos-1).addClass('u-cur-u').children('.u-tip-user-bot').removeClass(CON.HIDE).end().parents(sels.parent).removeClass(CON.HIDE);

        },
        getEvalution: function(pos){
            if(pos==1){
                return '发育迟缓';
            }else if(pos<=5 && pos>1){
                return '中等偏下';
            }else if(pos<=15 && pos>5){
                return '中等';
            }else if(pos<=19 && pos>15){
                return '良好';
            }else if(pos==20){
                return '优秀';
            }
        },
        setUsername: function(){
            // console.log(elems.uname)
            elems.uname.dealtext(CON.LEN);
        },
        getSwiper: function(){
            if(elems.swiper_slide.length>2){
                elems.arrow.removeClass(CON.HIDE);
            }
            $('.preview .arrow-left').on('click', function(e) {
                e.preventDefault()
                if (previewSwiper.activeIndex == 0) {
                    updateNavPosition1(previewSwiper.slides.length - 1);
                    return
                }
                updateNavPosition1(previewSwiper.activeIndex-1)
            })
            $('.preview .arrow-right').on('click', function(e) {
                e.preventDefault();
                console.log(previewSwiper.activeIndex)
                if (previewSwiper.activeIndex == previewSwiper.slides.length - 1) {
                    updateNavPosition1(0);
                    return
                }
                updateNavPosition1(previewSwiper.activeIndex+1)
            })

            var previewSwiper = new Swiper('.preview .swiper-container', {
                visibilityFullFit: true,
                slidesPerView: 'auto',
                onlyExternal: true,
                onSlideClick: function() {
                    updateNavPosition1(previewSwiper.clickedSlideIndex)
                }
            });
            function updateNavPosition1(index){
                $('.preview .active-nav').removeClass('active-nav')
                var activeNav = $('.preview .swiper-slide').eq(index).addClass('active-nav')
                if (!activeNav.hasClass('swiper-slide-visible')) {
                    if (index > previewSwiper.activeIndex) {
                        var thumbsPerNav = Math.floor(previewSwiper.width / activeNav.width()) - 1
                        previewSwiper.swipeTo(index - thumbsPerNav)
                    } else {
                        previewSwiper.swipeTo(index)
                    }
                }
                previewSwiper.activeIndex= index;
                console.log(index, previewSwiper.activeIndex)
            }
        }
    }
    module.exports = teacher;
})