﻿(Get-UnifiedGroupLinks "All Chapter Mailboxes" -LinkType member).UserPrincipalName | Export-Csv c:\temp\test.csv