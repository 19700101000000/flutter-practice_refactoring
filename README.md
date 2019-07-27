# practice_refactoring

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 練習課題
★４まで作れれば、業務に入っても問題ないと思われる  
★５は余力があればやってみよう

1. ### ★☆☆☆☆：バグ：一部のメッセージが日本語に対応していない１
   - トップページの、追加ボタン(+)の tooltip メッセージが多言語化されていない
   - tooltipメッセージとは、ボタンを長押ししたときに表示される操作ヒントメッセージのこと
   - 各言語の表記は、次の通り
     - English : Add a comment
     - 日本語 : コメントを追加
1. ### ★☆☆☆☆：バグ：一部のメッセージが日本語に対応していない２
   - タイトルメッセージが日本語に対応していないため、対応すること
   - 日本語 : こんにちは、世界
1. ### ★☆☆☆☆：改善：メッセージ内容の変更１
   - アプリを起動したとき、ユーザーの名前が `null` になっているのを改善する
     - English : no-name
     - 日本語 : 名無し
1. ### ★☆☆☆☆：改善：メッセージ内容の変更２
   - 名前編集画面の入力欄のヒントメッセージが `名前を編集` なのはおかしいので、次のように改善する
     - English : Please input your name
     - 日本語 : 名前を入力してください
1. ### ★★☆☆☆：改善：余白をもたせる
   - 名前の編集画面の、入力欄が画面いっぱいに広がっているため、画面端との間に余白をもたせる
1. ### ★★☆☆☆：改善：から文字チェックをする
   - 現状、名前がから文字の場合に、名前が０文字表示になってしまっている
   - から文字の場合は、`名無し`さんにする
1. ### ★★★☆☆：新規：コメント入力画面を作る
   - 現状、コメント追加ボタンを押した先の画面が作成されていない
   - 名前編集画面を参考に、同じようなレイアウトのコメント入力画面を作成する
   - このとき、各メッセージは必ず多言語対応を行うこと
   - コメント一覧の表示は、次の段階で行う
1. ### ★★★☆☆：新規：入力したコメントを、トップページで表示する
   - 名前の編集処理を参考に入力したコメントを `_commentList`フィールドに追加する
   - コメント一覧フィールドにコメントを追加すると、ユーザー名の表示が消えて、コメント一覧が表示されることを確認する
1. ### ★★★★☆：改善：コメント一覧の表示をを改善する
   - コメントが非常に読みづらいため、読みやすいように体裁を整える
   - ユーザー名を表示したり、良い感じにする
1. ### ★★★★★：新規：コメントを削除する
   - 削除したいコメントをタップすると、削除確認画面が表示る
   - 削除確認画面で削除ボタンを押すことで、コメントを削除することができる