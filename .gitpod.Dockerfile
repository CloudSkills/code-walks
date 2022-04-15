# Install PowerShell using dotnet
FROM gitpod/workspace-dotnet-lts:latest as powershell-layer

RUN dotnet tool install --global PowerShell

ENV PATH "$PATH:$HOME/.dotnet/tools"

ENV SHELL "pwsh"

# Install AZ PowerShell Module, refer https://github.com/Azure/azure-powershell/blob/main/docker/Dockerfile-ubuntu-18.04
FROM powershell-layer  as azmodule-layer

ARG REPOSITORY=PSGallery
ARG MODULE=Az
ARG CONFIG=config
ARG AZURERM_CONTEXT_SETTINGS=AzureRmContextSettings.json
ARG AZURE=/root/.Azure
ARG VCS_REF="none"
ARG BUILD_DATE=
# refer https://hub.docker.com/_/microsoft-azure-powershell
ARG VERSION=7.4.0  
ARG IMAGE_NAME=mcr.microsoft.com/azure-powershell:${VERSION}-ubuntu-18.04

ENV AZUREPS_HOST_ENVIRONMENT="dockerImage/${VERSION}-ubuntu-18.04"

# install azure-powershell from PSGallery
RUN pwsh -Command Set-PSRepository -Name ${REPOSITORY} -InstallationPolicy Trusted && \
#    pwsh -Command Install-Module -Name ${MODULE} -RequiredVersion ${VERSION} -Scope CurrentUser -Repository ${REPOSITORY} && \
    pwsh -Command Install-Module -Name ${MODULE} -Scope CurrentUser -Repository ${REPOSITORY} && \
#    pwsh -Command Install-Module -Name AzureAD -Scope CurrentUser -Repository ${REPOSITORY} && \
    pwsh -Command Install-Module -Name AzureADPreview -Scope CurrentUser -Repository ${REPOSITORY} && \
    pwsh -Command Set-PSRepository -Name ${REPOSITORY} -InstallationPolicy Untrusted


# create AzureRmContextSettings.json before it was generated
# COPY ${CONFIG}/${AZURERM_CONTEXT_SETTINGS} ${AZURE}/${AZURERM_CONTEXT_SETTINGS}

# install azcli per https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
FROM azmodule-layer AS azcli-layer
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

CMD [ "/home/gitpod/.dotnet/tools/pwsh" ]

## TO TEST
## docker build -f .gitpod.Dockerfile -t gitpod-dockerfile-test .
## docker run -it gitpod-dockerfile-test pwsh