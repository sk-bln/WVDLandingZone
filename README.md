# WVDLandingZone - a secure landing zone for Windows Virtual Desktop and Citrix Cloud in Azure

## General structure

Hub VNet
- Gateway Subnet with VPN Gateway
- DMZ Subnet with Azure Firewall as a breakout to Azure PaaS services, monitoring and (optional) internet
- Bastion Subnet with Azure Bastion for accessing internal VMs
- AD subnet with 2 AD Domain Controllers (are also DNS servers) and (optional) Azure AD Connect for AAD Synchronization

VDI Vnet
- Infrastructure Subnet with File Server (synced to Azure Files with Azure File Sync)
- Connector Subnet with Citrix Cloud Connectors (if required)
- VDI Subnet with the actual VDI/WVD instances
