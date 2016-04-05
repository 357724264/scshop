var eventuti={
	//添加句柄
	addHandler:function(element,type,handler){
		if(element.addEventListener){
			element.addEventListener(type,handler,false);  //判断DOM2级事件处理程序
		}else if(element.attachEvent){
			element.attachEvent('on'+type,handler);   //判断IE事件处理程序
		}else{
			element['on'+type]=handler;  //判断DOM0级事件处理程序
		}
	},
	//删除句柄
	removeHandler:function(element,type,handler){
		if(element.removeEventListener){
			element.removeEventListener(type,handler,false);  //判断DOM2级事件处理程序
		}else if(element.detachEvent){
			element.detachEvent('on'+type,handler);   //判断IE事件处理程序
		}else{
			element['on'+type]=null;   //判断DOM0级事件处理程序
		}
	},
	//获取事件
	getEvent:function(event){
		return event?event:window.event;
	},
	//获取当前事件目标
	getEventtarget:function(event){
		return event.target||event.srcElement;
	},
	//阻止默认事件
	preventDefault:function(event){
		if(event.preventDefault){
			event.preventDefault();
		}else{
			event.returnValue=false;
		}
	},
	//阻止事件冒泡
	stopPropagation:function(event){
		if(event.stopPropagation){
			event.stopPropagation();
		}else{
			event.cancelBubble=true;
		}
	}
};

