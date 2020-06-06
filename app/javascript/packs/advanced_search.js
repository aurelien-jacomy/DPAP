var checkBoxes = document.querySelectorAll(".form-check-input");

var fabrics = document.querySelectorAll("#fabric");

var slider = document.getElementById("search_price");

const advancedSearch = () => {
  slider.oninput = function () {
    let attributes = getCheckedBoxesValues();

    fabrics.forEach((fabric) => {
      if (
        checkIfFabricContainsAttr(fabric.textContent, attributes) &&
        checkPrice(fabric)
      ) {
        ShowCard(fabric);
      } else {
        hideCard(fabric);
      }
    });
  };
  for (const check of checkBoxes) {
    check.addEventListener("change", function () {
      let attributes = getCheckedBoxesValues();

      if (attributes.length == 0) {
        ShowAllCards();
        return;
      }
      fabrics.forEach((fabric) => {
        if (
          checkIfFabricContainsAttr(fabric.textContent, attributes) &&
          checkPrice(fabric)
        ) {
          ShowCard(fabric);
        } else {
          hideCard(fabric);
        }
      });
    });
  }
};

const checkIfFabricContainsAttr = (fabric, attributes) => {
  return attributes.every((attr) => fabric.includes(attr));
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

const checkPrice = (fabric) => {
  let price = fabric.querySelector("#searchable-item-price").textContent;

  if (price <= slider.value * 10000) {
    return true;
  } else {
    return false;
  }
};


export { advancedSearch };
