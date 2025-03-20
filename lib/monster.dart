import 'dart:math';

import 'package:battle_rpg_game/character.dart';

class Monster {
  String name;
  int hp;
  int maxAttack;
  int randomAttack = 0;
  int defense = 0;
  int defenseCounter = 0;

  Monster({required this.name, required this.hp, required this.maxAttack});  

  void setRandomAttack() {
    randomAttack = Random().nextInt(maxAttack);
  }

  Character attackCharacter(Character character) {
    int damage = randomAttack <= character.defense ? 0 : randomAttack - character.defense;
    character.hp -= damage;
    print('$name이(가) ${character.name}에게 $damage의 데미지를 입혔습니다.');
    return character;
  }

  void showStatus() {
    print('$name - 체력: $hp, 공격력: $randomAttack, 방어력: $defense');
  }
}
