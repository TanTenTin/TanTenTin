---
model: claude-haiku-4-5-20251001
allowed-tools: Bash(git status *), Bash(git diff *), Bash(git add *), Bash(git commit *), Bash(git log *)
---

현재 세션에서 변경된 파일들을 커밋한다.

## 현재 변경사항

!`git status`

!`git diff`

## 규칙

- 별도 언급이 없으면 이번 세션에서 변경된 파일만 스테이징하고 커밋한다.
- 푸시하지 않는다.
- 커밋 메시지는 Conventional Commits 형식, 본문은 한국어로 작성한다.

## 절차

1. 위 변경사항을 바탕으로 이번 세션 변경분 파일을 `git add`
2. 적절한 커밋 메시지 작성 후 `git commit`
3. `git status`로 결과 확인
