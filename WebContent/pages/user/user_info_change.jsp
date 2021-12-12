<%--
  Created by IntelliJ IDEA.
  User: 11382
  Date: 2021/12/9
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="../head.jsp">
        <jsp:param value="用户信息修改" name="title" />
    </jsp:include>
</head>
<body>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-info">用户信息修改</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="<%=request.getContextPath() %>/user_info_change.action">
                <div class="modal-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">电子邮箱</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="email" type="email" required aria-describedby="emailHelp" maxlength="253"/>
                            <small id="emailHelp" class="form-text text-muted">请输入你的邮箱地址</small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">电话号码</label>
                        <div class="col-sm-9">
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping">+86</span>
                                <input type="text" class="form-control" name="tel" placeholder="number" aria-label="number" aria-describedby="addon-wrapping" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">家庭住址</label>
                        <div class="col-sm-9">
                            <input type="text" name="address" class="form-control" required>
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
<%@ include file="../live2d.jsp"%>