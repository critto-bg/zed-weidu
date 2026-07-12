; WeiDU TP2 — language injections into inlined-file heredocs.
;
; A `<<<<<<<< label … >>>>>>>>` block embeds another WeiDU format, named by the
; label's pseudo-filename EXTENSION (the temp file WeiDU writes the body to, e.g.
; `…/inlined/old.baf`). We recognise the extension with a `#match?` on the whole
; label and inject the matching grammar; `heredoc_body` is already a clean,
; delimiter-free content node. `injection.language` resolves to a language `name`
; (case-insensitive). Unknown/extension-less labels (incl. `.2da`, which has no
; grammar) match no rule → no injection → body stays opaque as before (the safeguard).
;
; The extension is an ImprovedAnvil/WeiDU convention, not a guarantee — hence the
; degrade-to-nothing fallback rather than a default language.

; `.baf` → BAF (BCS script)
((inlined_file
   (heredoc_label) @_label
   (heredoc_body) @injection.content)
  (#match? @_label "\\.[bB][aA][fF]([^A-Za-z0-9]|$)")
  (#set! injection.language "WeiDU BAF"))

; `.d` → D (decompiled dialogue)
((inlined_file
   (heredoc_label) @_label
   (heredoc_body) @injection.content)
  (#match? @_label "\\.[dD]([^A-Za-z0-9]|$)")
  (#set! injection.language "WeiDU D"))

; `.tra` → TRA (translation)
((inlined_file
   (heredoc_label) @_label
   (heredoc_body) @injection.content)
  (#match? @_label "\\.[tT][rR][aA]([^A-Za-z0-9]|$)")
  (#set! injection.language "WeiDU TRA"))
