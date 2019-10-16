$(document).ready(function() {
    var collapsedGroups = {};

       var table = $('#example').DataTable({
         order: [[2, 'asc']],
         rowGroup: {
           // Uses the 'row group' plugin
           dataSrc: 2,
    startRender: function (rows, group) {
       var collapsed = !!collapsedGroups[group];

       rows.nodes().each(function (r) {
           r.style.display = collapsed ? 'none' : '';
       });

       var toggleClass = collapsed ? 'fa-plus-square' : 'fa-minus-square';

       // Add group name to <tr>
       return $('<tr/>')
           .append('<td colspan="' + rows.columns()[0].length +'">' + '<span class="fa fa-fw ' + toggleClass + ' toggler"/> ' + group + ' (' + rows.count() + ')</td>')
           .attr('data-name', group)
           .toggleClass('collapsed', collapsed);
   },
         }
       });

      $('#example tbody').on('click', 'tr.group-start', function () {
           var name = $(this).data('name');
           collapsedGroups[name] = !collapsedGroups[name];
           table.draw(false);
       });

   });