#IISSiteName is the name of the site in IIS
$IISSiteName="sub.domain.com"
#IISURL is the URL you want to add a binding for
$IISURL="sub.domain.com"

#Get current site bindings. You can use filters for ports, SSL Flags
Get-IISSiteBinding $IISSiteName # "*:80:" "*:443:"
 
#Creates the HTTPS Binding with SSL FLag 1 for SNI
New-WebBinding -Name $InternalSite -sslFlags 1 -Protocol https -IP * -Port 443 -HostHeader $IISURL
#Creates the HTTP that is necessary to create HTTP Rewrite rules to redirect non HTTPS requests
New-WebBinding -Name $InternalSite -Protocol http -IP * -Port 80 -HostHeader $IISURL