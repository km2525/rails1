import "@hotwired/turbo-rails"
import "controllers"

import flatpickr from "flatpickr";

document.addEventListener("turbo:load", () => {
  flatpickr(".js-date-picker", {
    locale: "ja",   // ← 文字列指定
    dateFormat: "Y-m-d",
    allowInput: true,

    static: true,
    closeOnSelect: false,

    onReady: function (_, __, instance) {
      const footer = document.createElement("div");
      footer.className = "flatpickr-footer";

      const okBtn = document.createElement("button");
      okBtn.type = "button";
      okBtn.textContent = "OK";
      okBtn.className = "fp-ok";

      const cancelBtn = document.createElement("button");
      cancelBtn.type = "button";
      cancelBtn.textContent = "キャンセル";
      cancelBtn.className = "fp-cancel";

      okBtn.onclick = () => instance.close();
      cancelBtn.onclick = () => {
        instance.clear();
        instance.close();
      };

      footer.append(cancelBtn, okBtn);
      instance.calendarContainer.appendChild(footer);
    }
  });
});
