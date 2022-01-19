FROM gitpod/workspace-dotnet-lts:latest

RUN dotnet tool install --global PowerShell

CMD [ "pwsh" ]