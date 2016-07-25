install common packages:
  pkg.installed:
    - pkgs:
      - mtr
      - htop
      - bash-completion

install editor:
  pkg.installed:
    - pkgs:
      - {{ pillar['editor'] }}
