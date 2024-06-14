document.addEventListener("turbo:load", function () {
  document.querySelectorAll(".borrow-button").forEach((button) => {
    button.addEventListener("click", function (event) {
      event.preventDefault();
      const url = event.target.closest("a").href;

      fetch(url)
        .then((response) => response.text())
        .then((html) => {
          const modal = document.createElement("div");
          modal.innerHTML = html;
          document.body.appendChild(modal);
          const loanModal = modal.querySelector("#loan-modal");
          if (loanModal) {
            const bootstrapModal = new bootstrap.Modal(loanModal);
            bootstrapModal.show();
            loanModal.addEventListener("hidden.bs.modal", function () {
              document.body.removeChild(modal);
            });
          }
        });
    });
  });
});
