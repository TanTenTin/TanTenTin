---
paths:
  - "**/*.py"
---

# Python 코딩 규칙

## 네이밍

- 함수 / 변수명: `snake_case`
- 클래스명: `PascalCase`
- 상수: `UPPER_SNAKE_CASE`
- 파일명: `snake_case`

## 타입 힌트

- 모든 함수의 인자와 반환 타입에 타입 힌트를 반드시 명시한다.

```python
# Bad
def get_user(user_id):
    return db.find(user_id)

# Good
def get_user(user_id: str) -> User:
    return db.find(user_id)
```

- 반환값이 없는 함수는 `-> None`을 명시한다.
- 값이 없을 수 있는 경우 `Optional[T]` 또는 `T | None`을 사용한다.

## 데이터 모델

- 데이터 검증 / 직렬화가 필요한 경우 Pydantic `BaseModel`을 사용한다.
- 검증 없이 단순히 데이터를 묶는 경우 `@dataclass`를 사용한다.

## 비동기 처리

- `async/await`는 I/O 바운드 작업 등 실제로 필요한 경우에만 사용한다.
- 동기 코드로 충분하다면 굳이 async를 도입하지 않는다.
- 한 함수 내에서 동기/비동기 방식을 혼용하지 않는다.

## 예외 처리

- `bare except:`는 사용하지 않는다. 반드시 `except Exception as e:` 형태를 사용한다.
- 커스텀 예외 클래스는 객체지향 또는 레이어 단위 구조가 갖춰진 프로젝트 스케일일 때만 도입한다. 간단한 스크립트나 소규모 모듈에서는 내장 예외를 사용한다.

```python
# 소규모: 내장 예외 사용
raise ValueError(f"Invalid user_id: {user_id}")

# 레이어 구조 갖춘 프로젝트: 커스텀 예외
class UserNotFoundError(Exception):
    pass
```

## 파일 구조

파일 내 선언 순서를 아래와 같이 고정한다:

```
1. import
2. 상수
3. 클래스
4. 함수
```
