"#######################
" 表示系
"#######################
set number "行番号表示
set showmode "モード表示
set scrolloff=999       " 常にカーソルがウインドウの中心に
"set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示
set notitle
set backspace=2         " 改行後のBackSpaceキーの振る舞い

"#######################
" プログラミングヘルプ系
"#######################
syntax on "カラー表示
"set smartindent "オートインデント
"set autoindent " 自動インデント
set cindent             " プログラム用自動インデント
" tab関連
set expandtab "タブの代わりに空白文字挿入
set ts=4 sw=4 sts=0 "タブは半角4文字分のスペース
" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"#######################
" 検索系
"#######################
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
set nohlsearch "検索結果文字列の非ハイライト表示
set nobackup "fugahoge
set wildmode=list:full  " 補完機能を有効にする
set wildmenu            " 補完候補を表示する
set listchars=tab:>-    " Tabを明示的に表示
"set listchars=tab:^\ ,trail:~,eol:$
set list                " Tabや改行を可視化
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P " ステータス行に文字コードと改行コードを表示
set incsearch           "検索打ち込み中にも検索
set hlsearch            "検索打ち込み中にも検索
