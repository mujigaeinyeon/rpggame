import 'dart:math';

import 'package:battle_rpg_game/monster.dart';

class Character {
  String name;
  int hp;
  int attack;
  int defense;
  int maxHp;
  bool itemUsed = false;

  Character({required this.name, required this.hp, required this.attack, required this.defense, required this.maxHp});  

  Monster attackMonster(Monster monster) {
    int damage = attack <= monster.defense ? 0 : attack - monster.defense;
    monster.hp -= damage;
    print('$name이(가) ${monster.name}에게 $damage의 데미지를 입혔습니다.');
    return monster;
  }

  void defend(int defensePoint) {
    print('$name이(가) 방어 태세를 취하여 $defensePoint 만큼 체력을 얻었습니다.');
  }

  void showStatus() {
    print('$name - 체력: $hp, 공격력: $attack, 방어력: $defense');
  }
  
  // 도전1 - 캐릭터의 체력 증가 기능 추가
  void bonusHealth(){
    if(Random().nextDouble() <= 0.3) {
      hp += 10;
      print('보너스 체력을 얻었습니다! 현재 체력: ${hp}');
    }
  }

  // 도전2 - 한 턴 아이템 사용 기능 추가
  void doubleAttack() { 
    itemUsed = true; 
    attack *= 2;
  }
}
