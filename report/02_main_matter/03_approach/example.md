

## Parsing

## Trivial Merge

The trivial merging of grammars G1 and G2 yields the following grammar G3:

!grammar
~~~
<S> ::= <S1> | <S2>
<S1> ::=
<S2> ::=
<A> ::=
<B> ::=
<C> ::=
<D> ::=
<E> ::=
<F> ::=
<G> ::=
<H> ::=
<I> ::=
<J> ::=
~~~

## Normalization

### Eliminate Unused Rules

When applied to G3 the grammar is transformed into the following:

!grammar
~~~
<S> ::= <S1> | <S2>
<S1> ::=
<S2> ::=
<A> ::=
<B> ::=
<C> ::=
<D> ::=
<F> ::=
<G> ::=
<H> ::=
<I> ::=
~~~

### Simplify

When this step is applied to grammar G3, it is transformed into the following:

!grammar
~~~
<S> ::= <S1> | <S2>
<S1> ::=
<S2> ::=
<A> ::=
<B> ::=
<C> ::=
<F> ::=
<G> ::=
<H> ::=
~~~

### Merge Equivalent Rules

When this step is applied to grammar G3, it is transformed into the following:

!grammar
~~~
<S> ::= <S1> | <S2>
<S1> ::=
<S2> ::=
<A> ::=
<B> ::=
<C> ::=
<D> ::=
<F> ::=
<G> ::=
<H> ::=
<I> ::=
~~~

### Eliminate Unit Rules

When this step is applied to grammar G3, it is transformed into the following:

!grammar
~~~
<S> ::= <S1> | <S2>
<S1> ::=
<S2> ::=
<A> ::=
<B> ::=
<C> ::=
<D> ::=
<F> ::=
<G> ::=
<H> ::=
<I> ::=
~~~

### Expand Productions

When this step is applied to grammar G3, it is transformed into the following:

!grammar
~~~
<S> ::= <S1> | <S2>
<S1> ::=
<S2> ::=
<A> ::=
<B> ::=
<C> ::=
<D> ::=
<F> ::=
<G> ::=
<H> ::=
<I> ::=
~~~

### Collapse Compatible Productions

When this step is applied to grammar G3, it is transformed into the following:

!grammar
~~~
<S> ::= <S1> | <S2>
<S1> ::=
<S2> ::=
<A> ::=
<B> ::=
<C> ::=
<D> ::=
<F> ::=
<G> ::=
<H> ::=
<I> ::=
~~~

### Measuring Rule Similarity

### Merging Similar Rules

### Grammar Output
