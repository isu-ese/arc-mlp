# Methods {#sec:methods}

To evaluate our approach, we tested it on three different grammars.
These grammars are the grammars for Java, C#, and Brainfuck. Our grammars
for Java and C# were taken from a repository of ANTLR grammars. We then
tested the grammars by merging them with themselves and merging Java with C#.

For the Java and C# grammars, their ANTLR representation wasn't fully compatible
with the BNF format our tool depends upon. To resolve this, we removed or converted
all non-bnf features except for dot, character range, character class, and not rules. The dot rule is a single character wildcard. Character ranges allow
you to specify a range of characters. A character class only matches characters that
fall into certain Unicode classes. The not rules match anything that isn't one of a
set of items. For dot, character range, and character class rules, we converted
them to special terminal symbols. For not rules, we keep them but make sure
to extract them out as their own rules and their contents as well. For example

```
A: 'a' . ~('b' | 'c')
```

\noindent would be converted to

!latex
```
\begin{grammar}
<A> ::= `a' DOT <Generated-1>

<Generated-1> ::= \textasciitilde<Generated-2>

<Generated-2> ::= `b' | `c'
\end{grammar}
```

\noindent The not rules are ignored completely by our algorithm except for
when detecting and merging duplicate rules.

For our Brainfuck grammar, we used the following grammar:

!latex
```
\begin{grammar}
<prog> ::= $\varepsilon$ | <command> <prog>

<command> ::= <loop> | <simpleCommand>

<loop> ::= `[' <prog> `]'

<simpleCommand> ::= `>' | `<' | `.' | `,' | `-' | `+'
\end{grammar}
```

To test our grammars, we merged the Brainfuck and Java grammars with themselves
to see how well it merges the identical structures.
We also merged the Java and C# grammars together to see how well our grammar
detects similar structures between the grammars. We were especially interested
in how effective our algorithm was at detecting classes, methods,
expressions, and statements as similar structures between Java and C#.
