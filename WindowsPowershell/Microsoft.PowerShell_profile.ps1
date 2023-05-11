Import-Module posh-git
Import-Module oh-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/xtoys.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/material.omp.json" | Invoke-Expression
Set-PSReadLineOption -EditMode Emacs
