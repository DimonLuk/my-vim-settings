" Add fzf quit mapping
let g:fzf_preview_quit_map = 1

" fzf window layout
let g:fzf_preview_layout = 'top split new'

" Rate of fzf window
let g:fzf_preview_rate = 1

" Key to toggle fzf window size of normal size and full-screen
let g:fzf_full_preview_toggle_key = '<C-a>'

" Commands used for fzf preview.
" The file name selected by fzf becomes {}
let g:fzf_preview_command = 'head -100 {-1}'           " Not installed ccat
let g:fzf_preview_command = 'ccat --color=always {-1}' " Installed ccat

" Commands used for binary file
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'

" Commands used to get the file list from project
let g:fzf_preview_filelist_command = 'git ls-files --exclude-standard'               " Not Installed ripgrep
let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --glob "!.git/*"' " Installed ripgrep

" Commands used to get the git status file list
let g:fzf_preview_gitfiles_command = "git status --short --untracked-files=all | awk '{if (substr($0,2,1) !~ / /) print $2}'"

" Commands used for project grep
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading'

" Commands used for preview of the grep result
let g:fzf_preview_grep_preview_cmd = expand('<sfile>:h') . '/plugged/fzf-preview.vim/bin/preview.rb'

" Keyboard shortcuts while fzf preview is active
let g:fzf_preview_default_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'
