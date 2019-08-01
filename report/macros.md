!def(figures)(
Creates a figure with subfigures in it.
Accepts three arguments. The first is the name. The second is the caption. The third is the content of the figure.
You can reference the figure like this: `[@fig:<name>]`.
)
~~~

:::::::::::::::::::::::::::::::::::::::::::::: {#fig:!1}

!3

!2

::::::::::::::::::::::::::::::::::::::::::::::

~~~

!def(widefig)(
    Figures created inside this environment are wide.
)(

```{=latex}
\begin{widefig}
```

!1

```{=latex}
\end{widefig}
```

)

!def(latex)(
    Executes the following as latex.
)(
```{=latex}
!1
```
)


!def(calc)(
    Calculates the expression using bc
) (!bash(echo '!1' | bc -l))

!def(bib)(
    Inserts the bibliography at the specified location
)(

# References {-}

::: {#refs}
:::

)

!def(grammar)(Creates a bnf grammar using the specified rules)
(
!latex
```
\begin{grammar}
!1
\end{grammar}
```
)