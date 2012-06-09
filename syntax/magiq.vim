" Vim syntax file
" Language:    Magiq
" Maintainer:  Tom Fenton <tom@ncs.co.nz>
" Last change: 10 Jul 2012

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
syn keyword magiqReserved contained AC ACC ACCEPT AND CALL CO COMPLEX COMPUTE DET
syn keyword magiqReserved contained DI DIS DISPLAY DY ELSE END-IF FILE GO LE LEF
syn keyword magiqReserved contained LEFTJ LJ MO MOVE MV NEXT OC OCC OCCURS OR
syn keyword magiqReserved contained PATTERN PIC PE PER PERFORM PQ PR PRI PRINT
syn keyword magiqReserved contained PROCEDURAL R RG READ REWRITE ROW ROWA ROWB
syn keyword magiqReserved contained SEARCH SECTION SET SI SIMPLE SIZE START ST STR
syn keyword magiqReserved contained STRING SU SUB SUBSET SYSTEM TO TOT VA VAL VALUE
syn keyword magiqReserved contained VARIABLES WRITE
syn match   magiqReserved contained "\<\(IF\|END\)\>"

" Command Variables
syn match   magiqCommand  "\<WA\=[1-7]\=\>"
syn match   magiqCommand  "\<W[89]\>"
syn match   magiqCommand  "\<\$[^ ]*\>" " UNIX environment variable

" Special Variables
syn keyword magiqSpecial  S132ON S80ON SACBL SACINFO SACNV SACSKIP SACTRAN SACT[A]
syn keyword magiqSpecial  SADD SALP[2] SAMP SAT SBOX SBRACKET SCALLID SCARAT
syn keyword magiqSpecial  SCOBLVL SCOLS SCOLFL SCOLON SCONAME SCONDR1 SCONDR2
syn keyword magiqSpecial  SCONDRF SCONDRG SCREEN SCRDY SCRPR SCPRE SCRSZ SCSVDEL
syn keyword magiqSpecial  SCSVQUOTE SCURNO[2] SCURNON SCURSCR SDEBUG SDAY SDATE[F]
syn keyword magiqSpecial  SDEL SDYFL SECT SECTSUB SEMICOL SENDKEY SERAL SERASE[2]
syn keyword magiqSpecial  SEQF SEQAC SEQNEXT SEQST SF1[A] SF1B SFDESC SFID SFILEOP
syn keyword magiqSpecial  SFLEXYW SFNAME SFNO SFORMAT SFORMFEED SHD32 SHDFL SID
syn keyword magiqSpecial  SIGN SIZE SJOIN[F] SJULN[A] SKEY SKEYAUTO SKEYBD SKFLAG
syn keyword magiqSpecial  SKIPZ SKKGID SKPREF SLAB SLADV SLASTAC SLASTGP SLASTNO
syn keyword magiqSpecial  SLINE SLINK SLINS SLIST[S] SLISTRC SLMODE SLVL SMAINT
syn keyword magiqSpecial  SMASK SMASKWA SMENUMSG SNBSP SNCVAR SNEWIF SNEWPG SNEXTAC
syn keyword magiqSpecial  SNEXTGP SNEXTNO SNEXTN2 SNOTEKY SNXTROW SNULL SNUM[S]
syn keyword magiqSpecial  SOCC SOKCNT SORD SORDKEY SORDREV SORTFL SOP SPACE SPGE
syn keyword magiqSpecial  SPGNO SPGSZ SPOS SPR SPRDEV SPROMP2 SPROMPT SQUOTE SREV
syn keyword magiqSpecial  SRFAUD SRG[S] SRGKEY SRGOPT SRDCNT SROUND SROW SRSPC
syn keyword magiqSpecial  SRUNDT SRUNTM S[M] STABLE[B] STALLY STEPS STITLE[1]
syn keyword magiqSpecial  STITLE3 STOTD STOTID STOTDIV STRACE SUBA SUBADV1 SUBADV2
syn keyword magiqSpecial  SUBCHAR SUBFL SUBST SUBUL SUL SULCH SULINE[2] SUSERID
syn keyword magiqSpecial  SUSERNAM SUSERNO SW[2] SWHERE SWIND SWINCNT SWORKD1
syn keyword magiqSpecial  SWORKD2 SWORKDY SWORKTB
syn match   magiqSpecial  "\<S[1-9]\>"
syn match   magiqSpecial  "\<SCOL\d\{1,3}\>"
syn match   magiqSpecial  "\<SHD[1-9]\>"
syn match   magiqSpecial  "\<SHD[AB]\{1,2}\>"
syn match   magiqSpecial  "\<SRG\d\{1,2}\>"

