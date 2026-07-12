; WeiDU BAF — bracket matching.

; IF…END word brackets for a script block.
(script_block "IF" @open "END" @close)

; Call parens and object-specifier / point brackets.
("(" @open ")" @close)
(object "[" @open "]" @close)
