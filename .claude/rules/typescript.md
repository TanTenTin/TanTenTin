---
paths:
  - "**/*.ts"
  - "**/*.tsx"
---

# TypeScript 코딩 규칙

## tsconfig

- `strict: true` 를 반드시 설정한다. 개별 strict 옵션을 따로 켜는 방식을 사용하지 않는다.

## 타입 정의

- 타입 정의는 `type alias` 대신 `interface`를 사용한다. (함수 시그니처, 유니온/인터섹션 표현 등 interface로 표현 불가한 경우만 `type` 허용)
- `any` 사용을 금지한다. 타입 불명확 시 `unknown`을 사용하고, 타입 가드나 narrowing으로 좁힌다.
- `enum` 대신 `as const`를 사용한다.

```ts
// Bad
enum Direction { Up, Down }

// Good
const Direction = { Up: 'UP', Down: 'DOWN' } as const;
type Direction = typeof Direction[keyof typeof Direction];
```

- 재사용 가능한 로직은 Generic으로 추상화한다.
- `Partial`, `Pick`, `Omit`, `Required`, `Readonly` 등 내장 Utility Types를 적극 활용한다.

## 함수

- 함수 선언은 `function` 키워드를 사용한다. 화살표 함수는 콜백이나 인라인 표현에 한정한다.
- 모든 함수의 반환 타입을 명시한다. TypeScript가 추론 가능한 경우에도 생략하지 않는다.

```ts
// Bad
function getUser(id: string) {
  return db.find(id);
}

// Good
function getUser(id: string): Promise<User> {
  return db.find(id);
}
```

## 비동기 처리

- `async/await`와 Promise chain(`.then`/`.catch`) 혼용을 허용한다.
- 단, 한 함수 내에서 두 방식을 섞어 쓰지 않는다. 일관성 있게 하나만 선택한다.

## Import / Export

- `default export` 대신 `named export`를 사용한다.

```ts
// Bad
export default function fetchUser() { ... }

// Good
export function fetchUser() { ... }
```

## 파일 구조

파일 내 선언 순서를 아래와 같이 고정한다:

```
1. import
2. 타입 (interface, type)  ← 원칙적으로 별도 파일로 분리
3. 상수
4. 함수 / 클래스
```

타입 정의는 `*.types.ts` 또는 `types.ts` 파일로 분리하는 것을 원칙으로 한다.  
단순하거나 해당 파일 전용 타입은 같은 파일 상단에 두어도 무방하다.
