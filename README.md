# CatWalk
どうしてもどうしてもどうしても！vimで猫と戯れたいあなたへ  
猫好きの猫好きによる猫好きのためのプラグインです

By all means by all means! To you who want to play with cats in vim  
A plugin for cat lovers by cat lovers

# Usage
vimを開いてノーマルモードで

```console
:WithCat
```

と入力するとメニューが表示されます。メニューのコマンドを入力すれば猫が走ります👍  
猫が走っている間は適当なコマンドを入力すれば5秒間猫が停止し、その間は開いているファイルを編集することができます。もちろん編集中も停止し続けるのでご安心ください。5秒ほど入力が途切れると再び猫が走り出します。


Open vim in normal mode

```console
:WithCat
```

enter to display the menu. Enter the command in the menu and the cat will run 👍  
While the cat is running, you can enter the appropriate command to stop the cat for 5 seconds and edit open files during that time. Of course, don't worry, it will continue to stop during editing. If the input is interrupted for about 5 seconds, the cat will start running again.

# TODO
- 現状は厳密には非同期処理ではないのでいちいち猫が停止したり編集がしづらかったりするので、非同期処理でこれを解決できないか
- 非同期処理が叶えば、ファイル編集中に入力されたコマンドに合わせて挙動を変更できないか調査
- GIFのバリエーションを増やす、クオリティを上げる


- Strictly speaking, it is not asynchronous processing at present, so cats stop and it is difficult to edit each time, so can asynchronous processing solve this?
- If asynchronous processing is realized, investigate whether the behavior can be changed according to the command entered during file editing
- Increase GIF variations and improve quality

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


If you want to add another GIF, please refer to `plugin/cat_silhouette.vim`, create an appropriate file and add it to the `plugin/` directory. Please describe the contents by giving an appropriate `g:` variable. In the following, it is assumed that `g:EGG` is given for explanation.  
In addition, [it](http://www.glassgiant.com/ascii/) is convenient to convert the image to AA.  
Then in the `s:Intro` function in `autoload/withcat.vim`

```withcat.vim
    let s:intro = popup_create([
            \ ...
            \ })
```

directly under `s:NoProp('options:')`

```withcat.vim
        \   #{text: '     1       cat shilhouette',
        \     props: [#{col: 6, length: 1, type: 'catTitle'}]},
```

add another command in the same way as.  
Then with the `s:IntroClose` function

```withcat.vim
    if a:key == '1'
        call s:Clear()
        call s:CatWalk(g:CATSHILHOUETTE)
```

add the command referring to, and change the value passed to the `s:CatWalk` function to `g:EGG` created in the first step.

# THANKS
このプラグインは公式の[killersheep](https://github.com/vim/killersheep)とkato-kさんの[Nyancat](https://github.com/kato-k/nyancat.vim)を主に参考にしています。


This plugin is mainly based on the official [killersheep](https://github.com/vim/killersheep) and kato-k's [Nyancat](https://github.com/kato-k/nyancat.vim).
