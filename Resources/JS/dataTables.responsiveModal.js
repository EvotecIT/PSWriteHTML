function pswhResponsiveModal() {
    // Responsive redraws every row, including rows in other tables.
    let active = null;

    return function (row, update, render, closeDetails) {
        const table = row.table();
        const tableNode = table.node();
        const rowIndex = row.index();

        if (update) {
            if (!active || active.tableNode !== tableNode || active.rowIndex !== rowIndex) {
                return null;
            }
            const details = render();
            if (details) {
                active.content.empty().append(details);
                return true;
            }
            active.dismiss();
            return null;
        }

        const details = render();
        if (!details) {
            return false;
        }
        if (active) {
            active.dismiss();
        }

        const dialog = document.createElement("dialog");
        const closeButton = document.createElement("button");
        const content = jQuery("<div>").addClass("dtr-modal-content").append(details);
        dialog.className = "pswh-responsive-modal";
        dialog.setAttribute("aria-label", "Row details");
        closeButton.type = "button";
        closeButton.textContent = "Close";
        dialog.append(closeButton, content[0]);

        function dismiss() {
            active = null;
            table.off("destroy.dt.pswhResponsiveModal", dismiss);
            dialog.close();
            dialog.remove();
            closeDetails();
        }

        closeButton.addEventListener("click", dismiss);
        dialog.addEventListener("cancel", function (event) {
            event.preventDefault();
            dismiss();
        });
        table.one("destroy.dt.pswhResponsiveModal", dismiss);
        active = { tableNode, rowIndex, content, dismiss };
        document.body.append(dialog);
        dialog.showModal();
        return true;
    };
}
