Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My Ubiquiti Network' -Online -FilePath $PSScriptRoot\Example-DiagramsMermeid.html {
    New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
        New-HTMLPanel {
            New-HTMLDiagram {
                New-DiagramOptionsInteraction -Hover $true
                #New-DiagramOptionsManipulation
                New-DiagramNode -Label 'USG Pro' -To 'Unifi Switch' -ImageType circularImage -Image 'https://cdn.imgbin.com/11/23/12/imgbin-ubiquiti-unifi-usg-ubiquiti-networks-router-ubiquiti-unifi-security-gateway-usg-pro-4-network-switch-wan-network-diagram-e1TN4dWJfRB7QnQNiZTDn1aLN.jpg'
                New-DiagramNode -Label 'Unifi Switch' -To 'Unifi AP', 'EvoWin' -ImageType circularImage -Image 'https://cdn.imgbin.com/17/21/14/imgbin-network-switch-power-over-ethernet-gigabit-ethernet-ubiquiti-unifi-switch-ubiquiti-networks-mimosa-network-uQpudFJ4K1UnMMZgzBsniKzyC.jpg'
                New-DiagramNode -Label 'Unifi AP' -To 'EvoMac', 'EvoWin' -ImageType circularImage -Image 'https://cdn.imgbin.com/4/14/3/imgbin-ubiquiti-networks-unifi-ap-ac-lr-wireless-access-points-ubiquiti-unifi-uap-ac-lr-ieee-802-11ac-ac-21pZgwQAbDF4bvA48D5cQgH5h.jpg'
                New-DiagramNode -Label 'EvoMac' -ImageType circularImage -Image 'https://cdn.imgbin.com/1/9/8/imgbin-macbook-ZAe8Jcn7qxxmEgMcSJcV9aWn6.jpg'
                New-DiagramNode -Label 'EvoWin' -To 'Exch1', 'Exch2', 'AD1', 'AD2', 'AD3', 'DC1', 'DC2' -Image 'https://cdn.imgbin.com/20/9/1/imgbin-hyper-v-virtual-security-switch-virtual-machine-network-switch-hypervisor-imran-cpLbwB53FHwHHeQ5h9g081hc4.jpg'
                New-DiagramNode -Label 'Exch1' -Image 'https://cdn.imgbin.com/7/21/22/imgbin-microsoft-exchange-server-exchange-online-microsoft-outlook-office-365-email-email-1k5ceWxjFxVisLpLpxgJLF0Y0.jpg'
                New-DiagramNode -Label 'Exch2' -Image 'https://cdn.imgbin.com/7/21/22/imgbin-microsoft-exchange-server-exchange-online-microsoft-outlook-office-365-email-email-1k5ceWxjFxVisLpLpxgJLF0Y0.jpg'
                New-DiagramNode -Label 'AD1' -Image 'https://cdn.imgbin.com/16/0/25/imgbin-active-directory-directory-service-computer-servers-windows-domain-computer-0MVUs58h9tPqF8nVb8RNxEi5w.jpg'
                New-DiagramNode -Label 'AD2' -Image 'https://cdn.imgbin.com/16/0/25/imgbin-active-directory-directory-service-computer-servers-windows-domain-computer-0MVUs58h9tPqF8nVb8RNxEi5w.jpg'
                New-DiagramNode -Label 'AD3' -ImageType circularImage -Image 'https://cdn.imgbin.com/6/11/3/imgbin-computer-icons-router-cisco-systems-computer-network-network-switch-network-S4pvESiV3pT4EzEjP4sZyc8Rf.jpg'
                New-DiagramNode -Label 'DC1' -Image 'https://cdn.imgbin.com/6/23/7/imgbin-computer-icons-electronics-active-directory-directory-service-others-A8ikiBt9nN77x6EbsXCWTc7M2.jpg'
                New-DiagramNode -Label 'DC2' -Image 'https://cdn.imgbin.com/6/23/7/imgbin-computer-icons-electronics-active-directory-directory-service-others-A8ikiBt9nN77x6EbsXCWTc7M2.jpg'
            } #-BundleImages
        }
        New-HTMLPanel {
            $DomainControllers = Get-WinADForestControllers
            New-HTMLTable -DataTable $DomainControllers
        }
    }
    # Below section isn't really nessecary. I've added it just to show CODE above on HTML page
    New-HTMLSection -HeaderText 'Code used to generate Diagram' {
        # Please notice I'm using it as PowerShell ScriptBlock which gives me formatting, but normally you would use it as a string for other types
        # PowerShell is smart so it will convert ScriptBlock to String so you can have proper code highligts
        New-HTMLCodeBlock -Style powershell -Highlight 2, 5 -Title 'Diagram Example' -Theme enlighter {
            New-HTMLDiagram {
                New-DiagramOptionsInteraction -Hover $true
                #New-DiagramOptionsManipulation
                New-DiagramNode -Label 'USG Pro' -To 'Unifi Switch' -ImageType circularImage -Image 'https://cdn.imgbin.com/11/23/12/imgbin-ubiquiti-unifi-usg-ubiquiti-networks-router-ubiquiti-unifi-security-gateway-usg-pro-4-network-switch-wan-network-diagram-e1TN4dWJfRB7QnQNiZTDn1aLN.jpg'
                New-DiagramNode -Label 'Unifi Switch' -To 'Unifi AP', 'EvoWin' -ImageType circularImage -Image 'https://cdn.imgbin.com/17/21/14/imgbin-network-switch-power-over-ethernet-gigabit-ethernet-ubiquiti-unifi-switch-ubiquiti-networks-mimosa-network-uQpudFJ4K1UnMMZgzBsniKzyC.jpg'
                New-DiagramNode -Label 'Unifi AP' -To 'EvoMac', 'EvoWin' -ImageType circularImage -Image 'https://cdn.imgbin.com/4/14/3/imgbin-ubiquiti-networks-unifi-ap-ac-lr-wireless-access-points-ubiquiti-unifi-uap-ac-lr-ieee-802-11ac-ac-21pZgwQAbDF4bvA48D5cQgH5h.jpg'
                New-DiagramNode -Label 'EvoMac' -ImageType circularImage -Image 'https://cdn.imgbin.com/1/9/8/imgbin-macbook-ZAe8Jcn7qxxmEgMcSJcV9aWn6.jpg'
                New-DiagramNode -Label 'EvoWin' -To 'Exch1', 'Exch2', 'AD1', 'AD2', 'AD3', 'DC1', 'DC2' -Image 'https://cdn.imgbin.com/20/9/1/imgbin-hyper-v-virtual-security-switch-virtual-machine-network-switch-hypervisor-imran-cpLbwB53FHwHHeQ5h9g081hc4.jpg'
                New-DiagramNode -Label 'Exch1' -Image 'https://cdn.imgbin.com/7/21/22/imgbin-microsoft-exchange-server-exchange-online-microsoft-outlook-office-365-email-email-1k5ceWxjFxVisLpLpxgJLF0Y0.jpg'
                New-DiagramNode -Label 'Exch2' -Image 'https://cdn.imgbin.com/7/21/22/imgbin-microsoft-exchange-server-exchange-online-microsoft-outlook-office-365-email-email-1k5ceWxjFxVisLpLpxgJLF0Y0.jpg'
                New-DiagramNode -Label 'AD1' -Image 'https://cdn.imgbin.com/16/0/25/imgbin-active-directory-directory-service-computer-servers-windows-domain-computer-0MVUs58h9tPqF8nVb8RNxEi5w.jpg'
                New-DiagramNode -Label 'AD2' -Image 'https://cdn.imgbin.com/16/0/25/imgbin-active-directory-directory-service-computer-servers-windows-domain-computer-0MVUs58h9tPqF8nVb8RNxEi5w.jpg'
                New-DiagramNode -Label 'AD3' -ImageType circularImage -Image 'https://cdn.imgbin.com/6/11/3/imgbin-computer-icons-router-cisco-systems-computer-network-network-switch-network-S4pvESiV3pT4EzEjP4sZyc8Rf.jpg'
                New-DiagramNode -Label 'DC1' -Image 'https://cdn.imgbin.com/6/23/7/imgbin-computer-icons-electronics-active-directory-directory-service-others-A8ikiBt9nN77x6EbsXCWTc7M2.jpg'
                New-DiagramNode -Label 'DC2' -Image 'https://cdn.imgbin.com/6/23/7/imgbin-computer-icons-electronics-active-directory-directory-service-others-A8ikiBt9nN77x6EbsXCWTc7M2.jpg'
            } #-BundleImages
        }
    }

    New-HTMLSection -HeaderText 'Test Me' {
        New-HTMLMermeid {
            @'
            graph TD
            A[Client] --> B[Load Balancer]
            B --> C[Server1]
            B --> D[Server2]
'@
        }
        New-HTMLMermeid {
            @"
sequenceDiagram
Alice->>John: Hello John, how are you?
loop Healthcheck
    John->>John: Fight against hypochondria
end
Note right of John: Rational thoughts!
John-->>Alice: Great!
John->>Bob: How about you?
Bob-->>John: Jolly good!
"@
        }
        New-HTMLMermeid {
            "---"
            "title: Hello Ello"
            "config:"
            "    fontSize: 30"
            "    theme: dark"
            "    darkmode: true"
            "    themeVariables:"
            "        primaryColor: '#BB2528'"
            "        primaryTextColor: '#fff'"
            "        primaryBorderColor: '#7C0000'"
            "        lineColor: '#F8B229'"
            "        secondaryColor: '#006100'"
            "        tertiaryColor: '#fff'"
            "---"
            'quadrantChart'
            'title Reach and engagement of campaigns'
            'x-axis Low Reach --> High Reach'
            'y-axis Low Engagement --> High Engagement'
            'quadrant-1 We should expand'
            'quadrant-2 Need to promote'
            'quadrant-3 Re-evaluate'
            'quadrant-4 May be improved'
            'Campaign A: [0.3, 0.6]'
            'Campaign B: [0.45, 0.23]'
            'Campaign C: [0.57, 0.69]'
            'Campaign D: [0.78, 0.34]'
            'Campaign E: [0.40, 0.34]'
            'Campaign F: [0.35, 0.78]'
        }
    }
} -ShowHTML

<#
                            ---
                            title: Hello Ello
                            config:
                                theme: dark
                                darkmode: true
                                themeVariables:
                                    primaryColor: '#BB2528'
                                    primaryTextColor: '#fff'
                                    primaryBorderColor: '#7C0000'
                                    lineColor: '#F8B229'
                                    secondaryColor: '#006100'
                                    tertiaryColor: '#fff'
                            ---
#>

<#
           <script>
                var config = {
                    startOnLoad: true,
                    theme: 'dark',
                    darkMode: true,
                    useMaxWidth: true,
                    maxWidth: 200,
                        htmlLabels: true,
                    fontSize: 15,
                    flowchart: {

                    }
                };
                mermaid.initialize(config);
            </script>
#>