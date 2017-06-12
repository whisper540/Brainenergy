define(function(require, exports, module){
	var slide,
		sles= {
			wrap: '.m-wrap-slide',
			lsts: '.m-slide-lsts2',
			lst: '.m-slide-lst2',
			bimg: '.m-report-result',
			simg: '.u-slide-img1',
			desc: '.u-slide-txt',
			move: '.u-move',
			left: 'u-move-l',
			right: 'u-move-r',
			_left: '.u-move-l',
			_right: '.u-move-r'
		},
		elems={},
		CON= {
            SNUM: 9,
            CUR: 'cur',
            HIDE: 'fn-hide'
		},
		data= {
			src: 'img_src',
			desc: 'img_desc'
		},
		// num= 5,
		zu= 1,
		zus= 0;
	slide= {
		init: function(opts){
			var len;
			if(opts && Object.prototype.toString.call(opts)!='[object Object]'){
                return false;
            }
            sles= $.extend({}, sles, opts);
            elems.wrap= $(sles.wrap);
            if(sles.snum){
            	CON.SNUM= sles.snum;
            }
            this.bindEvent();
		},
		bindEvent: function(){
			elems.wrap.each(function(index, elem){
				var self= $(this),
					hasLoad= CON.SNUM,
					index=0,
					base,
					lsts= self.find(sles.lsts),
					lst= lsts.find(sles.lst),
					bimg= self.find(sles.bimg),
					simg= self.find(sles.simg),
					desc= self.find(sles.desc),
					// current= self.find(sles.current);
					move= self.find(sles.move);
	            left= move.filter(sles._left);
	            right= move.filter(sles._right);
	            len= lst.length;
	            //此处的index值可以通过后端套模版获取
	            for (var i=0;i<len;i++){
	            	if(lst.eq(i).hasClass('cur')){
	            		index= i;
	            		break;
					}
				}
				// index= sles.cur_index;
	            console.log(index);
	            if(len>CON.SNUM){
	            	right.removeClass(CON.HIDE);
	            }
	            if(sles.direction=='tTob'){
	            	base= lst.outerHeight(true);
	            	lsts.height(base*len);
	            }else{
	            	base= lst.outerWidth(true);
	            	lsts.width(base*len);
	            }
	            lst.on('click', function(){
	            	var _this= $(this);
	            	index= _this.index();
	            	if(index==0){
            			left.addClass(CON.HIDE);
            		}else if(index==len-1){
            			right.addClass(CON.HIDE);
            		}else{
            			move.removeClass(CON.HIDE);
            		}
            		change(index, _this);
	            });
	            move.on('click', function(){
	            	var _this= $(this),
	            		marginl, moved;
	            	console.log(index, zu, zus)
	            	if(_this.hasClass(sles.left)){
	            		zus= (zu-1)*CON.SNUM;
            			if(index==zus){
            				zu--;
            				marginl= -(zu-1)*CON.SNUM*base;
            				if(sles.direction=='tTob'){
            					moved= {'marginTop': marginl}
            				}else{
            					moved= {'marginLeft': marginl}
            				}
            				lsts.animate(moved);
            			}
	            		--index;
	            	}else{
	            		++index;
	            		zus= zu*CON.SNUM;
	            		if(index==zus){
	            			marginl= -(zus*base);
            				if(sles.direction=='tTob'){
            					moved= {'marginTop': marginl}
            				}else{
            					moved= {'marginLeft': marginl}
            				}
            				lsts.animate(moved);
	            			zu++;
	            		}
	            	}
	            	if(index==0||index==len-1){
            			_this.addClass(CON.HIDE);
            		}else{
            			move.removeClass(CON.HIDE);
            		}
            		change(index, lst.eq(index));
	            });
	            function change(ind, elem){
	            	var curitem= simg.eq(index);
	            	// bimg.eq(ind).removeClass(CON.HIDE).siblings().addClass(CON.HIDE);
	            	elem.addClass(CON.CUR).siblings().removeClass(CON.CUR);
	            	// current.html(ind+1);
	            }
			});
		}
	};

	module.exports= slide;
});