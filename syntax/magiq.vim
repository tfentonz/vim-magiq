" Vim syntax file
" Language:    HyperMagiq  
" Maintainer:  Tom Fenton <tom@ncs.co.nz>
" Last change: 21 Jul 2006

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" MOST important - else most of the keywords wont work!
if version < 600
  set isk=@,48-57,-
else
  setlocal isk=@,48-57,-
endif

syn case match

" Reserved Words
syn keyword hmReserved contained AC ACC ACCEPT AND CALL CO COMPLEX COMPUTE DET
syn keyword hmReserved contained DI DIS DISPLAY DY ELSE END-IF FILE GO LE LEF
syn keyword hmReserved contained LEFTJ LJ MO MOVE MV NEXT OC OCC OCCURS OR
syn keyword hmReserved contained PATTERN PIC PE PER PERFORM PQ PR PRI PRINT
syn keyword hmReserved contained PROCEDURAL R RG READ REWRITE ROW ROWA ROWB
syn keyword hmReserved contained SEARCH SECTION SET SI SIMPLE SIZE START ST STR
syn keyword hmReserved contained STRING SU SUB SUBSET SYSTEM TO TOT VA VAL VALUE
syn keyword hmReserved contained VARIABLES WRITE
syn match   hmReserved contained "\<\(IF\|END\)\>"

" Command Variables
syn match   hmCommand  "\<WA\=[1-7]\=\>"
syn match   hmCommand  "\<W[89]\>"
syn match   hmCommand  "\<\$[^ ]*\>" " UNIX environment variable

" Special Variables
syn keyword hmSpecial  S132ON S80ON SACBL SACINFO SACNV SACSKIP SACTRAN SACT[A]
syn keyword hmSpecial  SADD SALP[2] SAMP SAT SBOX SBRACKET SCALLID SCARAT
syn keyword hmSpecial  SCOBLVL SCOLS SCOLFL SCOLON SCONAME SCONDR1 SCONDR2
syn keyword hmSpecial  SCONDRF SCONDRG SCREEN SCRDY SCRPR SCPRE SCRSZ SCSVDEL
syn keyword hmSpecial  SCSVQUOTE SCURNO[2] SCURNON SCURSCR SDEBUG SDAY SDATE[F]
syn keyword hmSpecial  SDEL SDYFL SECT SECTSUB SEMICOL SENDKEY SERAL SERASE[2]
syn keyword hmSpecial  SEQF SEQAC SEQNEXT SEQST SF1[A] SF1B SFDESC SFID SFILEOP
syn keyword hmSpecial  SFLEXYW SFNAME SFNO SFORMAT SFORMFEED SHD32 SHDFL SID
syn keyword hmSpecial  SIGN SIZE SJOIN[F] SJULN[A] SKEY SKEYAUTO SKEYBD SKFLAG
syn keyword hmSpecial  SKIPZ SKKGID SKPREF SLAB SLADV SLASTAC SLASTGP SLASTNO
syn keyword hmSpecial  SLINE SLINK SLINS SLIST[S] SLISTRC SLMODE SLVL SMAINT
syn keyword hmSpecial  SMASK SMASKWA SMENUMSG SNBSP SNCVAR SNEWIF SNEWPG SNEXTAC
syn keyword hmSpecial  SNEXTGP SNEXTNO SNEXTN2 SNOTEKY SNXTROW SNULL SNUM[S]
syn keyword hmSpecial  SOCC SOKCNT SORD SORDKEY SORDREV SORTFL SOP SPACE SPGE
syn keyword hmSpecial  SPGNO SPGSZ SPOS SPR SPRDEV SPROMP2 SPROMPT SQUOTE SREV
syn keyword hmSpecial  SRFAUD SRG[S] SRGKEY SRGOPT SRDCNT SROUND SROW SRSPC
syn keyword hmSpecial  SRUNDT SRUNTM S[M] STABLE[B] STALLY STEPS STITLE[1]
syn keyword hmSpecial  STITLE3 STOTD STOTID STOTDIV STRACE SUBA SUBADV1 SUBADV2
syn keyword hmSpecial  SUBCHAR SUBFL SUBST SUBUL SUL SULCH SULINE[2] SUSERID
syn keyword hmSpecial  SUSERNAM SUSERNO SW[2] SWHERE SWIND SWINCNT SWORKD1
syn keyword hmSpecial  SWORKD2 SWORKDY SWORKTB
syn match   hmSpecial  "\<S[1-9]\>"
syn match   hmSpecial  "\<SCOL\d\{1,3}\>"
syn match   hmSpecial  "\<SHD[1-9]\>"
syn match   hmSpecial  "\<SHD[AB]\{1,2}\>"
syn match   hmSpecial  "\<SRG\d\{1,2}\>"

