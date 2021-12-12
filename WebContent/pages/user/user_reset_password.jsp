<%--
  Created by IntelliJ IDEA.
  User: 11382
  Date: 2021/12/11
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../head.jsp">
        <jsp:param value="密码重置页" name="title" />
    </jsp:include>
</head>
<body>

    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-info">密码重置</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="<%=request.getContextPath() %>/sendmail.action">
                <div class="modal-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">用户名</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="un001" name="un" type="text" required maxlength="20"/>
                            <small id="unHelp" class="form-text text-muted">请输入您的用户名。</small>
                            <div id="out3" class="" role="alert"></div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">验证码</label>
                        <div class="col-sm-4">
                            <input type="text" name="checkingWord" class="form-control" required>
                        </div>
                        <div class="col-sm-5">
                            <img src="${pageContext.request.contextPath}/verify/regist.do" onclick="myRefersh(this)">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" id="submit1">确定</button>
                </div>
            </form>
        </div>
    </div>
<script>
    $("#un001").blur(function() {
        if($("#un001").val().length>=10){
            $("#unHelp").text("✅用户名合规！");
        }else{
            $("#unHelp").text("");
            $("#out3").attr("class","alert alert-danger");
            $("#out3").text("❌用户名不合规！");
        }
    })
    $("#un001").focus(function() {
        $("#out3").attr("class","");
        $("#out3").text("");
        $("#unHelp").text("请输入至少10位的用户名。");
    })
    $("#pw2").blur(function (){
        check_pw2();
    })
    $("#pw2").focus(function (){
        $("#pw2Help").text("");
        $("#pw2").val("");
        $("#out2").attr("class","");
        $("#out2").text("");
    })
    function check_pw2(){
        let pw1 = $("#pw1").val();
        let pw2 = $("#pw2").val();
        if(pw2==""){
            $("#out2").attr("class","alert alert-danger");
            $("#out2").text("❌确认密码不得为空！");
        }else{
            if(pw1!=pw2){
                $("#out2").attr("class","alert alert-danger");
                $("#out2").text("❌两次输入的密码不一致！");
            }else{
                $("#pw2Help").text("✅两次输入密码一致");
                $("#out2").attr("class","");
                $("#out2").text("");
            }
        }
    }
    $('#pw1').blur(function() {
        check_pw1(this);
    });
    function check_pw1(pw){
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,}).*", "g");
        if (false == enoughRegex.test($(pw).val())) {
            $('#out1').attr("class","alert alert-danger");
            $('#out1').html('❌密码不足6位！');
            $('#pw1Help').html('');
        } else if (strongRegex.test($(pw).val())) {
            $('#pw1Help').html('✅密码强度高!');
        } else if (mediumRegex.test($(pw).val())) {
            $('#pw1Help').html('⚠密码强度一般。');
        } else {
            $('#pw1Help').html('⚠密码强度低！');
        }
    }
    $("#pw1").focus(function (){
        $('#pw1Help').html("请输入20位以内包含大小写字母、数字、特殊符号的密码");
        $("#out1").text("");
        $("#out1").attr("class","")
    })
    function myRefersh( e ) {
        const source = e.src ; // 获得原来的 src 中的内容
        //console.log( "source : " + source  ) ;
        var index = source.indexOf( "?" ) ;  // 从 source 中寻找 ? 第一次出现的位置 (如果不存在则返回 -1 )
        //console.log( "index : " + index  ) ;
        if( index > -1 ) { // 如果找到了 ?  就进入内部
            var s = source.substring( 0 , index ) ; // 从 source 中截取 index 之前的内容 ( index 以及 index 之后的内容都被舍弃 )
            //console.log( "s : " + s  ) ;
            var date = new Date(); // 创建一个 Date 对象的 一个 实例
            var time = date.getTime() ; // 从 新创建的 Date 对象的实例中获得该时间对应毫秒值
            e.src = s + "?time=" + time ; // 将 加了 尾巴 的 地址 重新放入到 src 上
            //console.log( e.src ) ;
        } else {
            var date = new Date();
            e.src = source + "?time=" + date.getTime();
        }
    }
</script>
</body>
</html>
