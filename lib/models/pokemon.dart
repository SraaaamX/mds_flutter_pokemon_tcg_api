class PokemonCard {
  final String id;
  final String name;
  final String? supertype;
  final List<String>? subtypes;
  final String? hp;
  final List<String>? types;
  final String? evolvesFrom;
  final List<Ability>? abilities;
  final List<Attack>? attacks;
  final List<Weakness>? weaknesses;
  final List<Resistance>? resistances;
  final List<String>? retreatCost;
  final PokemonSet? set;
  final String? number;
  final String? artist;
  final String? rarity;
  final CardImages? images;
  final CardMarket? cardmarket;

  PokemonCard({
    required this.id,
    required this.name,
    this.supertype,
    this.subtypes,
    this.hp,
    this.types,
    this.evolvesFrom,
    this.abilities,
    this.attacks,
    this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.set,
    this.number,
    this.artist,
    this.rarity,
    this.images,
    this.cardmarket,
  });

  factory PokemonCard.fromJson(Map<String, dynamic> json) {
    return PokemonCard(
      id: json['id'],
      name: json['name'],
      supertype: json['supertype'],
      subtypes: json['subtypes'] != null ? List<String>.from(json['subtypes']) : null,
      hp: json['hp'],
      types: json['types'] != null ? List<String>.from(json['types']) : null,
      evolvesFrom: json['evolvesFrom'],
      abilities: json['abilities'] != null
          ? (json['abilities'] as List).map((e) => Ability.fromJson(e)).toList()
          : null,
      attacks: json['attacks'] != null
          ? (json['attacks'] as List).map((e) => Attack.fromJson(e)).toList()
          : null,
      weaknesses: json['weaknesses'] != null
          ? (json['weaknesses'] as List).map((e) => Weakness.fromJson(e)).toList()
          : null,
      resistances: json['resistances'] != null
          ? (json['resistances'] as List).map((e) => Resistance.fromJson(e)).toList()
          : null,
      retreatCost: json['retreatCost'] != null ? List<String>.from(json['retreatCost']) : null,
      set: json['set'] != null ? PokemonSet.fromJson(json['set']) : null,
      number: json['number'],
      artist: json['artist'],
      rarity: json['rarity'],
      images: json['images'] != null ? CardImages.fromJson(json['images']) : null,
      cardmarket: json['cardmarket'] != null ? CardMarket.fromJson(json['cardmarket']) : null,
    );
  }
}

class PokemonSet {
  final String id;
  final String name;
  final String series;
  final int printedTotal;
  final int total;
  final String releaseDate;

  PokemonSet({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.releaseDate,
  });

  factory PokemonSet.fromJson(Map<String, dynamic> json) {
    return PokemonSet(
      id: json['id'],
      name: json['name'],
      series: json['series'],
      printedTotal: json['printedTotal'],
      total: json['total'],
      releaseDate: json['releaseDate'] ?? '',
    );
  }
}

class CardImages {
  final String small;
  final String large;

  CardImages({required this.small, required this.large});

  factory CardImages.fromJson(Map<String, dynamic> json) {
    return CardImages(small: json['small'], large: json['large']);
  }
}

class Ability {
  final String name;
  final String text;
  final String type;

  Ability({required this.name, required this.text, required this.type});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      name: json['name'] ?? '',
      text: json['text'] ?? '',
      type: json['type'] ?? '',
    );
  }
}

class Attack {
  final List<String> cost;
  final String name;
  final String text;
  final String damage;

  Attack({
    required this.cost,
    required this.name,
    required this.text,
    required this.damage,
  });

  factory Attack.fromJson(Map<String, dynamic> json) {
    return Attack(
      cost: json['cost'] != null ? List<String>.from(json['cost']) : [],
      name: json['name'] ?? '',
      text: json['text'] ?? '',
      damage: json['damage'] ?? '',
    );
  }
}

class Weakness {
  final String type;
  final String value;

  Weakness({required this.type, required this.value});

  factory Weakness.fromJson(Map<String, dynamic> json) {
    return Weakness(type: json['type'], value: json['value']);
  }
}

class Resistance {
  final String type;
  final String value;

  Resistance({required this.type, required this.value});

  factory Resistance.fromJson(Map<String, dynamic> json) {
    return Resistance(type: json['type'], value: json['value']);
  }
}

class CardMarket {
  final String url;
  final String updatedAt;
  final CardMarketPrices prices;

  CardMarket({required this.url, required this.updatedAt, required this.prices});

  factory CardMarket.fromJson(Map<String, dynamic> json) {
    return CardMarket(
      url: json['url'],
      updatedAt: json['updatedAt'],
      prices: CardMarketPrices.fromJson(json['prices']),
    );
  }
}

class CardMarketPrices {
  final double? averageSellPrice;
  final double? lowPrice;
  final double? trendPrice;

  CardMarketPrices({
    this.averageSellPrice,
    this.lowPrice,
    this.trendPrice,
  });

  factory CardMarketPrices.fromJson(Map<String, dynamic> json) {
    return CardMarketPrices(
      averageSellPrice: (json['averageSellPrice'] as num?)?.toDouble(),
      lowPrice: (json['lowPrice'] as num?)?.toDouble(),
      trendPrice: (json['trendPrice'] as num?)?.toDouble(),
    );
  }
}