syn keyword hmGoTo     GO
syn keyword hmCopy     COPY

syn match   hmTodo     "[Tt][Oo][Dd][Oo]" contained
syn match   hmSpecComment "DYOFF" contained
" syn region  hmComment  start=" *\*" end="$" contains=hmTodo,hmSpecComment,hmCommentTitle
syn match   hmComment  +*.*$+ contains=hmCommentTitle,hmSpecComment,hmTodo
syn match   hmCommentTitle '\s*\(\u\a*\s*\a*\s*\)\+:'ms=s+1 contained

syn keyword hmCALLs    CALL PE PER PERFORM PQ
"syn keyword hmCondition IF AND OR ELSE EN ENDIF
"syn match   hmCondition "\<END[- ]IF\>"
" syn keyword hmExit     EXIT
" syn match   hmExit     "\.$"
syn match   hmLabel    "^ *[-/[:alnum:]]\+\] *$"
syn keyword hmOperator EQ EP GE GT LE LT NE NP
" syn match   hmOperator " [*/][T]\= "
syn match   hmOperator " [-+#] "
syn match   hmOperator " \*\{1} "
syn match   hmOperator " [<>]\=[=]\= "

syn match   hmString   /"[^"]*\("\|$\)/
syn match   hmString   /'[^']*\('\|$\)/

syn region  hmLine     start="^" end="$" contains=ALL

syn region  hmCondFlow contains=ALLBUT,hmLine start="\<\(IF\|END\)\>" skip=/\(\)/ end="\." keepend 

syn match   hmField    "\<[FJ]\d\{1,4}"
syn match   hmField    "\<[FJ]-[-/[:alnum:]]\+"
syn match   hmIdent    "\<V[-/[:alnum:]]\+\>"
syn match   hmIdent    "^[-/[:alnum:]]\+\(\][A][1-6]\)\=\]"
" tom syn match   hmIdent    "^[-/[:alnum:]]*\][A]\=[1-6]\=\]"
" syn match   hmType     "^[-/[:alnum:]]*\]\=[A]\=[1-6]\=\]" " ?
" syn match   hmIdent  "^[-/[:alnum:]]\+\]\=[A]\=[1-6]\=\]"
"syn match   hmError    "[^"]*\"[^"]*$"
syn match   hmError    /"[^"]*$/
syn match   hmError    /'[^']*$/
syn match   hmError    "^\s*\].*$" " Lines starting with ]

" Define the default highlighting.
" For version 5.7 and earlier: only when no done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_magiq_syntax_inits")
  if version < 508
    let did_magiq_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

"  HiLink hmIfError     Error
  HiLink hmCALLs       Function
  HiLink hmCommand     Special
  HiLink hmComment     Comment
  HiLink hmCommentTitle PreProc
  HiLink hmCondFlow    Special
"  HiLink hmCondition   Conditional
  HiLink hmCopy        PreProc
  HiLink hmDecl        Type
"  HiLink hmExit        Statement
  HiLink hmError       Error
  HiLink hmField       Special
  HiLink hmGoTo        Special
  HiLink hmIdent       Identifier
"  HiLink hmIdent       Error
  HiLink hmLabel       Function
  HiLink hmOperator    Operator
  HiLink hmReserved    Statement
"  HiLink hmSpecComment SpecialComment
  HiLink hmSpecial     Special
  HiLink hmString      Constant
  HiLink hmTodo        Todo
"  HiLink hmType        Type
"  HiLink hmVariables   Type

  delcommand HiLink
endif

let b:current_syntax = "magiq"

" vim: expandtab tabstop=4 shiftwidth=4
