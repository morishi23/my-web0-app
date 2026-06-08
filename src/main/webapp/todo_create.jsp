<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ToDo新規登録</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Custom Style -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <!-- プレミアムヘッダー -->
        <header class="app-header d-flex justify-content-between align-items-center flex-wrap gap-3">
            <div>
                <h1><i class="bi bi-plus-circle me-2"></i>新規タスク登録</h1>
                <p class="mb-0 text-white-50">新しいToDoタスクを追加します</p>
            </div>
            <div>
                <a href="TodoList" class="btn btn-premium-secondary bg-white text-dark border-0 shadow-sm">
                    <i class="bi bi-arrow-left me-2"></i>一覧に戻る
                </a>
            </div>
        </header>

        <div class="row justify-content-center">
            <div class="col-lg-8">
                <!-- 登録フォームカード -->
                <div class="card card-premium">
                    <div class="card-body p-4 p-md-5">
                        <form id="create-todo-form" method="post" action="TodoCreate" novalidate>
                            
                            <!-- タイトル -->
                            <div class="mb-4">
                                <label for="title" class="form-label fw-bold text-secondary">
                                    タイトル <span class="badge bg-danger ms-1">必須</span>
                                </label>
                                <input type="text" name="title" class="form-control form-control-premium" 
                                       placeholder="タスクのタイトルを入力してください" required maxlength="100">
                                <div class="invalid-feedback">
                                    タイトルは必須です（100文字以内）。
                                </div>
                            </div>

                            <!-- 詳細 -->
                            <div class="mb-4">
                                <label for="detail" class="form-label fw-bold text-secondary">詳細</label>
                                <textarea name="detail" class="form-control form-control-premium" rows="5" 
                                          placeholder="タスクの詳細な説明やメモを入力してください"></textarea>
                            </div>

                            <div class="row g-4 mb-5">
                                <!-- ステータス -->
                                <div class="col-md-6">
                                    <label for="status" class="form-label fw-bold text-secondary">ステータス</label>
                                    <select name="status" class="form-select form-select-premium">
                                        <option value="未着手" selected>未着手</option>
                                        <option value="進行中">進行中</option>
                                        <option value="完了">完了</option>
                                    </select>
                                </div>

                                <!-- 期限日 -->
                                <div class="col-md-6">
                                    <label for="due-date" class="form-label fw-bold text-secondary">期限日</label>
                                    <input type="date" name="due_date" class="form-control form-control-premium">
                                </div>
                            </div>

                            <!-- ボタン類 -->
                            <div class="d-flex justify-content-end gap-3 flex-wrap">
                                <a href="TodoList" class="btn btn-premium-secondary px-4 py-2">
                                    キャンセル
                                </a>
                                <button type="submit" id="btn-submit" class="btn btn-premium px-5 py-2">
                                    <i class="bi bi-check-lg me-2"></i>登録する
                                </button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 Bundle with Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

   
</body>
</html>

