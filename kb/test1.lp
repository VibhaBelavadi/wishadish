nonVeg('chicken').
ingredient('chicken').
ingredient('salt').
vegDish(X) :- ingredient(X), not nonVeg(X).
?- vegDish('chicken').