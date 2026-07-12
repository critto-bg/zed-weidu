; WeiDU D — language injections.
;
; A D file's script strings hold bare BAF trigger/action lists (no IF…END
; wrapper) — the state's entry trigger, a transition's IF trigger, and a DO
; action. We inject the BAF grammar into just those (the grammar tags them; the
; BAF top-level accepts bare fragments). SAY/REPLY/JOURNAL dialogue text is NOT a
; script context, so it is never matched here. `string_content` is the inner,
; delimiter-free text (no `~`/`"`); `injection.language` resolves to a language
; `name`, case-insensitively.

; State entry trigger: IF <triggerString> THEN … (the fielded trigger on `state`).
((state
   trigger: (string (string_content) @injection.content))
  (#set! injection.language "WeiDU BAF"))

; Transition condition: IF <triggerString> inside a state body.
((transition_trigger
   script: (string (string_content) @injection.content))
  (#set! injection.language "WeiDU BAF"))

; Transition action: DO <actionString>.
((do_action
   script: (string (string_content) @injection.content))
  (#set! injection.language "WeiDU BAF"))

; REPLACE_{TRIGGER,ACTION}_TEXT oldText/newText — both are BAF (the `file` arg is
; a resref, not matched here).
((replace_text
   script_old: (string (string_content) @injection.content))
  (#set! injection.language "WeiDU BAF"))
((replace_text
   script_new: (string (string_content) @injection.content))
  (#set! injection.language "WeiDU BAF"))

; ALTER_TRANS change pairs: only the TRIGGER/ACTION changeInto is BAF (REPLY/
; JOURNAL/EPILOGUE/FLAGS are dialogue/flow/ints). #match? the changeWhat content.
((alter_change
   what: (string (string_content) @_what)
   into: (string (string_content) @injection.content))
  (#match? @_what "^(TRIGGER|ACTION)$")
  (#set! injection.language "WeiDU BAF"))
