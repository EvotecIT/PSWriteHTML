Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select -First 2

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseJavaScriptLinks:$true {


    New-HTMLColumn -Columns 1 {
        @"
<div class="timeline">
<div class="entry">
    <div class="title">
        <h3>2014 - Present</h3>
        <p>Title, Company</p>
    </div>
    <div class="body">
        <p>
            Voluptatibus veniam ea reprehenderit atque reiciendis
            non laborum adipisci ipsa pariatur omnis.
        </p>
        <ul>
            <li>Rerum sit libero possimus amet excepturi</li>
            <li>
                Exercitationem enim dolores sunt praesentium dolorum
                praesentium
            </li>
            <li>
                Modi aut dolores dignissimos sequi sit ut aliquid
                molestias deserunt illo
            </li>
        </ul>
    </div>
</div>
<div class="entry">
    <div class="title">
        <h3>2010 - Present</h3>
        <p>Title, Company</p>
    </div>
    <div class="body">
        <p>
            Voluptatibus veniam ea reprehenderit atque reiciendis
            non laborum adipisci ipsa pariatur omnis.
        </p>
        <ul>
            <li>Rerum sit libero possimus amet excepturi</li>
            <li>
                Exercitationem enim dolores sunt praesentium dolorum
                praesentium
            </li>
            <li>
                Modi aut dolores dignissimos sequi sit ut aliquid
                molestias deserunt illo
            </li>
        </ul>
    </div>
</div>
<div class="entry">
    <div class="title">
        <h3>2009 - 2010</h3>
        <p>Title, Company</p>
    </div>
    <div class="body">
        <p>
            Voluptatibus veniam ea reprehenderit atque reiciendis
            non laborum adipisci ipsa pariatur omnis.
        </p>
        <ul>
            <li>Rerum sit libero possimus amet excepturi</li>
            <li>
                Exercitationem enim dolores sunt praesentium dolorum
                praesentium
            </li>
            <li>
                Modi aut dolores dignissimos sequi sit ut aliquid
                molestias deserunt illo
            </li>
        </ul>
    </div>
</div>
<div class="entry">
    <div class="title">
        <h3>2006 - 2008</h3>
        <p>Title, Company</p>
    </div>
    <div class="body">
        <p>
            Voluptatibus veniam ea reprehenderit atque reiciendis
            non laborum adipisci ipsa pariatur omnis.
        </p>
        <ul>
            <li>Rerum sit libero possimus amet excepturi</li>
            <li>
                Exercitationem enim dolores sunt praesentium dolorum
                praesentium
            </li>
            <li>
                Modi aut dolores dignissimos sequi sit ut aliquid
                molestias deserunt illo
            </li>
        </ul>
    </div>
</div>
</div>

"@
    }  

    New-HTMLColumn {

@"
<section id="cd-timeline" class="cd-container">
<div class="cd-timeline-block">
    <div class="cd-timeline-img cd-picture"></div>

    <div class="cd-timeline-content">
        <h2>Penta Consulting</h2>
        <div class="timeline-content-info">
            <span class="timeline-content-info-title">
                <i class="fa fa-certificate" aria-hidden="true"></i>
                Front End Developer
            </span>
            <span class="timeline-content-info-date">
                <i class="fa fa-calendar-o" aria-hidden="true"></i>
                June 2016 - Present
            </span>
        </div>
        <p>
            Working alongside the designer team implementing the
            designs, also developing custom solutions to address
            team necessities.
        </p>
        <ul class="content-skills">
            <li>HTML5</li>
            <li>CSS3</li>
            <li>JavaScript</li>
            <li>jQuery</li>
            <li>Wordpress</li>
        </ul>
    </div>
    <!-- cd-timeline-content -->
</div>
<!-- cd-timeline-block -->

<div class="cd-timeline-block">
    <div class="cd-timeline-img cd-movie"></div>
    <!-- cd-timeline-img -->

    <div class="cd-timeline-content">
        <h2>Title of section 2</h2>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing
            elit. Iusto, optio, dolorum provident rerum aut hic
            quasi placeat iure tempora laudantium ipsa ad debitis
            unde?
        </p>
        <span class="cd-date">Jan 18</span>
    </div>
    <!-- cd-timeline-content -->
</div>
<!-- cd-timeline-block -->

<div class="cd-timeline-block">
    <div class="cd-timeline-img cd-picture"></div>
    <!-- cd-timeline-img -->

    <div class="cd-timeline-content">
        <h2>Title of section 3</h2>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing
            elit. Excepturi, obcaecati, quisquam id molestias eaque
            asperiores voluptatibus cupiditate error assumenda
            delectus odit similique earum voluptatem doloremque
            dolorem ipsam quae rerum quis. Odit, itaque, deserunt
            corporis vero ipsum nisi eius odio natus ullam provident
            pariatur temporibus quia eos repellat consequuntur
            perferendis enim amet quae quasi repudiandae sed quod
            veniam dolore possimus rem voluptatum eveniet eligendi
            quis fugiat aliquam sunt similique aut adipisci.
        </p>
        <span class="cd-date">Jan 24</span>
    </div>
    <!-- cd-timeline-content -->
</div>
<!-- cd-timeline-block -->

<div class="cd-timeline-block">
    <div class="cd-timeline-img cd-location"></div>
    <!-- cd-timeline-img -->

    <div class="cd-timeline-content">
        <h2>Title of section 4</h2>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing
            elit. Iusto, optio, dolorum provident rerum aut hic
            quasi placeat iure tempora laudantium ipsa ad debitis
            unde? Iste voluptatibus minus veritatis qui ut.
        </p>
        <span class="cd-date">Feb 14</span>
    </div>
    <!-- cd-timeline-content -->
</div>
<!-- cd-timeline-block -->

<div class="cd-timeline-block">
    <div class="cd-timeline-img cd-location"></div>

    <div class="cd-timeline-content">
        <h2>Title of section 5</h2>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing
            elit. Iusto, optio, dolorum provident rerum.
        </p>
        <span class="cd-date">Feb 18</span>
    </div>
    <!-- cd-timeline-content -->
</div>
<!-- cd-timeline-block -->

<div class="cd-timeline-block">
    <div class="cd-timeline-img cd-movie"></div>
    <!-- cd-timeline-img -->

    <div class="cd-timeline-content">
        <h2>Final Section</h2>
        <p>This is the content of the last section</p>
        <span class="cd-date">Feb 26</span>
    </div>
    <!-- cd-timeline-content -->
</div>
<!-- cd-timeline-block -->
</section>
<!-- cd-timeline -->

"@
    }

}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example14\Example14.html'