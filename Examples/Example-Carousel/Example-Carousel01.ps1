Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Name 'Test' -FilePath "$PSScriptRoot\Example-Carousel01.html" -Show {
    New-HTMLCarousel {
        New-CarouselSlide {
            New-HTMLText -Text 'Slide 1'
        }
        New-CarouselSlide {
            New-HTMLText -Text 'Slide 2'
        }
    }

} -Online -Format