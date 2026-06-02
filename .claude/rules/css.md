---
paths:
  - "**/*.css"
  - "**/*.module.css"
---

# CSS 코딩 규칙

## 들여쓰기

- 탭(tab) 문자를 사용한다.

## 사용 방식

이 프로젝트에서는 아래 CSS 방식을 혼용한다:

- **일반 CSS**: 전역 스타일, 리셋, CSS 변수 정의
- **CSS Modules** (`*.module.css`): 컴포넌트 단위 스코프 스타일
- **Tailwind CSS**: 유틸리티 클래스 기반 인라인 스타일링

## 선택자(Selector)

- `#id` 선택자 사용을 지양한다. 스타일링에는 class를 사용한다.
  - ID는 앵커 링크나 JavaScript 접근 용도로만 사용한다.

```css
/* Bad */
#submit-button { ... }

/* Good */
.submit-button { ... }
```

## 속성 선언 순서

속성은 아래 순서로 선언한다:

1. **레이아웃**: `display`, `position`, `top`, `right`, `bottom`, `left`, `z-index`, `float`, `flex`, `grid` 관련
2. **박스**: `width`, `height`, `margin`, `padding`, `border`, `box-sizing`, `overflow`
3. **타이포그래피**: `font-*`, `line-height`, `letter-spacing`, `text-*`, `color`
4. **시각**: `background`, `opacity`, `visibility`, `cursor`, `transition`, `animation`, `transform`

```css
/* Good */
.card {
	/* 레이아웃 */
	display: flex;
	position: relative;
	/* 박스 */
	width: 100%;
	padding: 16px;
	border: 1px solid #eee;
	/* 타이포그래피 */
	font-size: 14px;
	color: #333;
	/* 시각 */
	background: #fff;
	border-radius: 8px;
}
```
