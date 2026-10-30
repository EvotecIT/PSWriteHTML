// Navigation and accessibility for PSWriteHTML's existing tabbis integration.
(function () {
    function sync(group) {
        group.setAttribute('role', 'tablist');
        Array.prototype.forEach.call(group.children, function (tab) {
            var selected = tab.classList.contains('active');
            tab.setAttribute('role', 'tab');
            tab.setAttribute('tabindex', selected ? '0' : '-1');
            tab.setAttribute('aria-selected', String(selected));
            tab.setAttribute('aria-controls', tab.id + '-Content');
            var pane = document.getElementById(tab.id + '-Content');
            if (pane) {
                pane.setAttribute('role', 'tabpanel');
                pane.setAttribute('aria-labelledby', tab.id);
            }
        });
    }
    function revealHash() {
        var id;
        try { id = decodeURIComponent(location.hash.slice(1)); } catch (error) { return; }
        var target = document.getElementById(id);
        if (!target) { return; }
        var pane = target.closest('[data-panes] > div');
        var parents = [];
        while (pane) {
            var tab = document.getElementById(pane.id.replace(/-Content$/, ''));
            if (tab && tab.parentElement.hasAttribute('data-tabs')) { parents.unshift(tab); }
            pane = pane.parentElement.parentElement.closest('[data-panes] > div');
        }
        parents.forEach(function (tab) { tab.click(); sync(tab.parentElement); });
        if (target.parentElement && target.parentElement.hasAttribute('data-tabs')) {
            target.click();
            sync(target.parentElement);
        }
    }
    function ready() {
        document.querySelectorAll('[data-tabs]').forEach(function (group) {
            sync(group);
            group.addEventListener('click', function () { setTimeout(function () { sync(group); }, 0); });
            group.addEventListener('keydown', function (event) {
                var tabs = Array.prototype.slice.call(group.children);
                var index = tabs.indexOf(document.activeElement);
                if (index < 0) { return; }
                if (event.key === 'ArrowRight' || event.key === 'ArrowDown') { index = (index + 1) % tabs.length; }
                else if (event.key === 'ArrowLeft' || event.key === 'ArrowUp') { index = (index + tabs.length - 1) % tabs.length; }
                else if (event.key === 'Home') { index = 0; }
                else if (event.key === 'End') { index = tabs.length - 1; }
                else if (event.key !== 'Enter' && event.key !== ' ') { return; }
                event.preventDefault();
                tabs[index].click();
                tabs[index].focus();
                sync(group);
            });
        });
        // Apply deep links after the library and authored default-tab handlers.
        setTimeout(function () {
            document.querySelectorAll('[data-tabs]').forEach(sync);
            revealHash();
        }, 0);
        window.addEventListener('hashchange', revealHash);
    }
    if (document.readyState === 'loading') { document.addEventListener('DOMContentLoaded', ready); }
    else { ready(); }
})();
