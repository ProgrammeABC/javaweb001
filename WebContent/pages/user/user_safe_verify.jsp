<%--
  Created by IntelliJ IDEA.
  User: 11382
  Date: 2021/12/12
  Time: 0:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../head.jsp">
        <jsp:param value="安全验证页" name="title" />
    </jsp:include>
</head>
<body>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-info">用户安全码验证</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="<%=request.getContextPath() %>/register.action">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">安全码</label>
                        <div class="col-sm-4">
                            <input type="text" name="safeWord" class="form-control" required>
                        </div>
                        <div class="col-sm-5">
                            <button type="submit" class="btn btn-primary" id="submit1">确定</button>
                        </div>
                    </div>
            </form>
        </div>
    </div>
</body>
</html>
