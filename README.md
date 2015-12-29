lisp-cards
===========

## Pragmatic playing-card AI writtien in pure ANSI Commmon Lisp ##
lisp-cards is written in as pure as is feasible common lisp, therefore the
mutation of global state in the system is strictly prohibited. As such,
code resuability is kept very high by supporting potentially multiple packs of cards
provided they fit the following interface:

> (defparameter *my-new-pack*
>   '((rank suit) (rank suit) ...))

Likewise, the AI and even the game engine may be recycled simply by supplying
the counting and decision algorithms with a new lookup table.

### Usage ###
To load, simply `cd` into the directory of the file, launch your favourite
lisp interpreter and type `(load 'cards.cl)` to get started.

#### (deal-hand (n pack &optional already-dealt hand) ...)
deal-hand returns a list of cards of the above format given the following parameters:
- n - size of desired hand
- pack - the specific poole of cards from which to draw a hand
(optional parameters)
- already-dealt - excludes these cards from a potental hand as presumably
in a nother players' hand
- hand - current hand generated thus far (used for generation only)
