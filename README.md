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

   ### 解答
   - `lib/l10n/messages.dart` 内に、メッセージの多言語対応手順が書いてあるので、それに従う
   - `lib/l10n/messages.dart`
     ```dart
     class Messages {
       /* 省略 */
       String get editYourName => Intl.message('Edit your name', name: 'editYourName');
       String get addAComment => Intl.message('Add a comment', name: 'addAComment'); // 追加
     }
     ```
   - `lib/l10n/intl_ja.arb`
     ```javascript
     {
       /* 省略 */
       "editYourName": "名前を編集", // ここのカンマを忘れずに！
       "addAComment": "コメントを追加" // 追加
     }
     ```
   - 直接変更するのは、この2つのファイルのみで、次のファイルはコマンドにより書き換えが行われる
     - `lib/l10n/intl_messages.arb`
     - `lib/l10n/messages_all.dart`
     - `lib/l10n/messages_en.dart`
     - `lib/l10n/messages_ja.dart`
   - 最後に、 `lib/l10n/messages.dart` に追加したメソッドを利用するように、 該当箇所を書き換える
   - `lib/pages/root_page.dart`
     ```dart
     class _RootPageState extends State<RootPage> {
       /* 省略 */
       Widget _buildActionButton() {
         return FloatingActionButton(
           onPressed: () => _push(Categories.add_comment),
           tooltip: Messages.of(context).addAComment, // 書き換え
           child: Icon(Icons.add),
         ); // FloatingActionButton
       }
       /* 省略 */
     }
     ```
1. ### ★☆☆☆☆：バグ：一部のメッセージが日本語に対応していない２
   - タイトルメッセージが日本語に対応していないため、対応すること
   - 日本語 : こんにちは、世界

   ### 解答
   - `lib/l10n/messages.dart` に英語の記載はあるため、日本語メッセージの追加忘れによるバグなので…
   - `lib/l10n/intl_ja.arb`
     ```javascript
     {
       "@@locale": "ja",
       "title": "こんにちは、世界", // 追加
       /* 省略 */
     }
     ```
1. ### ★☆☆☆☆：改善：メッセージ内容の変更１
   - アプリを起動したとき、ユーザーの名前が `null` になっているのを改善する
     - English : no-name
     - 日本語 : 名無し

   ### 解答
   - `lib/l10n/messages.dart`
     ```dart
     class Messages {
       /* 省略 */
       String get noName => Intl.message('no-name', name: 'noName'); // 追加
     }
     ```
   - `lib/l10n/intl_ja.arb`
     ```javascript
     {
       /* 省略 */
       "addAComment": "コメントを追加", // カンマを忘れずに
       "noName": "名無し" // 追加
     }
     ```
   - 基本的に、初期化は `initState()` や宣言と同時に代入するが、  
   各国語対応のメッセージ表示は`BuildContext` をりようするため、 `build()` の中で行う  
   このとき、 `null` の場合のみ、という条件を付けるのを忘れないこと
   - `lib/pages/root_page.dart`
     ```dart
     class _RootPageState extends State<RootPage> {
       final _commentList = List<String>();
       String _userName; // 値を代入していない場合、 null になる
       /* 省略 */
       @override
       Widget build(BuildContext context) {
         if (_userName == null)                     // 追加
           _userName = Messages.of(context).noName; //
         /* 省略 */
       }
     }
     ```
1. ### ★☆☆☆☆：改善：メッセージ内容の変更２
   - 名前編集画面の入力欄のヒントメッセージが `名前を編集` なのはおかしいので、次のように改善する
     - English : Please input your name
     - 日本語 : 名前を入力してください

   ### 解答
   - `lib/l10n/messages.dart`
     ```dart
     class Messages {
       /* 省略 */
       String get pleaseInputYourName => Intl.message('Please input your name', name: 'pleaseInputYourName'); // 追加
     }
     ```
   - `lib/l10n/intl_ja.arb`
     ```javascript
     {
       /* 省略 */
       "noName": "名無し", // カンマを忘れずに
       "pleaseInputYourName": "名前を入力してください" // 追加
     }
     ```
   - `lib/pages/edit_name_page.dart`
     ```dart
     class _EditNamePageState extends State<EditNamePage> {
       /* 省略 */
       @override
       Widget build(BuildContext context) {
         return Scaffold(
           /* 省略 */
           body: Center(
             child: TextField(
               autofocus: true,
               controller: controller,
               decoration: InputDecoration(
                 hintText: Messages.of(context).pleaseInputYourName, // 書き換え
               ), // InputDecoration
             ), // TextField
           ), // Center
         ); // Scaffold
       }
     }
     ```
