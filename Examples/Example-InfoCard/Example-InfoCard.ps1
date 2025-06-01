Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    # Standard Style Cards - using New-HTMLPanel structure
    New-HTMLSection -HeaderText "Standard Style" {
        New-HTMLSection -Invisible {
            New-HTMLInfoCard -Title "Total Users" -Number 47 -Subtitle "21.28% of users" -Icon "👥" -IconColor Akaroa
            New-HTMLInfoCard -Title "MFA Capable Users" -Number 10 -Subtitle "21.28% of users" -Icon "🔒" -IconColor "#21c87a"
            New-HTMLInfoCard -Title "Strong Auth Methods" -Number 8 -Subtitle "17.02% of users" -Icon "💪" -IconColor "#ffb300"
            New-HTMLInfoCard -Title "Passwordless Capable" -Number 2 -Subtitle "4.26% of users" -Icon "🔑" -IconColor "#d13438"
        }
    }

    # Compact Style Cards
    New-HTMLSection -HeaderText "Compact Style" {
        New-HTMLSection -Invisible {
            New-HTMLInfoCard -Title "Server CPU" -Number "85%" -Subtitle "Usage" -IconFromDictionary "Server" -IconColor "#0078d4" -Style "Compact"
            New-HTMLInfoCard -Title "Memory" -Number "12GB" -Subtitle "Available" -IconFromDictionary "Database" -IconColor "#21c87a" -Style "Compact"
            New-HTMLInfoCard -Title "Storage" -Number "500GB" -Subtitle "Free space" -IconFromDictionary "Cloud" -IconColor "#ffb300" -Style "Compact"
            New-HTMLInfoCard -Title "Network" -Number "1.2Gbps" -Subtitle "Throughput" -IconFromDictionary "Network" -IconColor "#d13438" -Style "Compact"
        }
    }

    # Fixed Layout Style (Multiline Safe)
    New-HTMLSection -HeaderText "Fixed Layout (Multiline Safe)" {
        New-HTMLSection -Invisible {
            New-HTMLInfoCard -Title "Total Users with Very Long Title That Wraps" -Number 47 -Subtitle "21.28% of users" -IconFromDictionary "Users" -IconColor "#0078d4" -Style "Fixed"
            New-HTMLInfoCard -Title "MFA Capable Users" -Number 10 -Subtitle "21.28% of users" -IconFromDictionary "Lock" -IconColor "#21c87a" -Style "Fixed"
            New-HTMLInfoCard -Title "Strong Authentication Methods Available" -Number 8 -Subtitle "17.02% of users" -Icon "💪" -IconColor "#ffb300" -Style "Fixed"
            New-HTMLInfoCard -Title "Passwordless Capable" -Number 2 -Subtitle "4.26% of users" -IconFromDictionary "Key" -IconColor "#d13438" -Style "Fixed"
        }
    }

    # Classic Style Cards
    New-HTMLSection -HeaderText "Classic Style" {
        New-HTMLSection -Invisible {
            New-HTMLInfoCard -Title "132 Sales" -Number "" -Subtitle "12 waiting payments" -IconFromDictionary Money -IconColor "#0078d4" -Style "Classic"
            New-HTMLInfoCard -Title "98 Completed" -Number "" -Subtitle "Tasks finished today" -IconFromDictionary "Check" -IconColor "#21c87a" -Style "Classic"
            New-HTMLInfoCard -Title "5 Pending" -Number "" -Subtitle "Requires attention" -IconFromDictionary "Warning" -IconColor "#ffb300" -Style "Classic"
        }
    }

    # No Icon Style Cards
    New-HTMLSection -HeaderText "No Icons Style" {
        New-HTMLSection -Invisible {
            New-HTMLInfoCard -Title "Revenue" -Number "`$45,320" -Subtitle "This month" -Style "NoIcon" -NumberColor "#21c87a"
            New-HTMLInfoCard -Title "Orders" -Number "1,234" -Subtitle "Processed today" -Style "NoIcon" -NumberColor "#0078d4"
            New-HTMLInfoCard -Title "Customers" -Number "5,678" -Subtitle "Active users" -Style "NoIcon" -NumberColor "#ffb300"
        }
    }

    # Using FontAwesome Icons
    New-HTMLSection -HeaderText "FontAwesome Icons" {
        New-HTMLSection -Invisible {
            New-HTMLInfoCard -Title "Analytics Report" -Number 156 -Subtitle "Reports generated" -IconSolid "chart-bar" -IconColor "#6f42c1"
            New-HTMLInfoCard -Title "Security Status" -Number "99.9%" -Subtitle "Uptime" -IconSolid "shield-alt" -IconColor "#28a745"
            New-HTMLInfoCard -Title "API Calls" -Number "2.3M" -Subtitle "This week" -IconSolid "plug" -IconColor "#17a2b8"
            New-HTMLInfoCard -Title "Sync Status" -Number "Active" -Subtitle "Last sync: 2 min ago" -IconSolid "sync-alt" -IconColor "#ffc107"
        }
    }

    # Using Icon Dictionary
    New-HTMLSection -HeaderText "Using Icon Dictionary" {
        New-HTMLSection -Invisible {
            New-HTMLInfoCard -Title "Analytics Report" -Number 156 -Subtitle "Reports generated" -IconFromDictionary "Chart" -IconColor "#6f42c1"
            New-HTMLInfoCard -Title "Security Status" -Number "99.9%" -Subtitle "Uptime" -IconFromDictionary "Shield" -IconColor "#28a745"
            New-HTMLInfoCard -Title "API Calls" -Number "2.3M" -Subtitle "This week" -IconFromDictionary "Api" -IconColor "#17a2b8"
            New-HTMLInfoCard -Title "Sync Status" -Number "Active" -Subtitle "Last sync: 2 min ago" -IconFromDictionary "Sync" -IconColor "#ffc107"
        }
    }
} -FilePath "$PSScriptRoot\Example-InfoCard.html" -Online -Show