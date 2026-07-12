; WeiDU TP2 auto-indentation — indent the body of every END-terminated block,
; outdenting the closing END to align with its opener.

(block "END" @end) @indent
(keyword_block "END" @end) @indent
