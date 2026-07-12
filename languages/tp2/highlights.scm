; WeiDU TP2 — highlights.

(comment) @comment

(string) @string
(number) @number

(variable) @variable.special
(array) @variable
(tra_reference) @constant
(strref) @constant

(operator) @operator

; Inlined-file heredocs (<<<< label … >>>>). injections.scm highlights the body
; as its real BAF/D/TRA language; here it just gets the @embedded fallback.
[
  "<<<<<<<<"
  ">>>>>>>>"
] @punctuation.special
(heredoc_label) @string.special
(heredoc_body) @embedded

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

; Hybrid keyword highlighting: WeiDU command/keyword names are written in
; ALL_CAPS_WITH_UNDERSCORES (COPY, WRITE_LONG, ACTION_IF, …) and stay a generic
; `identifier`. Lowercase / mixed-case identifiers (variables, function names
; like resolve_state) keep the default style.
((identifier) @keyword
  (#match? @keyword "^[A-Z][A-Z0-9_]*$"))

; Structural keywords are promoted to their own tokens by the grammar (carved
; out of `identifier` via `word`), so the ALL_CAPS regex above can't see them.
[
  "BEGIN"
  "END"
  "ALWAYS"
  "LPF"
  "LAF"
  "DEFINE_ACTION_FUNCTION"
  "DEFINE_PATCH_FUNCTION"
  "DEFINE_DIMORPHIC_FUNCTION"
  "DEFINE_ACTION_MACRO"
  "DEFINE_PATCH_MACRO"
] @keyword

; Defined function/macro names (overrides the ALL_CAPS @keyword for names like
; TO_HEX_NUMBER; lower/mixed-case and fl#-style names match here too).
(function_definition name: (identifier) @function)