syn keyword magiqGoTo     GO
syn keyword magiqCopy     COPY

syn match   magiqTodo     "[Tt][Oo][Dd][Oo]" contained
syn match   magiqSpecComment "DYOFF" contained
" syn region  magiqComment  start=" *\*" end="$" contains=magiqTodo,magiqSpecComment,magiqCommentTitle
syn match   magiqComment  +*.*$+ contains=magiqCommentTitle,magiqSpecComment,magiqTodo
syn match   magiqCommentTitle '\s*\(\u\a*\s*\a*\s*\)\+:'ms=s+1 contained

syn keyword magiqCALLs    CALL PE PER PERFORM PQ
"syn keyword magiqCondition IF AND OR ELSE EN ENDIF
"syn match   magiqCondition "\<END[- ]IF\>"
" syn keyword magiqExit     EXIT
" syn match   magiqExit     "\.$"
syn match   magiqLabel    "^ *[-/[:alnum:]]\+\] *$"
syn keyword magiqOperator EQ EP GE GT LE LT NE NP
" syn match   magiqOperator " [*/][T]\= "
syn match   magiqOperator " [-+#] "
syn match   magiqOperator " \*\{1} "
syn match   magiqOperator " [<>]\=[=]\= "

syn match   magiqString   /"[^"]*\("\|$\)/
syn match   magiqString   /'[^']*\('\|$\)/

syn region  magiqLine     start="^" end="$" contains=ALL

syn region  magiqCondFlow contains=ALLBUT,magiqLine start="\<\(IF\|END\)\>" skip=/\(\)/ end="\." keepend

syn match   magiqField    "\<[FJ]\d\{1,4}"
syn match   magiqField    "\<[FJ]-[-/[:alnum:]]\+"
syn match   magiqIdent    "\<V[-/[:alnum:]]\+\>"
syn match   magiqIdent    "^[-/[:alnum:]]\+\(\][A][1-6]\)\=\]"
" syn match   magiqIdent    "^[-/[:alnum:]]*\][A]\=[1-6]\=\]"
" syn match   magiqType     "^[-/[:alnum:]]*\]\=[A]\=[1-6]\=\]" " ?
" syn match   magiqIdent    "^[-/[:alnum:]]\+\]\=[A]\=[1-6]\=\]"
" syn match   magiqError    "[^"]*\"[^"]*$"
syn match   magiqError    /"[^"]*$/
syn match   magiqError    /'[^']*$/
syn match   magiqError    "^\s*\].*$" " Lines starting with ]

" hi def link magiqIfError     Error
hi def link magiqCALLs       Function
hi def link magiqCommand     Special
hi def link magiqComment     Comment
hi def link magiqCommentTitle PreProc
hi def link magiqCondFlow    Special
" hi def link magiqCondition   Conditional
hi def link magiqCopy        PreProc
hi def link magiqDecl        Type
" hi def link magiqExit        Statement
hi def link magiqError       Error
hi def link magiqField       Special
hi def link magiqGoTo        Special
hi def link magiqIdent       Identifier
" hi def link magiqIdent       Error
hi def link magiqLabel       Function
hi def link magiqOperator    Operator
hi def link magiqReserved    Statement
" hi def link magiqSpecComment SpecialComment
hi def link magiqSpecial     Special
hi def link magiqString      Constant
hi def link magiqTodo        Todo
" hi def link magiqType        Type
" hi def link magiqVariables   Type

let b:current_syntax = "magiq"

" vim: expandtab tabstop=4 shiftwidth=4
