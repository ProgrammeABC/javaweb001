<%--
  Created by IntelliJ IDEA.
  User: 11382
  Date: 2021/12/9
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <jsp:include page="../head.jsp">--%>
<%--        <jsp:param value="聊天界面" name="title" />--%>
<%--    </jsp:include>--%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/tanchaung/chat.css">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
</head>
<body>
<div class="chat-wrapper">
    <div id="btn_open" class="chat-support-btn" draggable="true"><!-- 聊天窗口缩小后的头像图标 -->
        <img src='http://img.bq233.com/kanqq/pic/upload/2018/0807/1533622731879926.jpg' height="50px" width="50px"></img>
    </div>
    <div class="chat-main" draggable="true">
        <div class='chat-simulator'>
            <p id="chat_hint" class="chat-hint"><span class="chat-hint-icon">!</span><span class="chat-hint-text" style='color:black'>发送内容不能为空</span></p>
            <textarea class='simulator-text' autofocus placeholder='请写下你希望我对你说的话,按enter键提交（shift+enter键换行）。'></textarea>
            <div class='simulator-btn'>
                <button class='simulator-submmit'>提交</button>
                <button class='simulator-close'>关闭</button>
            </div>
        </div>
        <div class="chat-header">
            <i id="btn_close" class="chat-close">关闭</i>
            <div class="chat-service-info">
                <a class="chat-service-img"></a>
                <div class="chat-service-title">
                    <p class="chat-service-name">客服1</p>
                    <p class="chat-service-detail">我是您的专属客服</p>
                </div>
            </div>
        </div>
        <div id="chat_contain" class="chat-contain">
            <!-- <p class="chat-service-contain">
            				<span class="chat-text chat-service-text">您好</span>
            			</p> -->
        </div>
        <div class="chat-submit">
            <p id='chatHint' class="chat-hint"><span class="chat-hint-icon">!</span><span class="chat-hint-text">发送内容不能为空</span></p>
            <textarea id="chat_input" class="chat-input-text" autofocus placeholder="请输入您想对我说的话，按Enter键发送（shift+Enter换行）。"></textarea>
            <div class="chat-input-tools">
                <button class="chat-input-button">发送</button>
                <button class="chat-service-simulator">模拟</button>
                <button class="chat-close-button">关闭</button>
            </div>
        </div>
        <div class="header-info-div">
            <h2 class="header-info-h2">客服1</h2>
            <span class="header-info-span">我是您的专属客服</span>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath() %>/jquery/3.4.1/jquery-3.4.1.min.js"></script>
