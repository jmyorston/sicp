# SICP
This repo is my attempt over time to work through the excercises in SICP.

## Set up tips

### __Viewing pdf's in vscode__
vscode-pdf is a simple plugin that makes it easy to read sicp in split screen.

### __Code formatting in vscode__
I havent figured out how to format in vscode using magic-racket, but using the racket [fmt](https://pkgs.racket-lang.org/package/fmt) package works with the run on save vscode extension as a workaround to format `.rkt` files:

```json
"commands": [
            {
                "match": "\\.rkt$",
                "cmd": "/Users/jamesyorston/formatracket.sh ${file}"
            }
        ]
```

### __Running the excercises__
and to run the procedures
```bash
racket sqrrt.rkt
```
