//hint: hold shift while opening to keep more than 1 open
let ds = [...document.querySelectorAll('details')];
ds.forEach(d => d.addEventListener('click', e => e.shiftKey || ds.filter(i => i != d).forEach(i => i.removeAttribute('open'))))