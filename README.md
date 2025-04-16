# Dotfiles

이 저장소는 개발 환경 설정 파일(dotfiles)을 관리하고 동기화하기 위한 프로젝트입니다. 여러 시스템에서 일관된 개발 환경을 유지하는 데 도움이 됩니다.

## 포함된 설정 파일

- `.zshrc`: Zsh 셸 설정
- `.gitconfig`: Git 사용자 및 기본 설정
- VS Code 설정 (선택적)

## 사용 방법

### 1. 저장소 클론

```bash
git clone https://github.com/DevOpsLab-OZ/dotfiles.git
cd dotfiles
```

### 2. 설치 스크립트 실행

```bash
chmod +x install.sh
./install.sh
```

스크립트는 다음 작업을 수행합니다:
- 기존 설정 파일의 백업 생성
- 저장소의 설정 파일을 사용자의 홈 디렉토리에 심볼릭 링크로 연결
- VS Code 설정 파일이 있는 경우 적용

### 3. 설정 커스터마이징

각 설정 파일을 직접 수정하여 자신의 환경에 맞게 조정하세요:

```bash
# Zsh 설정 수정
nano .zshrc

# Git 설정 수정
nano .gitconfig
```

변경 사항은 저장소에 커밋하여 관리할 수 있습니다:

```bash
git add .zshrc
git commit -m "Update Zsh configuration"
git push
```

## 주요 설정 파일 설명

### .zshrc

Zsh 셸의 환경 설정 파일로, Oh-My-Zsh 프레임워크와 함께 사용됩니다.
- 테마 설정
- 플러그인 구성
- 환경 변수 설정
- 별칭(alias) 정의

### .gitconfig

Git의 전역 설정 파일입니다.
- 사용자 이름 및 이메일 설정
- 기본 브랜치 이름 설정 (main)
- 기본 에디터 설정 (nano)

### VS Code 설정 (선택적)

VS Code의 사용자 설정 파일로, 편집기 동작과 인터페이스를 구성합니다.
- 에디터 설정
- 테마 및 색상 설정
- 코드 포맷팅 옵션

## 다른 시스템에 적용하기

새 시스템에서 동일한 설정을 사용하려면:

1. 저장소 클론
2. `install.sh` 스크립트 실행
3. 필요에 따라 설정 조정

## 설정 업데이트

설정을 업데이트하는 간단한 워크플로우:

1. 설정 파일 직접 수정
2. 변경 사항 커밋 및 푸시
3. 다른 시스템에서 `git pull`로 최신 설정 가져오기

## 문제 해결

- **심볼릭 링크 오류**: 파일 권한 문제가 있는지 확인하세요.
- **기존 설정 충돌**: 백업 디렉토리를 확인하여 이전 설정을 복원할 수 있습니다.
- **설정 변경이 적용되지 않음**: 새 터미널을 열거나 `source ~/.zshrc`를 실행하세요.

## 라이선스

MIT License - 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.
