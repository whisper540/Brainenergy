/**
 * Created by Administrator on 2017-05-19.
 */
define(function(require, exports, module){
    var search= null,
        sels= {
            info_lst: '#tbody_list',
            search: '.m-form-sch',
            name: 'search',
            result: '.u-hasno-search',
            pageing: '#pagination'
        },
        elems= {},
        CON={
           HIDE: 'fn-hide'
        }
        api= require('api');
        require('juicer');
    search= {
        init: function(obj){
            if(obj && Object.prototype.toString.call(obj)!='[object Object]'){
                return;
            }
            sels = $.extend({}, sels, obj);
            elems.info_lst = $(sels.info_lst);
            elems.access_token= localStorage.getItem('access_token');
            elems.search= $(sels.search);
            elems.result= $(sels.result);
            elems.pageing= $(sels.pageing);
            //获取列表信息
            this.bindEvent();
        },
        bindEvent: function(){
            var self= this;
            //搜索用户
            elems.search.submit(function(){
                var keyword = this[sels.name].value.trim();
                // keyword = $("#keyword").val();
                location.href="/teacher/home/?keyword="+keyword;
                // elems.result.addClass(CON.HIDE)
                // elems.info_lst.html('');
                // console.log(keyword);
                // return false;
                // $.ajax({
                //   type: 'POST',
                //   url: api.search_manager,
                //   dataType: 'json',
                //   data:{
                //     'keyword':keyword,
                //   },
                //   success:function(response, stutas, xhr){
                //     if(response.length==0){
                //         elems.result.removeClass(CON.HIDE);
                //         elems.pageing.accClass(CON.HIDE)
                        // return false;
                    // }
                    // elems.info_lst.append(self.getHtml(response));
                    // }
                // });
                return false;
            });
        },
        getHtml: function(datas){
            var tpl= ['{@each data as item}',
					'$${item|item_build}',
				  '{@/each}'].join(''),
                getItem= function(item){
                    // console.log(item)
                    var str = '', sex= '男';
                    if(item.sex==1){
                      sex= '女';
                    }else if(item.sex==9){
                        sex= '其他';
                    }
                    str += "<tr>"
                        // +"<td>"+item.username+"</td>"
                        +"<td>"+item.realname+"</td>"
                        +"<td>"+sex+"</td>"
                        +"<td>"+item.age+"</td>"
                        +"<td><a href='\/teacher\/scalelist\/\?uid="+item.id+"'>立即测评</a></td>"
                        +"<td><a href='\/manager\/collect\/?uid="+item.id+"'>查看</a></td>"
                        +"<\/tr>";
                    return str;
                };
            juicer.unregister('item_build');
            juicer.register('item_build', getItem);
            return juicer(tpl, {data: datas});
        }
    };
    module.exports= search;
})