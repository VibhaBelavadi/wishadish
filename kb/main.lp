#include 'user.lp'.
#include 'dish.lp'.
#include 'ingredient.lp'.
#include 'ingredientInDish.lp'.
#include 'taste.lp'.
#include 'cuisine.lp'.
#include 'course.lp'.

member(X, [X|T]).
member(X, [Y|T]) :- X\=Y, member(X,T).

spicyDish(D) :- spicyDish(D, 2, []).
spicyDish(D, N, L) :- N=0,dish(D),ingredient(I),in(D, I),spicy(I),not member(I, L).
spicyDish(D, N, L) :- N>0,dish(D),ingredient(I),in(D, I),spicy(I),not member(I, L), N1 is N - 1, spicyDish(D, N1, [I|L]).

sweetDish(D) :- sweetDish(D, 1, []).
sweetDish(D, N, L) :- N=0,dish(D),ingredient(I),in(D, I),sweet(I),not member(I, L).
sweetDish(D, N, L) :- N>0,dish(D),ingredient(I),in(D, I),sweet(I),not member(I, L), N1 is N - 1, sweetDish(D, N1, [I|L]).

sourDish(D) :- sourDish(D, 1, []).
sourDish(D, N, L) :- N=0,dish(D),ingredient(I),in(D, I),sour(I),not member(I, L).
sourDish(D, N, L) :- N>0,dish(D),ingredient(I),in(D, I),sour(I),not member(I, L), N1 is N - 1, sourDish(D, N1, [I|L]).

nonVegDish(D) :- dish(D),ingredient(I),in(D, I),nonVeg(I).
vegDish(D) :- not nonVegDish(D).
dairyDish(D) :- dish(D), ingredient(I), in(D, I), dairy(I).
veganDish(D) :- vegDish(D), not dairyDish(D).

%dish('someDish').
%cuisineOf('someDish','chinese').

likes(X,'chinese') :- location(X,'Beijing, China').
likes(X,'mexican') :- location(X,'Dallas, Texas').
likes(X,'indian') :- location(X,'Hyderabad, India').
likes(X,'italian') :- location(X,'Venice, Italy').

likesType(X,'dessert') :- age(X, Y), Y < 21. 

top(E) :- dish(E),likes(A,C),cuisineOf(E,C).
top(E) :- dish(E),likesType(A,G),courseOf(E,G).
#compute 0 {top(E)}.