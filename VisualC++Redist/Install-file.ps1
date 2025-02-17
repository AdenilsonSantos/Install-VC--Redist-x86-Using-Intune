# Script para desinstalar todas as versões do VC_redist_x64 e instalar a versão mais recente

# Variável para o caminho do instalador do 7-Zip
$zipInstallerPath = "VC_redist_x86.exe"
$ScriptPath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)

#Função para desinstalar o VC_redist_x86 EXE
function Uninstall-VC_redist_x86-Exe {
    $product = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name LIKE '%Microsoft Visual C++%' AND Name LIKE '%x86%'"
   $productName = $product.Name
   Uninstall-Package -Name $productName -Force
}

# Função para instalar a versão mais recente do VC_redist_x86
function Install-VC_redist_x86-Exe {
    Start-Process -FilePath "$ScriptPath\$zipInstallerPath" -ArgumentList "/install", "/quiet", "/norestart" -Wait
}

# Desinstalar o VC_redist_x86 EXE
Uninstall-VC_redist_x86-Exe


# Instalar a versão mais recente do VC_redist_x86 Exe
Install-VC_redist_x86-Exe
