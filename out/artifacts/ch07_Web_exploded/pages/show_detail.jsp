<%@ page pageEncoding="utf-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp">
	<jsp:param value="详细信息" name="title" />
</jsp:include>
<style>
table.table tr th {
	vertical-align: middle;
	text-align: center;
	width: 30%
}
</style>
</head>
<body>
	<p></p>
	<%
		Map<String, String> food = (Map<String, String>) request.getAttribute("food");
		if (food != null) {
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-0"></div>
			<div class="col-md-6 col-12">
				<table class="table table-hover table-bordered">
					<tbody>
						<tr class="table-primary">
							<th scope="col">书籍名称</th>
							<td><%=food.get("foodname")%></td>
						</tr>
						<tr class="table-secondary">
							<th scope="row">特  点</th>
							<td><%=food.get("feature")%></td>
						</tr>
						<tr class="table-success">
							<th scope="row">简  介</th>
							<td><%=food.get("material")%></td>
						</tr>
						<tr class="table-danger">
							<th scope="row">类  别</th>
							<td><%=food.get("typename")%></td>
						</tr>
						<tr class="table-warning">
							<th scope="row">价  格</th>
							<td><%=food.get("price")%>元</td>
						</tr>
						<tr class="table-info">
							<th scope="row">图 片</th>
							<td><img class="img-rounded" alt="Bootstrap Image Preview"
								src="<%=food.get("picture")%>" /></td>
						</tr>
						<tr class="table-danger">
							<th scope="row">阅读数量</th>
							<td><%=food.get("hits")%>次</td>
						</tr>
						<tr class="table-success">
							<th scope="row">备 注</th>
							<td>
								<%
									if (food.get("comment").equals("0")) {
											out.println("店长推荐");
										} else if (food.get("comment").equals("-1")) {
											out.println("&nbsp;");
										} else {
											out.println("特价" + food.get("comment") + "元");
										}
								%>
							</td>
						</tr>
					</tbody>
				</table>
				<form method="post"
					action="<%=request.getContextPath() %>/user/user_add_dc.action">
					<input type="hidden" name="ids" value="${food.id }">
					<div class="form-group">
						<button type="submit" class="btn btn-danger btn-block">将
							书 籍 添 加 到 购 物 车</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>