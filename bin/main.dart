import 'dart:io';

import 'package:battle_rpg_game/character.dart';
import 'package:battle_rpg_game/game.dart';
import 'package:battle_rpg_game/monster.dart';

void main() {
  // 필수1 = 파일로부터 데이터 읽어오기 기능
  var characterFile = File('../lib/characters.txt');
  var monsterFile = File('../lib/monsters.txt');
  // print(characterFile.readAsStringSync());

  // 필수2 - 사용자로부터 캐릭터 이름 입력받기 기능
  String characterName = inputCharacterName();

  Character character = setCharacter(characterFile, characterName); // 초기 캐릭터 세팅
  List<Monster> monsters = setMonster(monsterFile, character.defense);  // 초기 몬스터 세팅
  Game game = Game(character: character, monsters: monsters);

  // 게임 시작
  game.startGame();

  // 필수3 - 게임 종료 후 결과를 파일에 저장하는 기능
  print('결과를 저장하시겠습니까? (y/n): ');
  if(stdin.readLineSync() == 'y') {
    saveResult(character, 'Y'); // todo 일단 승리로 설정
  }
}


String inputCharacterName() {
  String characterName;
  while(true) {
    stdout.write('캐릭터의 이름을 입력하세요: ');
    characterName = stdin.readLineSync() ?? '';
    RegExp regExp = RegExp(r'^[a-zA-Z가-힣]+$');
    if(!regExp.hasMatch(characterName)){
      print('캐릭터 이름은 한글 또는 영문으로만 입력해주세요.');
    } else {
      break;
    }
  }
  print('');
  return characterName;
}

Character setCharacter(File characterFile, String characterName) {
  var characterInfo = characterFile.readAsLinesSync()[0].split(',');
  var character = Character(
                    name: characterName, 
                    hp: int.parse(characterInfo[0]), 
                    attack: int.parse(characterInfo[1]), 
                    defense: int.parse(characterInfo[2]), 
                    maxHp: int.parse(characterInfo[0])
                  );
  return character;
}

List<Monster> setMonster(File monsterFile, int characterDefense) {
  int length = monsterFile.readAsLinesSync().length;
  var monsterLines = monsterFile.readAsLinesSync();
  return List.generate(length, (index) {
    var monsterInfo = monsterLines[index].split(',');
    return Monster(
      name: monsterInfo[0],
      hp: int.parse(monsterInfo[1]),
      maxAttack: int.parse(monsterInfo[2]),
    );
  });
}

void saveResult(Character character, String result) {
  File file = File('../lib/result.txt');
  if (file.existsSync()) {
    file.writeAsStringSync('${character.name},${character.hp},$result\n', mode: FileMode.append);
  } else {
    file.writeAsStringSync('${character.name},${character.hp},$result\n');
  }
}
