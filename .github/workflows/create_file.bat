name: Create File on Windows Desktop

on:
  push:
    branches:
      - main

jobs:
  create-file:
    runs-on: windows-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Run script on VM
      shell: powershell
      run: |
        $Username = "${{ secrets.VM_USERNAME }}"
        $Password = ConvertTo-SecureString "${{ secrets.VM_PASSWORD }}" -AsPlainText -Force
        $Credential = New-Object System.Management.Automation.PSCredential($Username, $Password)
        $Session = New-PSSession -ComputerName "${{ secrets.VM_HOST }}" -Credential $Credential

        Invoke-Command -Session $Session -ScriptBlock {
          param($ScriptPath)
          Start-Process -FilePath $ScriptPath -Wait
        } -ArgumentList "C:\path\to\your\script.bat"

        Remove-PSSession -Session $Session
