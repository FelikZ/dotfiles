" get path to ".vimprj" folder
let s:sPath = expand('<sfile>:p:h')

" specify our ".vimprj/.indexer_files"
let g:indexer_indexerListFilename = s:sPath.'/.indexer_files'

