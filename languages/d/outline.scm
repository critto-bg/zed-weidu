; WeiDU D outline — the navigable units: the dialogue being created and each
; state, listed by its label. States nested inside APPEND/REPLACE/EXTEND blocks
; are matched here too, so the whole file's states show up.

(dialogue_header
  "BEGIN" @context
  name: (string) @name) @item

(state
  "IF" @context
  label: (_) @name) @item
