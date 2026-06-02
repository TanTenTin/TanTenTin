---
paths:
  - "**/*.cpp"
  - "**/*.cc"
  - "**/*.h"
  - "**/*.hpp"
---

# C++ 코딩 규칙

## 네이밍

- 클래스 / 구조체: `PascalCase`
- 함수 / 변수: `camelCase`
- 상수 / 매크로: `UPPER_SNAKE_CASE`
- 멤버 변수: `m_` 접두사 또는 `_` 접미사 사용 (`m_count` 또는 `count_`)

## 메모리 관리

- raw 포인터(`new` / `delete`) 사용을 지양한다. 스마트 포인터를 사용한다.
- 소유권이 명확한 경우 `unique_ptr`, 공유가 필요한 경우 `shared_ptr`을 사용한다.
- 소유권 없이 단순 참조만 하는 경우 raw 포인터 또는 참조자(`&`)를 사용한다.

```cpp
// Bad
Foo* foo = new Foo();
delete foo;

// Good
auto foo = std::make_unique<Foo>();
```

## 헤더 파일

- 인터페이스(추상 클래스)는 순수 가상 함수(`= 0`)만 선언한다. 구현은 `.cpp`에 작성한다.
- `#pragma once`를 헤더 가드로 사용한다.

```cpp
// IUserRepository.h
#pragma once

class IUserRepository {
public:
    virtual ~IUserRepository() = default;
    virtual User findById(int id) = 0;
    virtual void save(const User& user) = 0;
};
```

## 파일 구조

헤더 파일(`.h` / `.hpp`) 내 선언 순서:

```
1. #pragma once
2. #include (시스템 헤더 → 서드파티 헤더 → 프로젝트 헤더 순)
3. 전방 선언 (forward declaration)
4. 클래스 / 구조체 선언
```

소스 파일(`.cpp`) 내 선언 순서:

```
1. 대응하는 헤더 include
2. 시스템 / 서드파티 헤더 include
3. 상수
4. 함수 / 메서드 구현
```
