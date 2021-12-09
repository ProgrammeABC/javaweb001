<%@ page pageEncoding="utf-8"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12 col-12">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
				<a class="navbar-brand"
					href="<%=request.getContextPath() %>/homepage.action"><span
					class="text-info">网上书店系统</span></a>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item <%="index".equals(request.getParameter("fun"))?"active":"" %>">
						<a class="nav-link"
						href="<%=request.getContextPath() %>/user/user_index.action">买书中</a>
					</li>
					<li class="nav-item <%="show".equals(request.getParameter("fun"))?"active":"" %>">
						<a class="nav-link"
						href="<%=request.getContextPath() %>/user/user_show_dc.action">我的选择</a>
					</li>
				</ul>
				<ul class="nav justify-content-end">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
							<%=session.getAttribute("loginName") %> vip:<%=session.getAttribute("vip_level")%></a>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="<%=request.getContextPath() %>/user_info_change.action">修改个人资料</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item"
								href="<%=request.getContextPath() %>/logout.action">退出登录</a>
						</div></li>
				</ul>
			</nav>
		</div>
	</div>
</div>