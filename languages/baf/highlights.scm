; WeiDU BAF — highlights.
;
; The grammar models every trigger/action as a `call` (name + parenthesised
; args), so we colour by POSITION, not by a name list: a name before `(` is a
; function, a bare name is an IDS constant / object reference. A modded or
; unknown trigger therefore colours identically to a vanilla one.

(comment) @comment

(string) @string
(number) @number

; @n inline TRA text and the RESPONSE #weight head — string-table / numeric refs.
(tra_reference) @constant
(strref) @constant

; Bare identifiers: IDS symbolic constants (ENEMY, LOCALS, STATE_PANIC, …) and
; object references (Myself, Player1, …). Listed BEFORE the call-name rule so
; that rule (later) overrides it for names that are actually calls — Zed's query
; precedence is last-match-wins.
(identifier) @constant

; Trigger / action / object-returning call names → @function (any case).
(call name: (identifier) @function)

; Negation prefix on a trigger.
"!" @operator

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

[
  ","
  "."
] @punctuation.delimiter

; Structural keywords (carved out of `identifier` via `word`).
[
  "IF"
  "THEN"
  "END"
  "RESPONSE"
] @keyword
