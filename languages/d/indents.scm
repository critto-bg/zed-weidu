; WeiDU D auto-indentation — indent the body of every END-terminated construct,
; outdenting the closing END to align with its opener.

(state "END" @end) @indent
(append_block "END" @end) @indent
(extend_block "END" @end) @indent
(block "END" @end) @indent
