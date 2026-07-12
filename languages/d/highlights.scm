; WeiDU D — highlights.

(comment) @comment

(string) @string
(number) @number

; @123 TRA refs, #123 strrefs, !123 forced strrefs — all string-table references.
(tra_reference) @constant
(strref) @constant
(forced_strref) @constant

(operator) @operator

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

; Most D keywords stay generic ALL_CAPS identifiers (SAY, REPLY, DO, GOTO,
; EXTERN, EXIT, JOURNAL, COPY_TRANS, ADD_*, REPLACE_*_TEXT, …). Lowercase /
; mixed-case identifiers (symbolic state labels, resref names) keep the default.
((identifier) @keyword
  (#match? @keyword "^[A-Z][A-Z0-9_]*$"))

; Structural keywords are promoted to their own tokens by the grammar (carved
; out of `identifier` via `word`), so the ALL_CAPS regex above can't see them.
[
  "BEGIN"
  "END"
  "IF"
  "THEN"
  "WEIGHT"
  "APPEND"
  "APPEND_EARLY"
  "APPENDI"
  "REPLACE"
  "EXTEND_TOP"
  "EXTEND_BOTTOM"
  "DO"
  "REPLACE_TRIGGER_TEXT"
  "REPLACE_TRIGGER_TEXT_REGEXP"
  "REPLACE_ACTION_TEXT"
  "REPLACE_ACTION_TEXT_REGEXP"
  "ALTER_TRANS"
] @keyword

; The target DLG filename in a REPLACE_*_TEXT — a resref, not display text.
(replace_text file: (string) @string.special)

; ALTER_TRANS: the target filename is a resref; the changeWhat ("TRIGGER"/…) is a
; flag naming which field is altered.
(alter_trans file: (string) @string.special)
(alter_change what: (string) @property)

; The new-dialogue filename (BEGIN ~CECHALLE~).
(dialogue_header name: (string) @string.special)

; [resref] sound association — the bracketed name is a resref, not a keyword
; (e.g. [PC], [CEFALD02]). Listed after the keyword rule so it overrides it.
(wavefile resref: (identifier) @string.special)
