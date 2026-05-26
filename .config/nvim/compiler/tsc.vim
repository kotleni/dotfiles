if exists("current_compiler")
  finish
endif
let current_compiler = "tsc"

CompilerSet makeprg=pnpm\ exec\ tsc\ -p\ tsconfig.json\ --noEmit\ --pretty\ false
CompilerSet errorformat=%f(%l\\,%c):\ %trror\ TS%n:\ %m
