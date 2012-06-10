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
syn keyword magiqReserved contained AC ACC ACCEPT AND CALL CO COMPLEX COMPUTE
syn keyword magiqReserved contained DET DI DIS DISPLAY DY ELSE END-IF FILE GO LE
syn keyword magiqReserved contained LEF LEFTJ LJ MO MOVE MV NEXT OC OCC OCCURS
syn keyword magiqReserved contained OR PATTERN PIC PE PER PERFORM PQ PR PRI
syn keyword magiqReserved contained PRINT PROCEDURAL R RG READ REWRITE ROW ROWA
syn keyword magiqReserved contained ROWB SEARCH SECTION SET SI SIMPLE SIZE START
syn keyword magiqReserved contained ST STR STRING SU SUB SUBSET SYSTEM TO TOT VA
syn keyword magiqReserved contained VAL VALUE VARIABLES WRITE
syn match   magiqReserved contained "\<\(IF\|END\)\>"

" Command Variables
syn match   magiqCommand  "\<WA\=[1-7]\=\>"
syn match   magiqCommand  "\<W[89]\>"
syn match   magiqCommand  "\<\$[^ ]*\>" " UNIX environment variable

" Special Variables
syn keyword magiqSpecial  S S132ON S80ON SACBL SACINFO SACNV SACSKIP SACT SACTA
syn keyword magiqSpecial  SACTRAN SADD SALP SALP2 SALPO SAMP SAT SBOX SBRACKET
syn keyword magiqSpecial  SBREAK SCALLID SCARAT SCOBLVL SCOLE SCOLFL SCOLS
syn keyword magiqSpecial  SCOMMA SCONAME SCONDE SCONDR1 SCONDR2 SCONDRF SCONDRG
syn keyword magiqSpecial  SCONDS SCRDY SCREEN SCRLN SCRNV SCRPR SCRPRE SCRSZ
syn keyword magiqSpecial  SCSVDEL SCSVQUOTE SCURNO SCURNO2 SCURNOF SCURNON
syn keyword magiqSpecial  SCURSCR SDATE SDATEF SDAY SDEBUG SDEL SDYFL SECT
syn keyword magiqSpecial  SECTSUB SELECT SEMICOL SENDKEY SEQAC SEQF SEQNEXT
syn keyword magiqSpecial  SEQST SERAL SERASE SERASE2 SF1 SF1A SF1B SFDESC SFID
syn keyword magiqSpecial  SFILEOP SFLEXYW SFNAME SFNO SFORMAT SFORMFEED SHDA
syn keyword magiqSpecial  SHDAA SHDAB SHDB SHDBA SHDBB SHDFL SIGN SJOIN SJOINF
syn keyword magiqSpecial  SJULN SJULNA SKEY SKEYAUTO SKEYBD SKFLAG SKIPZ SKKGID
syn keyword magiqSpecial  SKPREF SLAB SLADV SLASTNO SLINE SLINK SLINS SLIST
syn keyword magiqSpecial  SLISTRC SLISTS SLMODE SLVL SM SMAINT SMASK SMASKWA
syn keyword magiqSpecial  SMENUMSG SNBSP SNCVAR SNEWIF SNEWPG SNEXTN2 SNEXTNO
syn keyword magiqSpecial  SNOTEKY SNULL SNUM SNUMS SNXTROW SNXTRWN SOCC SOKCNT
syn keyword magiqSpecial  SOP SORD SORDKEY SORDREV SORTFL SPACE SPGE SPGNO SPGSZ
syn keyword magiqSpecial  SPIF SPOFF SPOS SPR SPRDEV SPROMP2 SPROMPT SQUOTE
syn keyword magiqSpecial  SRDCNT SREV SRFAUD SRG SRGKEY SRGOPT SRGS SROUND SROW
syn keyword magiqSpecial  SROWN SRSPC SRUNDT SRUNTM STABLE STABLEB STABNUB
syn keyword magiqSpecial  STABNUM STALLY STEPS STITLE STITLE1 STITLE3 STOTD
syn keyword magiqSpecial  STOTDIV STRACE SUBA SUBADV1 SUBADV2 SUBCHAR SUBFL
syn keyword magiqSpecial  SUBST SUBUL SUL SULCH SULINE SULINE2 SUSERID SUSERIW
syn keyword magiqSpecial  SUSERNAM SUSERNO SW SW2 SWHERE SWI SWINCNT SWIND
syn keyword magiqSpecial  SWORKD1 SWORKD2 SWORKDY SWORKTB
syn match   magiqSpecial  "\<S[1-9]\>"
syn match   magiqSpecial  "\<SCOL\d\{1,3}\>"
syn match   magiqSpecial  "\<SHD[1-4][12]\>"
syn match   magiqSpecial  "\<SHD[AB]\{1,2}\>"
syn match   magiqSpecial  "\<SID[1-9]\>"
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
