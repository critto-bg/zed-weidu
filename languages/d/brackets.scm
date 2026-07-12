; WeiDU D — bracket matching.

("(" @open ")" @close)
(wavefile "[" @open "]" @close)

; BEGIN…END word brackets: states (when they use the optional BEGIN) and the
; generic ALTER_TRANS-style blocks. The END-terminated D actions pair their
; opening keyword with END.
(state "BEGIN" @open "END" @close)
(block "BEGIN" @open "END" @close)
(append_block
  [
    "APPEND"
    "APPEND_EARLY"
    "APPENDI"
    "REPLACE"
  ] @open
  "END" @close)
(extend_block
  [
    "EXTEND_TOP"
    "EXTEND_BOTTOM"
  ] @open
  "END" @close)
