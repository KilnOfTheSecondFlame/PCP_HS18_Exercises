female(mary).
female(liz).
female(mia).
female(tina).
female(ann).
female(sue).
%all females

male(mike).
male(jack).
male(fred).
male(tom).
male(joe).
male(jim).
% all males

parent(mary, mia).
parent(mary, fred).
parent(mary, tina).
% all childern of mary

parent(mike, mia).
parent(mike, fred).
parent(mike, tina).
% all children of mike

parent(liz, tom).
parent(liz, joe).
% allchildern of liz

parent(jack, tom).
parent(jack, joe).
% all childern of jack

parent(mia, ann).
% all childern of mia

parent(tina, sue).
parent(tina, jim).
% all childern of tina

parent(tom, sue).
parent(tom, jim).
% all childern of tom

mother(Mother, Child) :- female(Mother), parent(Mother, Child).
father(Father, Child) :- male(Father), parent(Father, Child).
% functions for mother and father queries

sibling(Sibling_one, Sibling_two) :- parent(X, Sibling_one), parent(X, Sibling_two).
% function if one's a sibling of the other