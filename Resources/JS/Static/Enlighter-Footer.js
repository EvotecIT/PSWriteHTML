// INIT CODE - simple page-wide initialization based on css selectors
// - highlight all pre + code tags (CSS3 selectors)
// - use javascript as default language
// - use theme "enlighter" as default theme
// - replace tabs with 2 spaces
EnlighterJS.init("pre", "code", {
    language: "powershell",
    theme: "enlighter",
    indent: 2
});