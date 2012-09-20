setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
set nosmartindent
let python_highlight_all = 1

" Auto Complet
set omnifunc=pythoncomplete#Complete

" Use :make to see syntax errors. (:cn and :cp to move around, :dist to see all errors)
"set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
