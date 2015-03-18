The intent for this was a small PowerShell script which called makecert.exe and pvk2pfx for 
creating self-signed certificates for use in IIS and a remote desktop gateway.

However, I wasn't able to get it working in a timely manner. It would import properly into the RD Gateway,
but would not work when trying to add to the IIS Reverse Proxy.

Why would I be using a Reverse Proxy in front of a RD Gateway Server? That's a good question at this point.

Note: makecert.exe and pvk2pfx.exe are property of Microsoft, includes from the Windows 8.1 SDK installed via Chocolatey.
