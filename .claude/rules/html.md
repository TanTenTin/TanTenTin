---
paths:
  - "**/*.html"
  - "**/*.htm"
---

# HTML 코딩 규칙

## 들여쓰기

- 탭(tab) 문자를 사용한다.

## 속성(Attribute) 순서

속성은 아래 순서로 작성한다:

1. **구조**: `id`, `name`, `for`, `type`, `src`, `href`, `action`, `method`
2. **스타일**: `class`
3. **동작**: `disabled`, `checked`, `readonly`, `required`, 이벤트 핸들러(`on*`)

```html
<!-- Good -->
<input id="username" name="username" type="text" class="input-field" required>
<a href="/home" class="nav-link" onclick="handleClick()">홈</a>
```

## 시맨틱 마크업

- `div` / `span` 남용을 지양하고, 의미에 맞는 시맨틱 태그를 가능한 한 사용한다.
- 강제하지 않으나, 아래 태그를 적절히 활용한다:

| 태그 | 용도 |
|------|------|
| `header` | 페이지 또는 섹션 상단 |
| `nav` | 내비게이션 링크 모음 |
| `main` | 페이지 주요 콘텐츠 |
| `section` | 주제 단위 콘텐츠 묶음 |
| `article` | 독립적으로 의미 있는 콘텐츠 |
| `footer` | 페이지 또는 섹션 하단 |

## 접근성

- 모든 `<img>` 태그에 `alt` 속성을 반드시 작성한다. 장식용 이미지는 `alt=""`로 명시한다.

```html
<!-- Good -->
<img src="logo.png" alt="서비스 로고">
<img src="divider.png" alt="">
```
