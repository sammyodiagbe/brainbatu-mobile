class User {
  final String username;
  final String email;
  final int wallet;
  final int gameWallet;
  final String avatarUrl;
  final bool verified;
  User(this.username, this.email, this.wallet, this.gameWallet, this.avatarUrl,
      this.verified);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        wallet = json['wallet'],
        gameWallet = json['gameWallet'],
        avatarUrl = json['avatarUrl'],
        verified = json['verified'];

  Map<String, dynamic> toJson() => {
        'name': username,
        'email': email,
        'wallet': wallet,
        'gameWallet': gameWallet,
        'avatarUrl': avatarUrl,
        'verified': verified
      };
}
