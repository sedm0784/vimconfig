if exists("b:current_syntax")
  finish
endif
let s:keepcpo= &cpo
set cpo&vim

let b:current_syntax = "csv.expenses"

hi link ExpensesCurrent SpellRare
hi link ExpensesError ErrorMsg

syntax clear ExpensesError

let s:exre_date = '\d{4}-\d\d-\d\d'
let s:exre_categories = '(Kittens|Car|Holiday|Charity|Bills|Credit|Groceries|Home\/Garden|Income|Gifts|Baby|Joint Fun Times|My Fun Times|One Offs|Other)'
let s:exre_payment_types = '(Credit|Regular Payment|Credit Card|Cash|Debit Card \(Joint\)|Debit Card|Transfer)'
let s:exre_amount = '-?\d+(\.\d\d)?'

let s:exre_good  = s:exre_date          .. ','
let s:exre_good .= s:exre_categories    .. ','
let s:exre_good .= s:exre_payment_types .. ','
let s:exre_good .= s:exre_amount        .. ','

" N.B. b:exre is also used by the mappings in ftplugin
let b:exre = '\v^'
let b:exre .= '(' .. s:exre_good .. ')@!'
let b:exre .= '.*'

execute 'syntax match ExpensesError /' .. b:exre .. '/'

let &cpo = s:keepcpo
unlet s:keepcpo
