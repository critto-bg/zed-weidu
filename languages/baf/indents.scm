; WeiDU BAF — auto-indentation.
;
; Indent the IF…END block body (triggers + responses), outdenting the closing
; END. The RESPONSE set adds a second level so its actions sit under it — the
; shape WeiDU's decompiler emits (triggers/RESPONSE at one level, actions at two).

(script_block "END" @end) @indent
(response) @indent
