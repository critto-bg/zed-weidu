; WeiDU TRA — highlights.
;
; A flat list of `@n = ~text~ [sound]` translation entries. The displayed text is
; the payload; the @n key and the sound resref are the metadata around it.

(comment) @comment

; The translation text itself.
(string) @string

; @n entry key / reference value, #n reference value, ( AT "var" ) key.
(tra_reference) @constant
(strref) @constant
"AT" @keyword

; [resref] sound association — a resref, not free text.
(wavefile resref: (resref) @string.special)

"=" @operator

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket
