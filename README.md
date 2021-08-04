# CatWalk
どうしてもどうしてもどうしても！vimで猫と戯れたいあなたへ  
猫好きの猫好きによる猫好きのためのプラグインです

# Usage
vimを開いてノーマルモードで

```console
:WithCat
```

と入力するとメニューが表示されます。メニューのコマンドを入力すれば猫が走ります👍  
猫が走っている間は適当なコマンドを入力すれば5秒間猫が停止し、その間は開いているファイルを編集することができます。もちろん編集中も停止し続けるのでご安心ください。5秒ほど入力が途切れると再び猫が走り出します。

# TODO
- 現状は厳密には非同期処理ではないのでいちいち猫が停止したり編集がしづらかったりするので、非同期処理でこれを解決できないか
- 非同期処理が叶えば、ファイル編集中に入力されたコマンドに合わせて挙動を変更できないか調査
- GIFのバリエーションを増やす、クオリティを上げる

# LICENCSE
MIT

# For Developers
別のGIFを追加したい場合、`plugin/cat_silhouette.vim`を参考にして適当なファイルを作成して`plugin/`ディレクトリに追加してください。中身についても適当な`g:`変数を与えて記述してください。以降では説明のために`g:EGG`を与えたとします。  
なお、画像をAA化するのは[こちら](http://www.glassgiant.com/ascii/)などが便利です。  
その後`autoload/withcat.vim`の`s:Intro`関数にある

```withcat.vim
    let s:intro = popup_create([
            \ ...
            \ })
```

の、`s:NoProp('options:')`直下

```withcat.vim
        \   #{text: '     1       cat shilhouette',
        \     props: [#{col: 6, length: 1, type: 'catTitle'}]},
```

と同様にして、別のコマンドを追加してください。  
続いて`s:IntroClose`関数にて

```withcat.vim
    if a:key == '1'
        call s:Clear()
        call s:CatWalk(g:CATSHILHOUETTE)
```

を参考にコマンドを追記し、`s:CatWalk`関数に渡す値を最初の手順で作成した`g:EGG`に変更してください。

# THANKS
このプラグインは公式の[killersheep](https://github.com/vim/killersheep)とkato-kさんの[Nyancat](https://github.com/kato-k/nyancat.vim)を主に参考にしています。