1. ### ★★☆☆☆：改善：余白をもたせる
   - 名前の編集画面の、入力欄が画面いっぱいに広がっているため、画面端との間に余白をもたせる

   ### 解決
   - 余白を持たせるために、 `Padding` でラップする
   - `lib/pages/edit_name_page.dart`
     ```dart
     class _EditNamePageState extends State<EditNamePage> {
       /* 省略 */
       @override
       Widget build(BuildContext context) {
         return Scaffold(
           /* 省略 */
           body: Center(
             child: Padding(                       // Padding でラップ
               padding: const EdgeInsets.all(8.0), //
               child: TextField(
                 autofocus: true,
                 controller: controller,
                 decoration: InputDecoration(
                   hintText: Messages.of(context).pleaseInputYourName,
                 ), // InputDecoration
               ), // TextField
             ), // Padding
           ), // Center
         ); // Scaffold
       }
     }
     ```
1. ### ★★☆☆☆：改善：から文字チェックをする(
   - 現状、名前がから文字の場合に、名前が０文字表示になってしまっている
   - から文字の場合は、`名無し`さんにする

   ### 解答
   - 名前がから文字のときに `名無し` を代入する
   - `lib/page/root_page.dart`
     ```dart
     class _RootPageState extends State<RootPage> {
       /* 省略 */
       @overrid
       Widget build(BuildContext context) {
         if (_userName == null || _userName.isEmpty) // から文字のときに、名無しさんにする
          _userName = Messages.of(context).noName;   // null 判定は、問題３の内容
         /* 省略 */
       }
     }
     ```
1. ### ★★★☆☆：新規：コメント入力画面を作る
   - 現状、コメント追加ボタンを押した先の画面が作成されていない
   - 名前編集画面を参考に、同じようなレイアウトのコメント入力画面を作成する
   - このとき、各メッセージは必ず多言語対応を行うこと
   - コメント一覧の表示は、次の段階で行う

   ### 解説
   - 名前編集画面の実装を参考にすると良い
   - `lib/l10n/messages.dart`
     ```dart
     class Messages {
       /* 省略 */
       String get pleaseInputAComment => Intl.message('Please input a comment', name: 'pleaseInputAComment'); // 追加
     }
     ```
   - `lib/l10n/intl_ja.arb`
     ```javascript
     {
       "pleaseInputYourName": "名前を入力してください", // カンマ忘れずに
       "pleaseInputAComment": "コメントを入力してください" // 追加
     }
     ```
   - **new** `lib/pages/add_comment_page.dart`
   - `lib/utils/app_navigators.dart`
     ```dart
     class AppNavigators {
       static Future<dynamic> push(BuildContext context, Categories category, {dynamic arg}) async {
         return await Navigator.of(context).push(
           MaterialPageRoute(
             builder: (BuildContext context) {
               switch(category) {
                 case Category.edit_name:
                   return EditNamePage(arg is String
                     ? arg
                     : '');
                 case Categories.add_comment: // 追加
                   return AddCommentPage();   //
                 default: 
                   return EmptyPage();
               }
             }
           ), // MaterialPageRoute
         );
       }
     }
     ```
1. ### ★★★☆☆：新規：入力したコメントを、トップページで表示する
   - 名前の編集処理を参考に入力したコメントを `_commentList`フィールドに追加する
   - コメント一覧フィールドにコメントを追加すると、ユーザー名の表示が消えて、コメント一覧が表示されることを確認する
1. ### ★★★★☆：改善：コメント一覧の表示をを改善する
   - コメントが非常に読みづらいため、読みやすいように体裁を整える
   - ユーザー名を表示したり、良い感じにする
1. ### ★★★★★：新規：コメントを削除する
   - 削除したいコメントをタップすると、削除確認画面が表示る
   - 削除確認画面で削除ボタンを押すことで、コメントを削除することができる