Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -HeaderText 'Test' {
        New-HTMLPanel {
            New-HTMLList -Type Ordered {
                New-HTMLListItem -Text 'Test 1'
                New-HTMLListItem -Text 'Test 2'
                New-HTMLListItem -Text 'Test Nested' -Color Blue {
                    New-HTMLList -Type Unordered {
                        New-HTMLListItem -Text 'Test 3'
                        New-HTMLListItem -Text 'Test 4'
                        New-HTMLListItem -Text 'Test 5'
                    }
                }
            } -Color Red -Reversed
        }
        New-HTMLPanel {
            New-HTMLList -Type Unordered {
                New-HTMLListItem -Text 'Coffe'
                New-HTMLListItem -Text 'Tea' {
                    New-HTMLList -Type Unordered {
                        New-HTMLListItem -Text 'Black Tea'
                        New-HTMLListItem -Text 'Green Tea'
                    }
                }
                New-HTMLListItem -Text 'Milk'
            }
        }
    }
} -FilePath $PSScriptRoot\Example-Lists01.html -ShowHTML -Online

# http://www.scriptingmaster.com/html/unordered-list.asp
# https://css-tricks.com/list-style-recipes/

# https://www.geeksforgeeks.org/css-list-style-type-property/
<#
list-style-type: disc|circle|square|decimal|lower-roman|upper-roman|
lower-greek|lower-latin|upper-latin|lower-alpha|upper-alpha|none|
inherit;
#>
# https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type
<#
/* Partial list of types */
list-style-type: disc;
list-style-type: circle;
list-style-type: square;
list-style-type: decimal;
list-style-type: georgian;
list-style-type: trad-chinese-informal;
list-style-type: kannada;

/* <string> value */
list-style-type: '-';

/* Identifier matching an @counter-style rule */
list-style-type: custom-counter-style;

/* Keyword value */
list-style-type: none;

/* Global values */
list-style-type: inherit;
list-style-type: initial;
list-style-type: unset;

#>

<#
<style>
ul {
  list-style: none; /* Remove HTML bullets */
  padding: 0;
  margin: 0;
}

li {
  padding-left: 16px;
}

li::before {
  content: "•"; /* Insert content that looks like bullets */
  padding-right: 8px;
  color: blue; /* Or a color you prefer */
}
</style>
#>

<#
            ul {
                list-style: none;
            }

            ul li::before {
                content: "";
                background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/3/fb-heart.gif);
                background-size: contain;
                display: inline-block;
                width: 1em;
                height: 1em;
                position: relative;
                top: 0.1rem;
                margin-right: 0.2rem;
            }

#>

<#
<style>
ul.a {list-style-type: circle;}
ul.b {list-style-type: disc;}
ul.c {list-style-type: square;}
ol.d {list-style-type: armenian;}
ol.e {list-style-type: cjk-ideographic;}
ol.f {list-style-type: decimal;}
ol.g {list-style-type: decimal-leading-zero;}
ol.h {list-style-type: georgian;}
ol.i {list-style-type: hebrew;}
ol.j {list-style-type: hiragana;}
ol.k {list-style-type: hiragana-iroha;}
ol.l {list-style-type: katakana;}
ol.m {list-style-type: katakana-iroha;}
ol.n {list-style-type: lower-alpha;}
ol.o {list-style-type: lower-greek;}
ol.p {list-style-type: lower-latin;}
ol.q {list-style-type: lower-roman;}
ol.r {list-style-type: upper-alpha;}
ol.s {list-style-type: upper-greek;}
ol.t {list-style-type: upper-latin;}
ol.u {list-style-type: upper-roman;}
ol.v {list-style-type: none;}
ol.w {list-style-type: inherit;}
</style>
#>