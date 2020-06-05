var checkBoxes = document.querySelectorAll(".form-check-input");

var fabrics = document.querySelectorAll("#fabric");

const advancedSearch = () => {
  for (const check of checkBoxes) {
    check.addEventListener("change", function () {
      let attributes = getCheckedBoxesValues();

      if (attributes.length == 0) {
        ShowAllCards();
        return;
      }
      fabrics.forEach((fabric) => {
        if (checkIfFabricContainsAttr(fabric.textContent, attributes)) {
          ShowCard(fabric);
        } else {
          hideCard(fabric);
        }
      });
    });
  }
};

const checkIfFabricContainsAttr = (fabric, attributes) => {
  return attributes.some((attr) => fabric.includes(attr));
};

const getCheckedBoxesValues = () => {
  let checkedBoxes = [];
  checkBoxes.forEach((checkbox) => {
    if (checkbox.checked) {
      checkedBoxes.push(checkbox.value);
    }
  });

  return checkedBoxes;
};

const ShowCard = (fabric) => {
  fabric.classList.remove("hidden");
};

const ShowAllCards = () => {
  fabrics.forEach((fabric) => {
    fabric.classList.remove("hidden");
  });
};

const hideCard = (fabric) => {
  fabric.classList.add("hidden");
};

export { advancedSearch };
