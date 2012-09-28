if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

" 基本的な設定はこちら
" .vim/bundle/vimrc/plugin/basic.vim
"
" GUI関連はこちら
" .vim/bundle/vimrc/plugin/gui.vim
"
" マッピングに関するものはこちら
" .vim/bundle/vimrc/plugin/mappings.vim
"
" プラグインとそのマッピングについてはこちら
" .vim/bundle/vimrc/plugin/plugins_vimrc.vim
"
" 独自関数や便利関数はこちら
" .vim/bundle/vimrc/plugin/util.vim
" pathogen.vim用

call pathogen#runtime_append_all_bundles()

" カーソル行をハイライト
  set cursorline
  " カレントウィンドウにのみ罫線を引く
  augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
  augroup END

" カーソル行をハイライト表示
":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=white guibg=block

" カーソル行の下線のみを表示
hi CursorLine gui=underline guibg=NONE

" Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge
imap <C-z> <C-y>
imap <nul> <C-z>,
let g:user_zen_expandaddr_key='<Nul>'

" ;でコマンド入力( ;と:を入れ替)
noremap ; :
noremap : ;

" :Ptでインデントモード切替
command! Pt :set paste!

" PHPLint
noremap ,l :call PHPLint()<CR>
function PHPLint()
    let result = system( &ft . ' -l '. bufname(""))
    echo result
endfunction

" .psgi とか .t も Perlなシンタックスハイライトをしてほしい
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
