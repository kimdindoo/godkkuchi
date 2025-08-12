import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  // MyGame 클래스의 인스턴스를 생성합니다.
  final myGame = MyGame();

  // GameWidget을 사용하여 게임을 화면에 렌더링합니다.
  runApp(
    GameWidget(game: myGame),
  );
}

// FlameGame을 상속받는 MyGame 클래스
class MyGame extends FlameGame {
  // 뿌딩이 캐릭터를 나타낼 SpriteComponent 변수
  late SpriteComponent bbudingCharacter;

  @override
  Future<void> onLoad() async {
    // 게임이 시작될 때 한 번만 호출됩니다.
    super.onLoad();

    // 'images/bbuding.png' 경로의 스프라이트를 비동기로 로드합니다.
    // 'images/'는 pubspec.yaml에 설정한 경로에 자동으로 추가됩니다.
    final bbudingSprite = await loadSprite('bbuding.png');

    // SpriteComponent를 생성하여 캐릭터의 속성을 정의합니다.
    bbudingCharacter = SpriteComponent(
      sprite: bbudingSprite,
      size: Vector2(150, 150), // 캐릭터의 크기를 150x150으로 설정
      anchor: Anchor.center, // 위치 설정의 기준점을 캐릭터의 중심으로 설정
      position: size / 2, // 게임 화면의 정중앙에 배치
    );

    // 준비된 캐릭터 컴포넌트를 게임 월드에 추가합니다.
    add(bbudingCharacter);
  }
}
