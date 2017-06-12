/**
 * Created by Administrator on 2017-05-19.
 */
$.fn.dealtext= function(len){
	return $(this).each(function(index, elem){
		var self= $(elem),
			txt= self.hasClass('u-in') ? self.val().replace(/\s+/g,"") : self.text().replace(/\s+/g,""),
			length= txt.length,
			finallen= 0;
		if(length>len){
			if(self.hasClass('u-in')){
				self.val(txt.substring(0, len) + '...');
			}else{
				self.html(txt.substring(0, len) + '...');
			}
		}

		// for(var i=0; i < length; i++){
		// 	var num= txt.charCodeAt(i);
		// 	if(finallen >= len){
		// 		self.html(txt.substring(0, i) + '...');
		// 		break;
		// 	}
		// 	if(num>=0 && num<=128){
		// 		finallen++;
		// 	}else{
		// 		finallen += 2;
		// 	}
		// }
	})
};