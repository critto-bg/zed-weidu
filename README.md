# zed-weidu

A [Zed](https://zed.dev) editor extension providing syntax support for the file
formats used by **[WeiDU](https://weidu.org)**, the Infinity Engine modding tool
(Baldur's Gate, Icewind Dale, Planescape: Torment).

One extension, four languages — each with its own Tree-sitter grammar plus
highlighting, bracket matching, code folding, auto-indentation, and an outline.

| Language                    | File extensions        | Grammar     |
| --------------------------- | ---------------------- | ----------- |
| **TP2** — mod installer DSL | `.tp2`, `.tph`, `.tpa` | `weidu`     |
| **D** — decompiled dialogue | `.d`                   | `weidu_d`   |
| **BAF** — decompiled script | `.baf`                 | `weidu_baf` |
| **TRA** — translation file  | `.tra`                 | `weidu_tra` |

TP2 is the host language: it embeds the others through `COMPILE`/`EXTEND_*` and
inlined `<<<< … >>>>` heredocs, and D embeds BAF inside its trigger/action
strings. The extension wires these up with **language injections**, so embedded
BAF/D/TRA bodies are highlighted in their own grammar.

## Design

The grammars are a **pragmatic hybrid**: block structure is parsed precisely,
while the long tail of command names (WeiDU has hundreds) is treated as a generic
highlighted keyword rather than an enumerated rule. Unknown or modded commands
still tokenize and color — the parser degrades, it never errors. Semantic
features (go-to-definition, completion, diagnostics, formatting) would need a
separate language server and are out of scope.

## Installing (development)

Not yet published to the Zed extension registry. To run it locally:

1. Open Zed → **Extensions** → **Install Dev Extension**.
2. Select this repository's directory.

Zed builds each grammar from the committed parser sources on first load.

## Development

This repo is the Zed extension (config + queries). The Tree-sitter grammars are a
separate repo, [tree-sitter-weidu](https://github.com/critto-bg/tree-sitter-weidu),
which `extension.toml` references by URL + `rev`. Editing a `grammar.js` is a
change to that repo; `grammars/dev-install.sh <grammar>` regenerates, commits it,
and bumps the `rev` here (push the grammar repo so Zed can fetch it).

Editor query files (`languages/<lang>/*.scm`) and `config.toml` live here and are
read directly from the extension directory — changing them needs only a dev-
extension reload, no `rev` bump.

## License

[MIT](LICENSE)
