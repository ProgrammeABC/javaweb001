<%@page pageEncoding="utf-8"%>
<!-- Modal -->
<div class="modal" id="loginModal" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-info">用户登录</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" action="<%=request.getContextPath() %>/login.action">
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">用户名</label>
						<div class="col-sm-10">
							<input class="form-control" name="un" type="text" required />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">密码</label>
						<div class="col-sm-10">
							<input class="form-control" name="pw" type="password" required />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">验证码</label>
						<div class="col-sm-4">
							<input type="text" name="checkingWord" class="form-control" required>
						</div>
						<div class="col-sm-5">
							<img src="${pageContext.request.contextPath}/verify/regist.do" onclick="myRefersh(this)">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary" href="<%=request.getContextPath() %>/pages/user/user_reset_password.jsp">确定</a>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-primary">确定</button>
				</div>
			</form>
		</div>
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