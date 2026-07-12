# OpenCode 설정

이 폴더는 [OpenCode](https://opencode.ai) 유저 설정을 버전 관리하기 위한 템플릿입니다.

실제 설정 파일(`opencode.jsonc`)은 API 키 등 민감 정보를 담고 있어 이 레포(public)에는
커밋하지 않습니다. 대신 `opencode.jsonc.example`을 템플릿으로 관리합니다.

## 사용법

1. `opencode.jsonc.example`을 `~/.config/opencode/opencode.jsonc`로 복사
2. `apiKey` 값을 실제 게이트웨이 API 키로 교체
3. 필요하면 모델/프로바이더 설정 조정

## 참고

- `watcher.ignore`에 `.claude`, `CLAUDE.md`를 넣어 OpenCode가 Claude Code 전용 문서를
  컨텍스트로 읽지 않도록 분리했습니다.
- 반대로 Claude Code 쪽에서는 `.claude/settings.json`의 `permissions.deny`에
  `.opencode/**`를 추가해 OpenCode 전용 문서를 읽지 않도록 분리했습니다.
