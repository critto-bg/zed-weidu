; WeiDU BAF — outline.
;
; Script blocks are anonymous (BCS has no block labels), so the only nav handle
; is the block's first trigger. List each IF…END block by that first trigger's
; call name (e.g. See, Global, OnCreation) — a lightweight jump target per block.
; The `.` anchors to the first named child, so each block yields exactly one item.

(script_block
  "IF" @context
  .
  (trigger
    (call
      name: (identifier) @name))) @item
