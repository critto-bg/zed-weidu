; WeiDU TP2 — bracket matching.
("(" @open ")" @close)
("[" @open "]" @close)

; BEGIN…END blocks (and the ALWAYS/LPF/LAF keyword blocks) are word-brackets, so
; matching-highlight jumps between an opener and its END.
(block "BEGIN" @open "END" @close)
(keyword_block "END" @close)
