---
paths:
  - "**/*.php"
---

# PHP 코딩 규칙

## 네이밍

- 클래스 / 인터페이스: `PascalCase`
- 메서드 / 함수 / 변수: `camelCase`
- 상수: `UPPER_SNAKE_CASE`
- 파일명: 클래스 파일은 `PascalCase`, 일반 스크립트는 `snake_case`

## 파일 로딩

- `require` / `include` 사용 시 `include_once` 또는 `require_once`를 사용한다.
- 경로는 `__DIR__` 기반 절대경로로 작성한다. 상대경로를 사용하지 않는다.

```php
// Bad
require '../config/database.php';

// Good
require_once __DIR__ . '/../config/database.php';
```

## 타입 선언

- 함수 인자와 반환 타입을 명시한다.
- nullable 타입은 `?Type` 또는 `Type|null`로 표현한다.

```php
// Bad
function getUser($id) {
    return $this->db->find($id);
}

// Good
function getUser(int $id): ?User {
    return $this->db->find($id);
}
```

## 파일 구조

파일 내 선언 순서를 아래와 같이 고정한다:

```
1. <?php 선언
2. namespace 선언
3. use (import)
4. 상수
5. 클래스 / 함수
```

클래스 내부 순서:

```
1. 상수 (const)
2. 정적 프로퍼티 (static)
3. 인스턴스 프로퍼티
4. 생성자 (__construct)
5. 매직 메서드
6. 정적 메서드
7. 인스턴스 메서드
```
