function haoping(id){
	$(id).each(function(index){
		var $this = $(this);		
		var ele=$this.find('i');
		var Os = '';
		var Oa = '';
		var Otf = true;
		var num = 0;		
		
		//初始化
		function csh(){
			for(var i=0;i<ele.length;i++){
				ele[i].setAttribute('class','iconfont icon-xingxing3');
				$this.attr('data-val','');
			}
		}	
		
		for(var i=0;i<ele.length;i++){
			ele[i].inni = i;
			ele[i].onmouseover = function(){
				csh();
				for(var j=0;j<=this.inni;j++){
					ele[j].setAttribute('class','iconfont icon-xingxing3 cur');
				}
			}
			ele[i].onclick = function(){
				csh();
				for(var j=0;j<=this.inni;j++){
					ele[j].setAttribute('class','iconfont icon-xingxing3 cur');
					if( j == 0 ){
						$this.attr('data-val','1');
					}else if( j == 1 ){
						$this.attr('data-val','2');
					}else if( j == 2 ){
						$this.attr('data-val','3');
					}else if( j == 3 ){
						$this.attr('data-val','4');
					}else{
						$this.attr('data-val','5');
					}
				}
				Os = this.src;
				Oa = $this.attr('data-val');
				Otf = false;
				num = this.inni;
			}
			
			ele[i].onmouseout = function(){
				if( Otf ){
					csh();
				}else{
					if(Oa != ''){
						csh();
						for(var j=0;j<=num;j++){
							ele[j].setAttribute('class','iconfont icon-xingxing3 cur');
						}
						$this.attr('data-val',Oa);
					}
				}
			}
		}
	})	
}

