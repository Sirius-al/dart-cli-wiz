import 'dart:math';

class Deck {
  List<Card> cards = [];
  List handedOutCards = [];

  Deck() {
    var ranks = [
      'jack',
      'ace',
      'king',
      'queen',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
      'ten'
    ];
    var suits = ['diamond', 'sprades', 'clubs', 'hearts'];

    for (var rank in ranks) {
      for (var suit in suits) {
        var newCard = new Card(rank, suit);

        this.cards.add(newCard);
      }
    }
  }

  toString() {
    return cards.toString();
  }

  printCards() {
    print(cards);
  }

  shuffle() {
    cards.shuffle();
    printCards();
  }

  cardsBySuit(String suit) {
    var filteredCards = cards.where((card) => card.suit == suit);

    print('');
    print('getting values for $suit');
    print(filteredCards.toList());
  }

  deal([handSize = 7]) {
    if (cards.length == 0) {
      print('');
      return print("No cards to hand out");
    } else if (cards.length < handSize) {
      return print(cards.length.toString() +
          "cards left in the deck.. cannot handout $handSize cards");
    }

    List cardToGo = [];

    for (int i = 0; i < handSize; i++) {
      Random random = new Random();
      int randomNumber = random.nextInt(cards.length);

      var card = cards.elementAt(randomNumber);
      cards.removeAt(randomNumber);

      cardToGo.add(card);
    }

    if (cardToGo.length == handSize) {
      handedOutCards.add([...cardToGo]);

      print('');
      print('handed out cards ' + handedOutCards.length.toString());
      print(handedOutCards);
    }
  }

  removeCard(typeOfCard) {
    for (var i = 0; i < cards.length; i++) {
      var card = cards[i];

      var matchRank = typeOfCard.contains(card.rank);
      var matchSuit = typeOfCard.contains(card.suit);

      if (matchRank && matchSuit) {
        var cardToRemove = cards[i];
        cards.removeAt(i);

        print('$cardToRemove =======>>>>>> has been removed');
      }
    }
  }
}

class Card {
  String rank = '';
  String suit = '';

  Card(rank, suit) {
    this.rank = rank;
    this.suit = suit;
  }
  toString() {
    var self = '$rank of $suit';
    return self.toString();
  }
}

void main() {
  var deck = new Deck();
  deck.printCards();

  deck.shuffle();

  deck.cardsBySuit('clubs');

  for (var i = 0; i < 0; i++) {
    deck.deal(5);
  }

  deck.removeCard('four club');
}
