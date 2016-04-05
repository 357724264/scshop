/* 
 * 调用方法：
 * 	$.alert(text, [title, callbackOk])
 *  	text —— string. Alert文本
 *		title —— string. options. Alert modal 标题
 *		callbackOk —— function. options. 在Alert modal下，当用户点击“Ok”按钮时，回调函数将被执行
 *
 *	$.confirm(text, [title, callbackOk, callbackCancel])
 *  	text —— string. Alert文本
 *		title —— string. options. Alert modal 标题
 *		callbackOk —— function. options. 在Alert modal下，当用户点击“ok”按钮时，回调函数将被执行
 *		callbackCancel —— function. options. 在Alert modal下，当用户点击“cancel”按钮时，回调函数将被执行
 *
*/

;(function($) {
	"use strict";
	var defaults = {
		title:"",
		text:"error",
		modelbtnok:'确定',
		modelbtncancel:'取消',
		modelContainer:document.body
	};
    var _modelTemplateTempDiv = document.createElement('div');

    $.modelStack = [];
    $.modelStackClearQueue = function () {
        if ($.modelStack.length) {
            ($.modelStack.shift())();
        }
    };

	$.extend({	
		model:function(params){
			params=params || {};
			var modelHTML="";
			var buttonsHTML="";
			if(params.buttons && params.buttons.length > 0){
				for(var i=0; i< params.buttons.length; i++){
					buttonsHTML+='<a href="#" class="model-btn'+(params.buttons[i].bold ? ' model-button-bold' : '') + '">'+params.buttons[i].text+'</a>';
				}
			}
			var titleHTML=params.title ? '<div class="model-title">'+ params.title +'</div>' : '';
			var textHTML=params.text ? '<div class="model-text">'+ params.text +'</div>' : '';
			modelHTML=	'<div class="model">'+
							'<div class="model-inner">'+(titleHTML+textHTML)+'</div>'+
							'<div class="model-buttons">'+buttonsHTML+'</div>'+
						'</div>';

			_modelTemplateTempDiv.innerHTML = modelHTML;

        	var model = $(_modelTemplateTempDiv).children();

        	$(defaults.modelContainer).append(model[0]);

        	model.find('.model-btn').each(function(index,ele){
        		$(ele).on('click', function (e) {
	                if (params.buttons[index].close !== false) $.closeModal(model);
	                if (params.buttons[index].onClick) params.buttons[index].onClick(model, e);
	                if (params.onClick) params.onClick(model, index);
	            });
        	})
        	$.openModal(model);
        	return model[0];
		},
		alert:function(text,title,callbackOk,options){
			var options=$.extend(defaults,options);
			if (typeof title === 'function') {
	            callbackOk = arguments[1];
	            title = undefined
	        }
			return $.model({
				text:text || "",
				title: typeof title === 'undefined' ? defaults.title : title,
				buttons:[
					{text:options.modelbtnok, onClick:callbackOk}
				]
			});
		},
		confirm:function(text,title,callbackOk,callbackCancel,options){
			var options=$.extend(defaults,options);
			if (typeof title === 'function') {
	            callbackCancel = arguments[2];
	            callbackOk = arguments[1];
	            title = undefined
	        }
			return $.model({
				text:text || "",
				title: typeof title === 'undefined' ? defaults.title : title,
				buttons:[
					{text:options.modelbtncancel, onClick:callbackCancel},
					{text:options.modelbtnok, bold:true, onClick:callbackOk}
				]
			});
		},
		closeModal:function(model){
			model = $(model || '.model-in');
	        if (typeof model !== 'undefined' && model.length === 0) {
	            return;
	        }

	        var isModel = model.hasClass('model');
	        var overlay = $('.pop');
	        overlay.removeClass('pop-visible')

	        model.removeClass('model-in').addClass('model-out');

	        setTimeout(function (e) {
	            if (model.hasClass('model-out')) model.trigger('closed');
	            else model.trigger('opened');
	            model.remove();
	        },400);

	        if (isModel &&  defaults.modelStack ) {
	            $.modelStackClearQueue();
	        }

	        return true;
		},
		openModal:function(model,cb){
			model = $(model);

        	var isModel = model.hasClass('model');

        	if ($('.model.model-in:not(.model-out)').length && defaults.modelStack && isModel) {
	            $.modelStack.push(function () {
	                $.openModal(model, cb);
	            });
	            return;
	        }
	        
	        if($('.pop').length ===0){
	        	$(defaults.modelContainer).append('<div class="pop"></div>');
	        }

	        if (isModel) {
	            model.show();
	            model.css({
	                marginTop: - Math.round(model.outerHeight() / 2) + 'px'
	            });
	        }

	        var overlay = $('.pop');
	        overlay.addClass('pop-visible');

	        model.removeClass('model-out').addClass('model-in');
	        setTimeout(function(e){
	            if (model.hasClass('model-out')) model.trigger('closed');
	            else model.trigger('opened');
	        },400);

	        if (typeof cb === 'function') {
	          cb.call(this);
	        }
	        return true;
		}
	})
})(jQuery);