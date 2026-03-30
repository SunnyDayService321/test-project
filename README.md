# Laravel Todo App

PHP / Laravel で構築したシンプルなTodoアプリです。
Docker環境で動作し、Laravel Breezeによる認証機能を備えています。

## 🛠 技術スタック

- **言語**: PHP 8.2
- **フレームワーク**: Laravel 11.9
- **認証**: Laravel Breeze（日本語対応）
- **データベース**: MySQL
- **フロントエンド**: Blade、Tailwind CSS、Vite
- **インフラ**: Docker、Docker Compose
- **テスト**: PHPUnit 11

## 📁 ディレクトリ構成

\```
laravel-todo-app/
├── app/          # モデル・コントローラー・ミドルウェア
├── bootstrap/    # アプリケーション起動設定
├── config/       # 各種設定ファイル
├── database/     # マイグレーション・シーダー
├── lang/         # 言語ファイル（日本語対応）
├── public/       # 公開ディレクトリ
├── resources/    # Bladeテンプレート・CSS・JS
├── routes/       # ルーティング定義
├── storage/      # ログ・キャッシュ・アップロードファイル
├── tests/        # テストコード
├── Dockerfile
├── docker-compose.yml
└── README.md
\```

## 🚀 セットアップ手順（Docker）

### 1. リポジトリをクローン

\```bash
git clone https://github.com/SunnyDayService321/laravel-todo-app.git
cd laravel-todo-app
\```

### 2. 環境変数ファイルを作成

\```bash
cp .env.example .env
\```

### 3. Dockerコンテナを起動

\```bash
docker-compose up -d --build
\```

### 4. コンテナ内で初期セットアップ

\```bash
docker-compose exec app bash

# アプリケーションキーを生成
php artisan key:generate

# マイグレーションを実行
php artisan migrate

# （必要に応じて）シーダーを実行
php artisan db:seed
\```

ブラウザで http://localhost にアクセスしてください。

## 🧪 テストの実行

\```bash
php artisan test
\```

## 📋 主な機能

- ユーザー登録・ログイン（Laravel Breeze）
- Todoの一覧表示
- Todoの追加
- Todoの編集
- Todoの削除
