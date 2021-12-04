<%--
  Created by IntelliJ IDEA.
  User: 11382
  Date: 2021/12/3
  Time: 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8"%>
<!-- Modal -->
<div class="modal" id="registerModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-info">用户注册</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="<%=request.getContextPath() %>/login.action">
                <div class="modal-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">电子邮箱</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="pw2" type="email" required aria-describedby="emailHelp" maxlength="253"/>
                            <small id="emailHelp" class="form-text text-muted">请输入你的邮箱地址</small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">用户名</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="un001" name="un" type="text" required minlength="10" maxlength="20"/>
                            <small id="unHelp" class="form-text text-muted">请输入至少10位的用户名。</small>
                            <div id="out3" class="" role="alert"></div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">输入密码</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="pw" type="password" id="pw1" required maxlength="20"/>
                            <small id="pw1Help" class="form-text text-muted">请输入6~20位包含大小写字母、数字或特殊符号的密码</small>
                            <div id="out1" class="" ></div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">确认密码</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="pw2" type="password" id="pw2" required maxlength="20"/>
                            <small id="pw2Help" class="form-text text-muted">请输入确认密码。</small>
                            <div id="out2" class="" role="alert"></div>
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
                status_pw2 = true;
                $("#pw2Help").text("✅两次输入密码一致");
                $("#out2").attr("class","");
                $("#out2").text("");
            }
        }
        if(pw1==pw2){
            status_pw1 = true;
        }else{
            status_pw1 = false;
        }
        if (status_pw1&&status_pw){
            $("#submit1").attr("disabled", false);
        }else{
            $("#submit1").attr("disabled", true);
        }
    }
    var status_pw = true;
    var status_pw1 = true;
    $('#pw1').blur(function() {
        check_pw1(this);
    });
    function check_pw1(pw){
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,}).*", "g");
        if (false == enoughRegex.test($(pw).val())) {
            $('#out1').attr("class","alert alert-danger");
            status_pw = false;
            $('#out1').html('❌密码不足6位！');
            $('#pw1Help').html('');
        } else if (strongRegex.test($(pw).val())) {
            $('#pw1Help').html('✅密码强度高!');
            status_pw = true;
        } else if (mediumRegex.test($(pw).val())) {
            $('#pw1Help').html('⚠密码强度一般。');
            status_pw = true;
        } else {
            $('#pw1Help').html('⚠密码强度低！');
            status_pw = true;
        }
        if (status_pw1&&status_pw){
            $("#submit1").attr("disabled", false);
        }else{
            $("#submit1").attr("disabled", true);
        }
    }
    $("#pw1").focus(function (){
        $('#pw1Help').html("请输入20位以内包含大小写字母、数字、特殊符号的密码");
        $("#out1").text("");
        $("#out1").attr("class","")
    })
    $("#pw1").onclick(function (){
        if (status_pw1&&status_pw){
            $("#submit1").attr("disabled", false);
        }else{
            $("#submit1").attr("disabled", true);
        }
    });

</script>