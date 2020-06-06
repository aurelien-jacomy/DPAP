const advancedSearch = () => {
  var fabrics = document.querySelectorAll("#fabric");
  var checkBoxes = document.querySelectorAll(".form-check-input");
  var slider = document.getElementById("search_price");

  slider.oninput = function () {
    let attributes = getCheckedBoxesValues(checkBoxes);

    fabrics.forEach((fabric) => {
      if (
        checkIfFabricContainsAttr(fabric.textContent, attributes) &&
        checkPrice(fabric, slider)
      ) {
        ShowCard(fabric);
      } else {
        hideCard(fabric);
      }
    });
  };
  for (const check of checkBoxes) {
    check.addEventListener("change", function () {
      let attributes = getCheckedBoxesValues(checkBoxes);

      if (attributes.length == 0) {
        ShowAllCards(fabrics);
        return;
      }
      fabrics.forEach((fabric) => {
        if (
          checkIfFabricContainsAttr(fabric.textContent, attributes) &&
          checkPrice(fabric, slider)
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

const getCheckedBoxesValues = (checkBoxes) => {
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

const ShowAllCards = (fabrics) => {
  fabrics.forEach((fabric) => {
    fabric.classList.remove("hidden");
  });
};

const hideCard = (fabric) => {
  fabric.classList.add("hidden");
};

const checkPrice = (fabric, slider) => {
  let price = fabric.querySelector("#searchable-item-price").textContent;

  if (price <= slider.value * 10000) {
    return true;
  } else {
    return false;
  }
};

export { advancedSearch };
