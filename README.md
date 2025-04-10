# Dotfiles

개인 개발 환경 설정 파일들을 관리하는 저장소입니다. 여러 컴퓨터에서 동일한 개발 환경을 쉽게 구성할 수 있도록 도와줍니다.

## 구성 요소

- `.zshrc`: Zsh 쉘 설정
- `.gitconfig`: Git 설정
- `.vscode/`: VS Code 설정 및 단축키 (있는 경우)

## 설치 방법

1. 저장소 클론:
```bash
git clone https://github.com/DevOpsLab-OZ/dotfiles.git
cd dotfiles
```

2. 설치 스크립트 실행:
```bash
# 실행 권한 부여
chmod +x install.sh

# 스크립트 실행
./install.sh
```

설치 스크립트는 심볼릭 링크를 생성하여 홈 디렉토리에 설정 파일들을 연결합니다.

## 설정 사용자화

필요에 따라 설정 파일들을 수정하세요:

### Zsh 테마 변경
`.zshrc` 파일에서 `ZSH_THEME` 값을 변경합니다:
```bash
ZSH_THEME="robbyrussell"  # 기본 테마
# ZSH_THEME="agnoster"    # 다른 테마로 변경
```

### Git 사용자 정보 설정
`.gitconfig` 파일에서 사용자 정보를 변경합니다:
```
[user]
    name = 당신의 이름
    email = 당신의이메일@example.com
```

## 설정 업데이트

로컬에서 설정 파일을 변경한 후 저장소에 반영하려면:

```bash
# 변경된 설정 파일 확인
cd ~/dotfiles
git status

# 변경사항 추가 및 커밋
git add .
git commit -m "설정 파일 업데이트"

# 원격 저장소에 푸시
git push
```

## 새 컴퓨터에서 설정 복원

새 컴퓨터에서 설정을 복원하려면 저장소를 클론하고 설치 스크립트를 실행하세요:

```bash
git clone https://github.com/사용자이름/dotfiles.git
cd dotfiles
./install.sh
```

## 참고 자료

- [Zsh 문서](https://zsh.sourceforge.io/Doc/)
- [Oh-My-Zsh 테마](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
- [Git 설정 문서](https://git-scm.com/docs/git-config)
- [Dotfiles 모범 사례](https://dotfiles.github.io/)
