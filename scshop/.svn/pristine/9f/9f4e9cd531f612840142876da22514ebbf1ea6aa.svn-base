
;(function($) {
	$.extend($.fn,{
		countdown: function(opts){      		
			var defaults = {now:null, start:null, end:null};
			var options = $.extend(defaults, opts);
			
			function setTimeShow(id,start,end){
				var now_time=new Date().getTime(),
					start_time=new Date(start).getTime(),
					end_time=new Date(end).getTime(),
					start_distance=start_time-now_time,
					end_distance=end_time-now_time;

				var countdowntime, int_day, int_hour, int_minute, int_second;
				var obj=$(id);

				start_distance=start_distance-1000;
				end_distance=end_distance-1000;

				if(start_distance>=end_distance){
					//alert("开始时间不能晚于结束时间");
					return false;
				}else{

					if (start_distance >=0) {
						//天
				        // int_day = Math.floor(start_distance / 86400000);
				        // start_distance -= int_day * 86400000;
						
				        int_hour = Math.floor(start_distance / 3600000);
				        start_distance -= int_hour * 3600000;
						
				        int_minute = Math.floor(start_distance / 60000);
				        start_distance -= int_minute * 60000;
						
				        int_second = Math.floor(start_distance / 1000);

						if (int_hour < 10)
				            int_hour = "0" + int_hour;
				        if (int_minute < 10)
				            int_minute = "0" + int_minute;
				        if (int_second < 10)
				            int_second = "0" + int_second;

				        var hour='<span class="hour">'+int_hour+'小时</span>',
							minute='<span class="minute">'+int_minute+'分</span>',
							second='<span class="second">'+int_second+'秒</span>';

						if(int_hour==0){
							hour="";
							if(int_minute==0){
								minute="";
							}	
						}
						
						str_time='还有'+hour+minute+second+'开始';

			        	obj.html(str_time);
						
			        	var t=setTimeout(function () { setTimeShow(id,start,end); }, 1000); //D:正确
			    	}

					if(start_distance<0&&end_distance>=0)
					{
						//天
						// int_day_e= Math.floor(end_distance / 86400000);
			   			// end_distance -= int_day_e * 86400000;
						
						int_hour_e = Math.floor(end_distance / 3600000);
						end_distance -= int_hour_e * 3600000;
						
						int_minute_e = Math.floor(end_distance / 60000);
						end_distance -= int_minute_e * 60000;
						
						int_second_e = Math.floor(end_distance / 1000);
						end_distance -= int_second_e * 1000;

						int_second_MS=Math.floor(end_distance/100);

						if (int_hour_e < 10)
							int_hour_e = "0" + int_hour_e;
						if (int_minute_e < 10)
							int_minute_e = "0" + int_minute_e;
						if (int_second_e < 10)
							int_second_e = "0" + int_second_e;

						var hour='<span class="hour">'+int_hour_e+'小时</span>',
							minute='<span class="minute">'+int_minute_e+'分</span>',
							second='<span class="second">'+int_second_e+'秒</span>';

						if(int_hour_e==0){
							hour="";
							if(int_minute_e==0){
								minute="";
							}
						}
													
						str_time=hour+minute+second;
			        	obj.html(str_time);

			        	var t=setTimeout(function () { setTimeShow(id,start,end); }, 1000); //D:正确
					}
					else if(start_distance<0)
					{
						obj.text("到时未支付，订单已取消。");
						return;
					}
				}
				
			}

			$(this).each(function(){
				var obj=$(this);
				var start=obj.attr('data-start').replace(/-/g, "/"),
					end=obj.attr('data-end').replace(/-/g, "/");

				setTimeShow(obj,start,end);
			})
     	}
	})

})(Zepto)