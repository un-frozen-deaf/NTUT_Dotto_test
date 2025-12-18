# test_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Flutter Web を ngrok で一時公開する備忘録

## 目的

ローカルで開発した **Flutter Web（ビルド済み）** を、
**ngrok を使って一時的に外部公開し、他人にブラウザで見せる**。

---

## 全体像

```
Flutter Web (build/web)
   ↓
python http.server (localhost)
   ↓
ngrok
   ↓
外部URL（他人のブラウザ）
```

---

## 1. 前提環境

* macOS
* Flutter SDK インストール済み（`flutter doctor` が通る）
* Flutter Web がビルドできる状態
* Python3
* ngrok（認証トークン設定済み）

---

## 2. Flutter Web をビルド

### ※ GitHub Pages 用の `--base-href` を **付けない**ことが重要

```bash
flutter clean
flutter build web
```

生成物は以下に出力される：

```
build/web/
```

---

## 3. build/web の中身確認（重要）

以下が存在することを確認する：

```
build/web/
├─ index.html
├─ flutter_bootstrap.js
├─ main.dart.js
├─ assets/
│  └─ （JSONなどのアセット）
```

### 注意

* `flutter_bootstrap.js` が無い → base-href 設定ミスの可能性大
* assets が無い → pubspec.yaml の設定漏れ

---

## 4. assets（JSONなど）の設定

### pubspec.yaml

```yaml
flutter:
  assets:
    - assets/
```

設定変更後は必ず再ビルド：

```bash
flutter clean
flutter build web
```

---

## 5. ローカルWebサーバー起動

### 必ず build/web で実行する

```bash
cd build/web
python3 -m http.server 8080
```

起動ログ例：

```
Serving HTTP on 0.0.0.0 port 8080 ...
```

### ローカル確認

```
http://localhost:8080
```

→ Flutter Web が表示されること

---

## 6. ngrok で外部公開

### 別ターミナルで実行（IPv4指定推奨）

```bash
ngrok http http://127.0.0.1:8080
```

出力例：

```
Forwarding https://xxxx.ngrok-free.dev -> http://127.0.0.1:8080
```

この **https URL** を共有すればOK。

---

## 7. よく出たエラーと対処

### ① `command not found: flutter`

* Flutter SDK が PATH に入っていない
* `~/.zshrc` に `flutter/bin` を追加

---

### ② `dial tcp [::1]:8080: connect: connection refused`

原因：

* http.server が起動していない
* ポート番号不一致
* IPv6 (::1) 問題

対処：

```bash
ngrok http http://127.0.0.1:8080
```

---

### ③ assets の JSON が 404

例：

```
/assets/room_data.json 404
```

原因：

* pubspec.yaml に assets 未記述
* 再ビルドしていない
* build/web 以外でサーバー起動

---

### ④ flutter_bootstrap.js が 404

```
GET /flutter_bootstrap.js 404
```

原因：

* `--base-href` を指定してビルドしている
* index.html の `<base href>` が `/` 以外

対処：

```bash
flutter clean
flutter build web
```

index.html：

```html
<base href="/">
```

---

## 8. 終了方法

* http.server： `Ctrl + C`
* ngrok： `Ctrl + C`

※ 両方止めること

---

## 9. ngrok 使用時の注意

* PCを **スリープさせない**
* 電源接続推奨
* Wi-Fiが切れると即終了
* Freeプランでは URL は毎回変わる

---

## 10. 使い分けの指針

| 目的      | 方法                        |
| ------- | ------------------------- |
| 数時間のデモ  | ngrok                     |
| 数日〜常時公開 | Firebase Hosting / Vercel |
| ポートフォリオ | Firebase / Vercel         |

---

## まとめ（最重要）

* ngrok は **一時公開用**
* サーバー実体は自分のPC
* `build/web` から配信する
* base-href は `/`

この手順通りやれば、Flutter Web は安定して ngrok 公開できる。
