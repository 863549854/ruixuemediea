!function () {
  var j = document.createElement("ins");
  j.id = "newBridge";
  if (document.getElementById(j.id)) {
    return
  }
  var b = [{
    "inviteBox": {
      "customerStylePro": {
        "isShowCloseBtn": 1,
        "inviteLeft": "0",
        "isShowConsultBtn": 1,
        "laterBtnStyle": {
          "x": "10%",
          "width": "16%",
          "y": "0%",
          "height": "11%"
        },
        "inviteTop": "750",
        "consultBtnStyle": {
          "x": "28%",
          "width": "16%",
          "y": "0%",
          "height": "11%"
        },
        "isInviteFixed": 0,
        "isShowLaterBtn": 1,
        "closeBtnStyle": {"x": "0%", "width": "8%", "y": "0%", "height": "11%"}
      },
      "skinIndex": 0,
      "startPage": 1,
      "customerStyle": {
        "acceptFontColor": "#140808",
        "backImg": "//sgoutong.baidu.com/static/style/images/b6fbedcb10ac45368c5bb977b927c4c3.jpg",
        "acceptBgColor": "#fecb2e"
      },
      "skinName": "自定义皮肤",
      "cpyInfo": "",
      "autoHide": 0,
      "reInvite": 1,
      "sendButton": {"bgColor": "#bfecff", "fontColor": "#1980df"},
      "isShowText": 1,
      "skinType": 1,
      "buttonType": 1,
      "inviteTypeData": {
        "0": {"width": 400, "height": 175},
        "1": {"width": 329, "height": 163},
        "2": {"width": 400, "height": 282},
        "3": {"width": 400, "height": 282}
      },
      "autoInvite": 1,
      "stayTime": 30,
      "width": 329,
      "closeTime": 20,
      "isCustomerStyle": 1,
      "position": "left-bottom",
      "inviteInterval": 30,
      "welcome": "<p>以绝对严谨负责的工匠精神服务每一位客户</p><p><br/></p>",
      "height": 163
    },
    "webimConfig": {
      "skinIndex": 1,
      "skinType": 1,
      "customerColor": "#2752e7",
      "themeType": 0
    },
    "noteBoard": {
      "skinIndex": 5,
      "skinType": 1,
      "displayCompany": 1,
      "cpyInfo": "瑞雪映画影视传媒有限公司",
      "skinName": "侧耳倾听",
      "displayLxb": 1,
      "position": "left-bottom",
      "itemsExt": [],
      "items": [{"name": "visitorName", "required": 0, "isShow": 1},
        {"name": "visitorPhone", "required": 1, "isShow": 1},
        {"name": "visitorEmail", "required": 0, "isShow": 0},
        {"name": "visitorAddress", "required": 0, "isShow": 0}],
      "cpyTel": "18500140047",
      "needVerifyCode": 0,
      "isAlwaysDisplay": 0
    },
    "isWebim": 1,
    "pageId": 0,
    "seekIcon": {
      "customerStyle": {"backImg": "//sgoutong.baidu.com/static/style/images/c1e966b70ceb48c892185635cc0b79c3.jpg"},
      "skinIndex": 0,
      "skinName": "自定义皮肤",
      "groups": [{"groupName": "报价咨询", "groupId": 520809, "isSelected": false},
        {"groupName": "方案咨询", "groupId": 520810, "isSelected": false}],
      "displayLxb": 1,
      "cpyInfo": "",
      "marginLeft": "0",
      "skinType": 1,
      "isFixedPosition": 0,
      "iconType": 1,
      "isCustomerStyle": 1,
      "width": 148,
      "groupStyle": {
        "bgColor": "#ffffff",
        "buttonColor": "#d6f3ff",
        "fontColor": "#008edf"
      },
      "position": "left-center",
      "marginTop": "310",
      "height": 160
    }
  }], l = {
    "eid": "6365235",
    "queuing": "<p><span style=\"font-family: 微软雅黑;\"><strong><span style=\"font-size: 12pt;\">欢迎光临！您已经进入服务队列，请您稍候，马上为您转接您的在线咨询顾问。</span></strong></span><span style=\"font-family: 微软雅黑;\"></span></p>",
    "isCsOnline": 0,
    "session": {
      "displayName": "_**y",
      "headUrl": "https://ss0.bdstatic.com/7Ls0a8Sm1A5BphGlnYG/sys/portraitn/item/5aab5f5f5f5f5f5f416c65786461791462.jpg",
      "status": 0,
      "uid": 0,
      "uname": ""
    },
    "authToken": "bridge",
    "isWebim": 1,
    "userId": "6365235",
    "platform": 0,
    "isGray": "false",
    "wsUrl": "wss://p.qiao.baidu.com/cps2/websocket",
    "route": "1",
    "webimConfig": {
      "skinIndex": 1,
      "skinType": 1,
      "customerColor": "#2752e7",
      "themeType": 0
    },
    "isOpenRobot": 0,
    "likeVersion": "",
    "siteId": "12919941",
    "online": "false",
    "authType": 4,
    "bid": "1645521754012919941",
    "webRoot": "//p.qiao.baidu.com/cps2/",
    "prologue": "<p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><strong><span style=\"font-size: 12pt;\"></span></strong><strong style=\"font-family: 微软雅黑; white-space: normal;\"><span style=\"font-size: 12pt;\">您好！瑞雪映画服务消费者8年！视频制作老品牌！<br/></span></strong><br/></p><p style=\"white-space: normal;\"><strong><span style=\"font-size: 12pt;\"></span></strong><br/></p><p><br/></p>",
    "timestamp": 1563610375392
  }, m = [];

  function h() {
    var p = window.location.href, o = 0, n = null;
    if (m) {
      for (var i = 0, g = m.length; i < g; i++) {
        if (m[i].url === p) {
          o = m[i].pageId;
          break
        }
      }
      if (o === 0) {
        for (var i = 0, g = m.length; i < g; i++) {
          if (-1 < p.indexOf(m[i].url)) {
            o = m[i].pageId;
            break
          }
        }
      }
    }
    l.pageId = o;
    i = 0;
    for (g = b.length; i < g; i++) {
      if (b[i].pageId === o) {
        f = b[i].webimConfig;
        l.webimConfig = {skinIndex: f.skinIndex, skinType: f.skinType};
        return b[i]
      }
      0 === b[i].pageId && (n = b[i])
    }
    return n
  }

  j.config = h(), j.siteConfig = l, j.startTime = +new Date;
  j.deferOnce = {
    on: function (e) {
      this.done ? e() : this.callback = e
    }, emit: function () {
      this.callback ? this.callback() : (this.done = true)
    }
  };
  var k = document.getElementsByTagName("script")[0];
  k.parentNode.insertBefore(j, k);

  function c() {
    if (document.body) {
      document.body.insertBefore(j, document.body.firstElement || null);
      j.deferOnce.emit()
    } else {
      setTimeout(c, 0)
    }
  }

  c();
  var d = document.createElement("script");
  d.src = "./category/pc_nb1.js", d.setAttribute(
      "charset", "UTF-8");
  var a = document.getElementsByTagName("head")[0] || document.body;
  a.insertBefore(d, a.firstElement || null)
}(this);