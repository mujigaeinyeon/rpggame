import 'dart:io';
import 'dart:math';

import 'package:battle_rpg_game/character.dart';
import 'package:battle_rpg_game/monster.dart';

class Game {
  Character character;
  List<Monster> monsters;
    
  Game({required this.character, required this.monsters});  

  bool startGame() {
    character.bonusHealth();  

    print('게임을 시작합니다!');
    character.showStatus();
    print('');

    final int monsterCount = monsters.length;

    do{
      if(monsters.length != monsterCount) {
        print('다음 몬스터와 대결하시겠습니까? (y/n): ');
        if(stdin.readLineSync() != 'y') { break; }
      } 

      Monster monster = getRandomMonster();
  
      print('새로운 몬스터가 나타났습니다!');
      monster.showStatus();
      print('');

      battle(monster);
    } while(monsters.isNotEmpty && character.hp > 0);
    
    if(monsters.isEmpty) {
      print('축하합니다! 모든 몬스터를 물리쳤습니다.');
      return true;
    }
    
    return false;
  }

  void battle(Monster monster) {
    do {
      bool defenseUsed = false;

      print('${character.name} 턴');
      print('행동을 선택하세요 (1: 공격, 2: 방어, 3: 공격력 두 배): ');
      switch (stdin.readLineSync()) {
        case '1' :
          character.attackMonster(monster);
          break;
        case '2' :
          defenseUsed = true;
          break;
        case '3' :
          if (!character.itemUsed) {
            character.doubleAttack();
            character.attackMonster(monster);
          }
          break;
        default : // 잘못된 값 입력시 그냥 넘어감
          break;
      }
      print('');
      
      // 도전3 - 몬스터의 방어력 증가 기능 추가
      print('${monster.name} 턴');
      monster.defenseCounter++;
      if(monster.defenseCounter == 3) { 
        monster.defenseCounter = 0; 
        monster.defense = 0; 
      }

      if(defenseUsed) { 
        character.hp += monster.randomAttack; 
        character.defend(monster.randomAttack);
      } else { monster.attackCharacter(character); }
      
      character.showStatus();
      monster.showStatus();
      print('');

    } while (monster.hp > 0 && character.hp > 0);
    
    if(monster.hp <= 0) {
      monsters.remove(monster);
      print('${monster.name}을(를) 물리쳤습니다!');
      print('');
      if (!character.itemUsed) { character.attack ~/= 2; }

      // 도전4 - 몬스터 처치 시 캐릭터 레벨업 및 체력회복
      character.attack *= 2;
      character.defense *= 2;
      character.hp = character.maxHp;
    }
  }

  Monster getRandomMonster() {
    Monster monster = monsters[Random().nextInt(monsters.length)];
    monster.setRandomAttack();
    return monster;
  }
}
