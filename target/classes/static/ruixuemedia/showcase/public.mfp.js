/*
	依赖jQuery2.0
	author：马凡品
*/

var MFP = {
		init_index: function(){}
	};

//工具箱
var Utils = {
	/*
		联系我们飘窗2.0 - 同老站相同代码
		依赖方法：sidebarContactAnimat_scroll()
	*/
	sidebarContactAnimat:function(){
		Utils.sidebarContactAnimat_scroll();
		$(window).scroll(function(){
			Utils.sidebarContactAnimat_scroll();
		});
		$(".sidebar-contact-2 .close").click(function(){
			$(".sidebar-contact-2").stop().animate({"width":"33px"}, 300);	
		});
		$(".sidebar-contact-2 .title").click(function(){
			$(".sidebar-contact-2").stop().animate({"width":"180px"}, 300);	
		});
		
		
	},
	//联系方式飘窗——位置重置
	sidebarContactAnimat_scroll: function(){
		var t = $(window).scrollTop();	
		var mt = t + 200;
		$(".sidebar-contact-2").stop().animate({"top":mt+"px"},500);	
	},
	/*
		侧边栏菜单
	*/
	asideMenuAnimatInit: function(){
		var menuObj = $(".newsight-menu"), coverObj = $(".newsight-cover"), menuButtonObj = $(".xc-menu-bt");
		menuObj.find(".newsight-menu-close").click(function(){
			menuObj.stop().animate({"width":"0"},500,function(){
				coverObj.stop().fadeOut();	
			});	
		});	
		menuButtonObj.click(function(){
			coverObj.stop().fadeIn(200,function(){
				menuObj.stop().animate({"width":"751px"},500);	
			})
		});
		coverObj.click(function(){
			menuObj.find(".newsight-menu-close").click();
		});
	},
	/*
		主菜单动画特效
	*/
	menuMainAnimat: function(){
		$(".xc-menu-bt").hover(function(){
			$(this).find(".content").animate({"top":"13px","left":"13px"},300);
		},function(){
			$(this).find(".content").animate({"top":"5px","left":"5px"},500);	
		});	
	},
	//使用QQ企业级客服时，启动该功能。
	asideQQPositionInit: function(){
		$(window).load(function(){
			var qqObj = $("#qidian_wpa_7");
			if(qqObj[0] != undefined){
				qqObj.css({"top":"auto", "bottom":"110px"});	
			}
		});	
	},
	/*
		图片延迟加载
	*/
	picLazyLoad: function(){
		$("img.lazy").lazyload({effect:"fadeIn"});		
	},
	/*
		返回顶部
	*/
	returnTopAnimatInit: function(){
		var toTopObj = $(".newsight-totop");
		toTopObj.click(function(){
			$("html, body").stop().animate({"scrollTop":"0"},500);	
		});
		$(window).scroll(function(){
			var winst = $(window).scrollTop();
			if(winst>300){
				toTopObj.stop().fadeIn(100);
			}else{
				toTopObj.stop().fadeOut(200);	
			}	
		});	
	}
}
/*
	组件工厂
*/
var CompFactory = {
	//caseshow
	caseShowAnimat: function(id){
	//	alert(id);
		var winWidth = $(window).width(), mvbox = $("#plv_5b4ae2e2541de5fee81eed87e9c8c8b9_5"),  b = true, dis = 0, slbTop = 0, mvllTop = 0, mvlist = $(".mvlist"), mvlistLong = mvlist.find("ul"), scrollLine = $(".mvlist-scroll"), slButton = scrollLine.find("div");
		
		//视频和视频列表
		if(winWidth - 1400 >= 0){
			resetMVGt1400()
		}else if(winWidth - 1400 < 0){
			resetMVLt1400();
		}
		
		//列表滚动条
		mvlistH = mvlist.height(), scrollLineH = scrollLine.height(), mvlistLongH = mvlistLong.height();
		var scrollLineButtonH = mvlistH * scrollLineH / mvlistLongH, maxslbH = scrollLineH - scrollLineButtonH, scale = mvlistH / scrollLineButtonH, maxmvllH = mvlistH - mvlistLongH;
		//列表元素较少，不足以存在滑块时，设置滑块属性为0；
		if(mvlistLongH < mvlistH){
			scrollLineButtonH = 0;
		}
		slButton.css("height",scrollLineButtonH + "px").mousedown(function(e){
			
			var p0 = e.pageY, scrollLineTop = slButton.css("top").replace("px","")- 0, mvlistLongTop = mvlistLong.css("top").replace("px","") - 0;			
			$(window).bind('mousemove',function(e){
				e.preventDefault();
				dis = e.pageY - p0; //滑块移动距离
				slbTop = scrollLineTop + dis, mvllTop = mvlistLongTop - dis * scale;
				if(slbTop<=0){
					slbTop = 0;	
					mvllTop = 0;
				}else if(slbTop >= maxslbH){
					slbTop = maxslbH;
					mvllTop = maxmvllH;	
				}
				slButton.css("top",slbTop+"px");
				mvlistLong.css("top",mvllTop + "px");
		//		$("#aaa").html(dis)
			});	
		});
		$(window).mouseup(function(){
			$(window).unbind("mousemove");
		});		
		
		$(window).resize(function(){
			winWidth = $(window).width();
			if(b && winWidth - 1400 >= 0){
		//		alert();
				resetMVGt1400();
				
				resetScrollButton();
			}else if(!b && winWidth - 1400 < 0){
		//		alert(2)
				resetMVLt1400();
				
				resetScrollButton();
			}
		});	
		
		function resetMVGt1400(){
			mvlist.css("height","695px");
			mvbox.css({"width":"1080px","height":"695px"});
			mvbox.find("object").css({"width":"1080px","height":"695px"});
			b = false;	
		}
		
		function resetMVLt1400(){
			mvlist.css("height","564px");
			mvbox.css({"width":"910px","height":"564px"});
			mvbox.find("object").css({"width":"910px","height":"564px"});
			b = true;	
		}
		/*
			重置滚动条
		*/
		function resetScrollButton(){
			mvlistH = mvlist.height(), scrollLineH = scrollLine.height(), mvlistLongH = mvlistLong.height();
			scrollLineButtonH = mvlistH * scrollLineH / mvlistLongH, maxslbH = scrollLineH - scrollLineButtonH, scale = mvlistH / scrollLineButtonH, maxmvllH = mvlistH - mvlistLongH;
			if(mvlistLongH < mvlistH){
				scrollLineButtonH = 0;
			}
			slButton.css("height",scrollLineButtonH + "px");
			//mvllTop 不变的情况下，改变滑块元素属性
			slbTop = -mvllTop / scale;
			slButton.css("top",slbTop+"px");	
		}
		
		
	},
	//首页
	indexWinMoveAnimat: function(){
		var contactObj = $(".index-contact");
		
		//窗口滚动动画
		$(window).scroll(function(){
			
			var st = $(window).scrollTop(), winH = $(window).height(), caseObj = $(".index-case"), caseModuleTop = caseObj.offset().top, isAbove = (st + winH - caseModuleTop) / winH;
		
			//服务
			var serviceObj = $(".index-server"), serviceModuleTop = serviceObj.offset().top, isServiceAbove = (st + winH - serviceModuleTop) / winH;
			if(isServiceAbove>0.5){
				serviceObj.find("li").addClass("on");	
			}
			
			//案例动画
			if(isAbove>0.3){
				caseObj.find(".index-title_").animate({"opacity":"1"},300, function(){
					caseObj.find(".index-title").animate({"left":"0","opacity":"1"},500, function(){
						caseObj.find(".more").animate({"right":"0","opacity":"1"}, 500, function(){
							
						});	
					});	
					var tm = 250;
					$.each(caseObj.find(".caselist li"), function(i,n){
						$(n).animate({"opacity":"1","top":"0"},(i+1)*tm);
					});	
				});
			}
			
			//工匠精神
			var cultureObj = $(".index-culture"), cultureModuleTop = cultureObj.offset().top, isCultureAbove = (st + winH - cultureModuleTop) / winH;
			if(isCultureAbove>0.3){
				cultureObj.find(".index-title_").animate({"opacity":"1"},500, function(){
					cultureObj.find(".index-title").animate({"opacity":"1","left":"0"},800);	
				});
				cultureObj.find(".border").addClass("on").delay(800).animate({"opacity":"1"},500,function(){
					cultureObj.find(".border-content p").addClass("on").delay(1500).animate({"opacity":"1"},5,function(){
						cultureObj.find(".no").addClass("no_");	
					});
				});
			}		
			
			//服务客户
			var customerObj = $(".index-customer"), customerModuleTop = customerObj.offset().top, isCustomerAbove = (st + winH - customerModuleTop) / winH;
			if(isCustomerAbove > 0.5){
				customerObj.find(".index-title_").animate({"opacity":"1","top":"0"}, 300);
				customerObj.find(".index-title").animate({"opacity":"1","top":"0"}, 300);
				customerObj.find("ul").animate({"opacity":"1","top":"0"}, 500);
			}
			
			//新闻
			var newsObj = $(".index-news"), newsModuleTop = newsObj.offset().top, isNewsAbove = (st + winH - newsModuleTop) / winH;
			if(isNewsAbove > 0.5){
				newsObj.find(".index-title_").animate({"opacity":"1","top":"0"}, 300);
				newsObj.find(".index-title").animate({"opacity":"1","top":"0"}, 300);
				newsObj.find(".left").animate({"opacity":"1","left":"0"}, 500);
				newsObj.find(".right").animate({"opacity":"1","left":"0"}, 500);
			}
			
			//签约
			var signObj = $(".index-sign"), signModuleTop = signObj.offset().top, isSignAbove = (st + winH - signModuleTop) / winH;
			if(isSignAbove > 0.5){
				signObj.find(".index-title_").animate({"opacity":"1","top":"0"}, 300);
				signObj.find(".index-title").animate({"opacity":"1","top":"0"}, 500);
				signObj.find("ul").animate({"opacity":"1","top":"0"}, 500);
			}
			
			//联系
			var  contactModuleTop = contactObj.offset().top, isContactAbove = (st + winH - contactModuleTop)/winH;
			if(isContactAbove>0.5){
				contactObj.find(".index-title_").animate({"opacity":"1","left":"0"}, 300);
				contactObj.find(".index-title").animate({"opacity":"1","left":"0"}, 800);
				contactObj.find(".line-top, .line-bottom").css("opacity","1").animate({"width":"1200px","opacity":"1"},1000);
				contactObj.find(".line-left, .line-right").css("opacity","1").animate({"height":"600px","opacity":"1"},1000);
				contactObj.find(".c1").addClass("on_");
				contactObj.find(".c2").stop().animate({"right":"100px","opacity":"1"},1000);
				contactObj.find(".c3").stop().animate({"left":"400px","opacity":"1"},1500);
			}
		});	
		
		//联系
		contactObj.find(".c1").hover(function(){
			contactObj.find(".c3").stop().animate({"left":"530px","opacity":"1"},200);
		},function(){
			contactObj.find(".c3").stop().animate({"left":"400px","opacity":"1"},200);
		});
		
	},
	//首页banner
	indexBannerAnimat: function(){
		(function(){
			var windowWidth = $(window).width(), windowHeight = $(window).height(), bannerObj = $(".index-service"), bannerObjs = bannerObj.find(".list li"), bannerSize = bannerObjs.size(), LI_WIDTH = 60, buttonBoxWidth = bannerSize * LI_WIDTH, buttonIndex = 0, moveDistance = 0, currentWindowWidth = $(window).width(),buttonHTML = "", num = 0;
			//init
			if(windowWidth>1200){
				bannerObjs.css("width",windowWidth+"px");	
			}else{
				bannerObjs.css("width","1200px");	
			}
			
			for(var i=0; i<bannerSize; i++){
				if(num === 0){
					buttonHTML += "<li class='on'></li>";
				}else{
					buttonHTML += "<li></li>"	
				}
				num ++ ;
			}
			
			bannerObj.find(".button").css("width",buttonBoxWidth + "px").append(buttonHTML);
			var buttonObjs = bannerObj.find(".button li");
			buttonObjs.click(function(){
				buttonObjs.removeClass("on");
				$(this).addClass("on");
				currentWindowWidth = $(window).width();
				if(currentWindowWidth <= 1200){
					currentWindowWidth = 1200;	
				}
				buttonIndex = buttonObjs.index(this);
				moveDistance = currentWindowWidth * buttonIndex;
				bannerObj.find(".list").stop().animate({"left":-moveDistance+"px"},500);
				num = buttonIndex;
			});	
			
			$(window).resize(function(){
				currentWindowWidth = $(window).width();
				if(currentWindowWidth<=1200){
					currentWindowWidth = 1200;
				}
				bannerObjs.css("width",currentWindowWidth+"px");	
				moveDistance = currentWindowWidth * buttonIndex;
				bannerObj.find(".list").stop().animate({"left":-moveDistance+"px"},500);
			});
			
			num = 0;//初始化
			window.setInterval(function(){
				if(num >= bannerSize){
					num = 0;
				}	
				buttonObjs.get(num).click();
				num ++ ;
			},3000)
		})();
	},
	//首页案例
	indexCaseAnimat: function(){
		$(window).scroll(function(){
				
		});
	},
	//首页banner位置视频效果
	indexMVAnimat: function(){
		var vd = document.getElementById("vd");
		$(".vd-cover").load(function(){
			var vd_h = $(".vd-cover").height();
//			$(".index-sec1").css("height",vd_h + "px");
			
			//TODO
				
		});
		
		$(".index-sec1 .word.word2").animate({"left":"300px","opacity":"1"},800).delay(150,function(){
			$(".index-sec1 .word.word3").animate({"left":"660px","opacity":"1"},400, function(){
				$(".index-sec1 .word.word1").addClass("on");	
			});
		});
		
		vd.oncanplay = function(){
			$(".vd-cover").fadeOut();
			vd.play();
		}
		$(window).resize(function(){
			var vd_h = $(vd).height();
//			$(".index-sec1").css("height",vd_h+"px");		
		});	
	},
	//首页第一块位置，替换原定视频特效
	indexSec1Animat: function(){
		//大背景图位置
		var minWinW = 1200, winH = 800, winW = $(window).width(), winScale = winW/winH, imgW = 1920, imgH = 950, imgScale = 1920/950,
		indexSec1Obj = $(".index-sec1");
		if(winW<minWinW){
			winW = minWinW;
			winScale = winW / winH;	
		}

		if(winScale > imgScale){
			indexSec1Obj.css("background-size","100% auto");
		}else{
			indexSec1Obj.css("background-size","auto 100%");
		}
		
		$(window).resize(function(){
			
			winW = $(window).width();	
			winScale = winW / winH;	
			if(winW<minWinW){
				winW = minWinW;
				winScale = winW / winH;	
			}
			if(winScale > imgScale){				
				indexSec1Obj.css("background-size","100% auto");
			}else{
				indexSec1Obj.css("background-size","auto 100%");
			}
		});
			
		//云彩特效
		var cloud001 = indexSec1Obj.find(".cloud001"), cloud002 = indexSec1Obj.find(".cloud002"), cloud003 = indexSec1Obj.find(".cloud003"), cloud004 = indexSec1Obj.find(".cloud004"),
		cloud005 = indexSec1Obj.find(".cloud005"),cloud006 = indexSec1Obj.find(".cloud006");
		
//		cloud001.animate({"left":"-500px"},12000);
		var left1 = cloud001.css("left");
		left1 = left1.replace("px","");
		var timeId1 = window.setInterval(function(){
			left1--;
			if(left1<-1500){
				left1 = 2500;
			} 
			cloud001.css({"left":left1+"px"});	
		}, 100);
		
		var left2 = cloud002.css("left");
		left2 = left1.replace("px","");
		var timeId2 = window.setInterval(function(){
			left2--;
			if(left2<-1500){
				left2 = 2500;
			} 
			cloud002.css({"left":left2+"px"});	
		}, 100);
		
		var left3 = cloud003.css("left");
		left3 = left3.replace("px","");
		var timeId3 = window.setInterval(function(){
			left3--;
			if(left3<-1500){
				left3 = 2500;
			} 
			cloud003.css({"left":left3+"px"});	
		}, 90);
		
		var left4 = cloud004.css("left");
		left4 = left4.replace("px","");
		var timeId4 = window.setInterval(function(){
			left4--;
			if(left4<-1500){
				left4 = 2500;
			} 
			cloud004.css({"left":left4+"px"});	
		}, 100);
		
		var left5 = cloud005.css("left");
		left5 = left5.replace("px","");
		var timeId5 = window.setInterval(function(){
			left5--;
			if(left5<-1500){
				left5 = 2500;
			} 
			cloud005.css({"left":left5+"px"});	
		}, 100);
		/*
		$(window).load(function(){
			indexSec1Obj.find(".plane").animate({"top":"375px","left":"255px","width":"55px"},6000, function(){
				$(this).animate({"top":"25px","left":"700px","width":"455px"},30000, function(){
				//	$(this).animate()	
				});	
			});
			$(".index-sec1-vediobox .box img").animate({"top":"0px","left":"0px","width":"1024px"}, 6000, function(){
				$(this).animate({"top":"-840px","left":"-680px"}, 30000);	
			});	
			$(".index-sec1 .word2").animate({"opacity":"1"},300, function(){
				$(".index-sec1 .word1").animate({"opacity":"1","left":"210px"},500);
				$(".index-sec1 .word3").animate({"opacity":"1","left":"560px"},500);	
			});
		});
		*/
	}
		
};
MFP.init = function(){
	Utils.asideMenuAnimatInit();
	Utils.returnTopAnimatInit();
	Utils.sidebarContactAnimat();	
	}
MFP.init_index = function(){
	//MFP.init();
	//CompFactory.indexMVAnimat();
	CompFactory.indexSec1Animat();
	//CompFactory.indexBannerAnimat();
	CompFactory.indexWinMoveAnimat();
	CompFactory.indexCaseAnimat();
	
//	Utils.menuMainAnimat();
	}
MFP.init_caselist = function(){	
	//MFP.init();
	}
MFP.init_caseshow = function(){
	//MFP.init();	
	CompFactory.caseShowAnimat(1);
}	
MFP.init_zhuanti = function(){
	Utils.returnTopAnimatInit();
	Utils.sidebarContactAnimat();	
}






