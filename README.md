import 'dart:io';
# Battle RPG Game
이 프로젝트는 간단한 텍스트 기반의 RPG 게임입니다. 플레이어는 캐릭터를 선택하고 몬스터와 전투를 진행하며, 게임 결과를 파일에 저장할 수 있습니다.

## 주요 기능
1. **파일로부터 데이터 읽기**  
    - `characters.txt` 파일에서 캐릭터 정보를 읽어옵니다.  
    - `monsters.txt` 파일에서 몬스터 정보를 읽어옵니다.

2. **사용자로부터 캐릭터 이름 입력받기**  
    - 플레이어는 캐릭터의 이름을 입력해야 합니다.  
    - 이름은 한글 또는 영문만 허용됩니다.

3. **게임 진행**  
    - 입력받은 캐릭터 이름과 파일에서 읽어온 데이터를 기반으로 캐릭터와 몬스터를 초기화합니다.  
    - 게임이 시작되며, 플레이어는 몬스터와 전투를 진행합니다.

4. **게임 결과 저장**  
    - 게임 종료 후, 플레이어는 결과를 파일(`result.txt`)에 저장할 수 있습니다.  
    - 결과 파일에는 캐릭터 이름, 남은 HP, 그리고 승리 여부가 기록됩니다.

## 실행 사진

<img width="530" alt="Image" src="https://github.com/user-attachments/assets/35106307-6db5-4a23-ba44-d46097907e86" />

## 주의사항
- `characters.txt`와 `monsters.txt` 파일의 데이터 형식은 반드시 올바르게 작성되어야 합니다.  
