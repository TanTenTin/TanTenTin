---
paths:
  - "**/*.java"
---

# Java 코딩 규칙

## 네이밍

- 클래스 / 인터페이스 / 열거형: `PascalCase`
- 메서드 / 변수: `camelCase`
- 상수: `UPPER_SNAKE_CASE`
- 패키지: 소문자 `com.example.myapp`

## 클래스 설계

- 가능하면 불변(immutable) 객체로 설계한다. 필드는 `final`로 선언하고 setter를 두지 않는다.
- DTO / 값 객체는 `record`로 정의한다.

```java
// Bad
class Point {
    private int x;
    private int y;
    public void setX(int x) { this.x = x; }
}

// Good
record Point(int x, int y) {}
```

- 구현체보다 인터페이스 타입으로 참조한다.

```java
// Bad
ArrayList<String> list = new ArrayList<>();

// Good
List<String> list = new ArrayList<>();
```

## 예외 처리

- `checked exception` 사용을 지양한다. `RuntimeException` 계열을 사용한다.
- 커스텀 예외 클래스는 레이어 구조가 갖춰진 프로젝트에서 도입한다.
- `catch` 블록을 비워두지 않는다. 최소한 로깅을 남긴다.

```java
// Bad
try {
    doSomething();
} catch (Exception e) {}

// Good
try {
    doSomething();
} catch (Exception e) {
    log.error("doSomething 실패", e);
    throw new ServiceException("처리 중 오류가 발생했습니다.", e);
}
```

## 파일 구조

파일 내 선언 순서를 아래와 같이 고정한다:

```
1. package 선언
2. import
3. 클래스 선언
   a. 상수 (static final)
   b. 인스턴스 필드
   c. 생성자
   d. 메서드
```
