# SICP
An attempt to work through the excercises in SICP.

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
and in the formatracket.sh file:

```bash
#!/bin/sh
raco fmt --width 40 $1 > temp.rkt && mv temp.rkt $1
```

### __Running the excercises__
and to run the procedures
```bash
racket sqrrt.rkt
```

## Excercise solutions:
- [1.1](Chapter1/excercises/ex1-1.md)
- [1.2](Chapter1/excercises/ex1-2.md)
- [1.3](Chapter1/excercises/ex1-3.md)
- [1.4](Chapter1/excercises/ex1-4.md)
- [1.5](Chapter1/excercises/ex1-5.md)
- [1.6](Chapter1/excercises/ex1-6.md)
- [1.7](Chapter1/excercises/ex1-7.md)
- [1.8](Chapter1/excercises/ex1-8.md)
- [1.9](Chapter1/excercises/ex1-9.md)
- [1.10](Chapter1/excercises/ex1-10.md)
- [1.11](Chapter1/excercises/ex1-11.md)
- [1.12](Chapter1/excercises/ex1-12.md)