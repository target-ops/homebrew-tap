# homebrew-tap

Public tap for target-ops tools. Installing with the full name adds the tap by itself, no
`brew tap` needed:

```
brew install target-ops/tap/<formula>    # for example target-ops/tap/gitswitch or target-ops/tap/mi-lakach
brew upgrade <formula>
```

## Mi-Lakach

Household money (bank and credit cards in one picture) on your own computer, with Docker:

```
brew install target-ops/tap/mi-lakach
mi-lakach install
```

Linux, or Windows with WSL (no Homebrew needed):

```
curl -fsSL https://mi-lakach.target-ops.io/install.sh | bash
```
