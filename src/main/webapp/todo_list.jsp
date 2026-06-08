	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>
	<!DOCTYPE html>
	<html lang="ja">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ToDoリスト一覧</title>
	<!-- Bootstrap 5 CSS -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<!-- Bootstrap Icons -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
		rel="stylesheet">
	<!-- Custom Style -->
	<link href="css/style.css" rel="stylesheet">
	</head>
	<body>
		<div class="container">
			<!-- プレミアムヘッダー -->
			<header
				class="app-header d-flex justify-content-between align-items-center flex-wrap gap-3">
				<div>
					<h1>
						<i class="bi bi-check2-square me-2"></i>ToDoリスト
					</h1>
					<p class="mb-0 text-white-50">タスクの進捗をスマートに管理</p>
				</div>
				<div>
					<a href="TodoCreate" id="btn-create-new"
						class="btn btn-premium btn-lg"> <i class="bi bi-plus-lg me-2"></i>新規追加
					</a>
				</div>
			</header>
	
			<div class="card border-0 shadow-sm rounded-4 mb-4">
			<div class="card-body p-4">
				<form method="get" action="TodoList">
					<div class="row g-3 align-items-end">
						<div class="col-md-5">
							<label for="keyword" class="form-label fw-semibold">キーワード</label>
							<input type="text" id="keyword" name="keyword"
								class="form-control rounded-3 py-2" placeholder="タイトル・詳細で検索" value="<c:out value="${ param['keyword'] }" />">
						</div>
						<div class="col-md-4">
							<label for="status" class="form-label fw-semibold">ステータス</label>
							<select id="status" name="status"
								class="form-select rounded-3 py-2">
								<option value="">すべて</option>
								<option value="未着手">未着手</option>
								<option value="進行中">進行中</option>
								<option value="完了">完了</option>
							</select>
						</div>
						<div class="col-md-3">
							<button type="submit"
								class="btn btn-primary w-100 py-2 rounded-3 fw-semibold">検索</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	
				<!-- ToDoテーブル一覧 -->
				<div class="col-12">
					<div class="card card-premium">
						<div class="card-body p-4">
							<div
								class="d-flex justify-content-between align-items-center mb-3">
								<h5 class="card-title mb-0 fw-bold">
									<i class="bi bi-list-task me-2"></i>タスク一覧
								</h5>
								<span id="task-count" class="badge bg-secondary rounded-pill">0
									件</span>
							</div>
	
							<div class="table-responsive">
								<table class="table table-premium text-nowrap w-100"
									id="todo-table">
									<thead>
										<tr>
											<th scope="col" style="width: 8%">#</th>
											<th scope="col" style="width: 45%">タイトル</th>
											<th scope="col" style="width: 15%">ステータス</th>
											<th scope="col" style="width: 17%">期限日</th>
											<th scope="col" style="width: 15%" class="text-center">操作</th>
										</tr>
									</thead>
									<tbody id="todo-list-body">
										<c:forEach var="todo" items="${todos}">
											<tr>
												<td>${todo.todo_id}</td>
												<td>${todo.title}</td>
												<td>${todo.status}</td>
												<td>${todo.due_date}</td>
	
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
	
							<!-- データ空の時のプレースホルダー -->
							<div id="no-data-alert" class="text-center py-5 d-none">
								<i class="bi bi-inbox text-muted display-4"></i>
								<p class="mt-3 text-muted">該当するToDoタスクが見つかりません</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- 詳細表示用モーダル -->
		<div class="modal fade" id="todoDetailModal" tabindex="-1"
			aria-labelledby="todoDetailModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content card-premium" style="background: white;">
					<div class="modal-header border-0 pb-0">
						<h5 class="modal-title fw-bold" id="todoDetailModalLabel">タスク詳細</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body pt-3">
						<div class="mb-3">
							<label class="text-muted small d-block">タイトル</label>
							<h4 id="modal-title" class="fw-bold text-dark mt-1"></h4>
						</div>
						<div class="mb-3">
							<label class="text-muted small d-block">ステータス</label>
							<div class="mt-1">
								<span id="modal-status" class="badge badge-status"></span>
							</div>
						</div>
						<div class="mb-3">
							<label class="text-muted small d-block">期限日</label>
							<p id="modal-duedate" class="mt-1 fw-medium"></p>
						</div>
						<div class="mb-3">
							<label class="text-muted small d-block">詳細内容</label>
							<div class="p-3 bg-light rounded mt-1"
								style="white-space: pre-wrap;" id="modal-detail"></div>
						</div>
					</div>
					<div class="modal-footer border-0">
						<button type="button" class="btn btn-premium-secondary"
							data-bs-dismiss="modal">閉じる</button>
						<button type="button" id="modal-btn-delete"
							class="btn btn-danger rounded-3"
							style="border-radius: 12px; padding: 0.6rem 1.5rem;">
							<i class="bi bi-trash me-2"></i>削除する
						</button>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Bootstrap 5 Bundle with Popper JS -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	
	
	</body>
	</html>