<script>
    var d = document;
    /*显示对话窗口*/
    function openBody(){
        $('.chat-support-btn').css({'display': 'none'});
        $('.chat-main').css({'display': 'inline-block', 'height': '0'});
        $('.chat-main').animate({'height': '600px'})
    }
    openBody();
    // 模拟一些后端传输数据
    var serviceData = {
        'robot': {
            'chat': ['Google一下吗？www.google.com','这个网站您看一下www.baidu.com', '稍等哦~','嘿嘿','百度一下？www.baidu.com','嗯嗯嗯'],
        }
    };

    var chatMain=$('.chat-main'),
        chatHint = $('#chatHint'),
        chat_Hint = $('#chat_hint'),
        headerInfoDiv=$('.header-info-div');
    chat_main=d.querySelector('.chat-main');
    chatInput = d.querySelector('#chat_input'),
        chatContain = d.querySelector('#chat_contain'),
        btnOpen = d.querySelector('#btn_open'),
        btnClose =d.querySelector('#btn_close');


    /*拖动*/

    document.ondragover=function(e){
        console.log("Firefox上此处不会执行，Chrome正常");
        e.preventDefault();
    };
    function chatDrag(target){
        target.ondragstart=function(e)
        {
            e=e||window.event;
            e.dataTransfer.clearData();
            offsetX= e.offsetX;
            offsetY= e.offsetY;
            /*e.dataTransfer.setData("offsetX",String(offsetX));
            e.dataTransfer.setData("offsetY",String(offsetY));
            console.log(offsetX+' ..'+offsetY);
            console.log(e.dataTransfer.getData("offsetX")+'..'+e.dataTransfer.getData("offsetY"));*/
        }
        target.ondrag=function(e)
        {
            e=e||window.event;
            var x= e.pageX;
            var y= e.pageY;
            if(x==0 && y==0){
                return; //不处理拖动最后一刻X和Y都为0的情形
            }
            x-=offsetX;
            y-=offsetY;
            /*x-=Number(e.dataTransfer.getData("offsetX"));
            y-=Number(e.dataTransfer.getData("offsetY"));*/
            target.style.left=x+'px';
            target.style.top=y+'px';
        }
    }
    chatDrag(chat_main);//拖动聊天窗口
    chatDrag(btnOpen);//拖动头像小图标


    /*头像信息*/

    /*鼠标在头像上*/
    $('.chat-service-img').mouseenter(
        function(){
            headerInfoDiv.fadeIn(1000);
        }
    )
    $('.chat-service-img').mouseleave(
        function(){
            headerInfoDiv.fadeOut();
        }
    )
    /*关闭对话框*/
    function closeChat(){
        $('.chat-main').animate({'height': '0'});
        $('.chat-main').css({'display': 'none'});
        $('.chat-support-btn').css({'display': 'inline-block'});
    }

    btnOpen.addEventListener('click', function(e) {/*点击头像打开聊天窗口*/
        e = e||window.event;
        openBody();
    })

    btnClose.addEventListener('click',closeChat)

    /*创建新消息框*/
    function createInfo(name,value)
    {
        var chatTime=new Date();
        chatTime=chatTime.toLocaleTimeString();
        var nodeP = d.createElement('p'),
            nodeSpan = d.createElement('span')
        nodeTime=d.createElement('p');
        value=value.replace(/(((ht|f)tps?):\/\/)?([A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*)/g,function(content){
            return "<a href='http://"+content+"' class='chat-address' target='view_window' style='color:#6666cc '>"+content+'</a>';;
        });
        nodeP.classList.add('chat-'+name+'-contain');
        nodeSpan.classList.add('chat-'+name+'-text','chat-text');
        nodeTime.classList.add('chat-time');
        nodeSpan.innerHTML =value;
        nodeTime.innerHTML=chatTime;
        nodeP.appendChild(nodeTime);
        nodeP.appendChild(nodeSpan);
        chatContain.appendChild(nodeP);
        chatContain.scrollTop = chatContain.scrollHeight;
    }
    createInfo('service','您好'); /*发送第一句话*/
    var timer,
        timerId,
        flagInput=false;
    shiftDown = false;  // 判断是否按住shift键

    function chatHintNull(chatHint){//空输入提示
        setTimeout(function(){
            chatHint.fadeIn();
            clearTimeout(timerId);
            timer = setTimeout(function() {
                chatHint.fadeOut();
            }, 1000);
        }, 10);
        timerId = timer;
    };
    /*监控是否按下enter*/
    function isEnter(Input,Hint,type,e){
        e = e||window.event;
        if (e.keyCode == 16) {//按住shift键
            shiftDown = true;
        }
        if(e.keyCode==13)
        {

            if(shiftDown==true)
            {
                shiftDown=false;
                return true;
            }
            else if(shiftDown==false&&Input.value == '')
            {
                Hint();
                return true;
            }
            else
            {
                e.preventDefault();
                createInfo(type,Input.value);
                submityouText(Input.value);
                Input.value = null;
                Input.focus();

            }
        }
    }

    chatInput.addEventListener('keydown', function(e) {/*输入框按enter*/
        e = e||window.event;
        isEnter(chatInput,chatHintNull,'you',e);
    })

    /*为按钮绑定事件*/
    $('.chat-input-button').click(function(){/*消息框发送*/

        if(chatInput.value!='')
        {
            createInfo('you',chatInput.value);
            submityouText(chatInput.value);
            chatInput.value = null;
            chatInput.focus();

        }
        else
        {
            chatHintNull(chatHint);
        }
    });
    /*模拟后台消息*/
    var chatSim=$('.chat-simulator'),
        sim_Text=d.querySelector('.simulator-text');
    simText=$('.simulator-text');
    $('.chat-service-simulator').click(
        function(){
            chatSim.fadeIn(500);
            simText.focus();
        }
    );
    $('.simulator-submmit').click(function(){
        if(simText.val()=='')
        {
            chatHintNull(chat_Hint);
        }
        else{
            createInfo('service',simText.val());
            simText.val('');
            simText.focus();
        }
    });
    /*模拟的输入框enter键判断*/
    sim_Text.addEventListener('keydown', function(e) {
        e = e||window.event;
        isEnter(sim_Text,chatHintNull,'service',e);
    })
    $('.simulator-close').click(function()
    {
        chatSim.fadeOut();
        simText.val('');
        simText.focus();
    });

    /*关闭按钮*/
    $('.chat-close-button').click(
        function()
        {
            if (confirm("不再聊会儿吗？")){
                window.close();
            }
            else{}
        }
    );
    /*按钮特效*/
    var buttons=$('button');
    buttons.each(function(i)
        {
            $(this).mouseenter(function(){
                buttons.eq(i).fadeTo('slow',0.8);
            });
        }
    )
    buttons.each(function(i)
        {
            $(this).mouseleave(function(){
                buttons.eq(i).fadeTo('slow',1);
            });
        }
    )

    function submityouText(text) {

        // 模拟后端回复
        var num = Math.random() * 10;
        if (num <= 7) {
            getServiceText(serviceData);
        }
    }

    function getServiceText(data) {/*已定义后台消息框*/
        var serviceText = data.robot.chat,
            i = Math.floor(Math.random() * serviceText.length);
        createInfo('service',serviceText[i]);
    }

</script>
</body>
</html>
