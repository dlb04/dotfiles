let mapleader=' '

nmap <C-p> :FZF<CR>
nmap <C-b> :NERDTreeToggle<CR>
nmap mm :w<CR>

"
" GoTo code navigation.
"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <leader>gd <Plug>(coc-definition)
nmap <silent><leader>si <Plug>(coc-implementation)
nmap <silent><leader>sr <Plug>(coc-references)
nmap <leader>cn <Plug>(coc-rename)

nmap <silent><leader>v :Vista!!<CR>
