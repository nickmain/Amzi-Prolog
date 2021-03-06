%----------------
% German
%

gsentence(M, [CapFirst|Rest], []) :-
  var(M),
  capitalize(First, CapFirst),
  gsent(M, [First|Rest], []).
gsentence(M, S, []) :-
  var(S),
  gsent(M, [First|Rest], []),
  capitalize(First, CapFirst),
  S = [CapFirst|Rest].

gsent( identity(subj(S),obj(O)) ) -->
  gsubject(S), gisverb(_), gobject(O), gperiod.

gsubject(S) --> garticle(_), gpronoun(S).

gobject(noun(O,[])) --> gnoun(O).

gisverb(M) --> [X], { dict(gdict,M,X,[ps=verb,is]) }.

gpronoun(M) --> [X], { dict(gdict,M,X,[ps=pronoun]) }.

gnoun(M) --> [X], { dict(gdict,M,X,[ps=noun]) }.

garticle(M) --> [X], { dict(gdict,M,X,[ps=article]) }.

gperiod --> ['. '].

gdict(a, ein, [ps=article]).
gdict(black, schwarze, [ps=adj]).
gdict(book, 'Buch', [ps=noun]).
gdict(box, 'Schachtel', [ps=noun]).
gdict(farthat, das, [ps=pronoun]).
gdict(is, ist, [ps=verb,is]).
gdict(red, rote, [ps=adj]).
gdict(what, was, [ps=pronoun,interrogative]).
gdict(pencil, 'Bleistift', [ps=noun]).
gdict(that, das, [ps=adj]).
gdict(that, das, [ps=pronoun]).
gdict(this, das, [ps=adj]).
gdict(this, das, [ps=pronoun]).
