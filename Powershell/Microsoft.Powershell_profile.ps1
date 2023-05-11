Import-Module posh-git
Import-Module oh-my-posh
# Set-PoshPrompt -Theme material
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/stelbent-compact.minimal.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/robbyrussell.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/kali.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/emodipt.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/darkblood.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/material.omp.json" | Invoke-Expression
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
#REMEMBER: powershell is case-insensitive.

# Default editing mode to EMACs
Set-PSReadLineOption -EditMode Emacs

# EMACS on terminal [terminal daemon and client setup is not possible in windows]
function Run-Emacs {
    & "C:\Program Files\Emacs\emacs-28.2\bin\emacs.exe" -nw $args
}
Set-Alias -Name emt -Value Run-Emacs -Option AllScope

# As on WINDOWS11 run emacs daemon on graphical frame.. client frames should be graphical
function Emacs-Client-W {
    & "C:\Program Files\Emacs\emacs-28.2\bin\emacsclientw.exe" -c $args
}
Set-Alias -Name emc -Value Emacs-Client-W -Option AllScope

# get-help customization
$PSDefaultParameterValues['Get-Help:Full'] = $true
set-alias -name gh -Value get-help -option allscope

# vi to nvim mapping
set-alias -name vi -Value nvim -option allscope
