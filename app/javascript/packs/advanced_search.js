const advancedSearch = () => {
  var fabrics = document.querySelectorAll("#fabric");
  var checkBoxes = document.querySelectorAll(".form-check-input");
  var slider = document.getElementById("price_slider");

  var colorCheckboxes = document.querySelectorAll("#color_checkboxes");
  var fabricTypeCheckboxes = document.querySelectorAll(
    "#fabric_type_checkboxes"
  );

  slider.oninput = function () {
    let checkedColors = getCheckedColorBoxesValues(colorCheckboxes);
    let checkedFabricTypes = getCheckedFabricTypeBoxesValues(
      fabricTypeCheckboxes
    );

    fabrics.forEach((fabric) => {
      if (
        checkColor(fabric, checkedColors) &&
        checkFabricType(fabric, checkedFabricTypes) &&
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
      let checkedColors = getCheckedColorBoxesValues(colorCheckboxes);
      let checkedFabricTypes = getCheckedFabricTypeBoxesValues(
        fabricTypeCheckboxes
      );

      if (checkedColors.length == 0 && checkedFabricTypes.length == 0) {
        ShowAllCards(fabrics);
        return;
      }
      fabrics.forEach((fabric) => {
        if (
          checkColor(fabric, checkedColors) &&
          checkFabricType(fabric, checkedFabricTypes) &&
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

const getCheckedColorBoxesValues = (colorCheckboxes) => {
  let checkedColorBoxes = [];

  colorCheckboxes.forEach((colorCheckBox) => {
    if (colorCheckBox.checked) {
      checkedColorBoxes.push(
        colorCheckBox.nextElementSibling.firstElementChild.textContent
      );
    }
  });

  return checkedColorBoxes;
};

const getCheckedFabricTypeBoxesValues = (fabricTypeCheckboxes) => {
  let checkedFabricTypeBoxes = [];

  fabricTypeCheckboxes.forEach((fabricTypeCheckBox) => {
    if (fabricTypeCheckBox.checked) {
      checkedFabricTypeBoxes.push(
        fabricTypeCheckBox.nextElementSibling.firstElementChild.textContent
      );
    }
  });

  return checkedFabricTypeBoxes;
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
  let fabricPrice = fabric.querySelector("#searchable-item-price").textContent;

  return fabricPrice <= slider.value * 10000;
};

const checkColor = (fabric, checkedColors) => {
  let fabricColor = fabric.querySelector("#searchable-item-color").textContent;
  if (checkedColors.length == 0) {
    return true;
  } else {
    return checkedColors.some((color) => fabricColor == color);
  }
};

const checkFabricType = (fabric, checkedFabricTypes) => {
  let fabricFabricType = fabric.querySelector("#searchable-item-fabric-type")
    .textContent;

  if (checkedFabricTypes.length == 0) {
    return true;
  } else {
    return checkedFabricTypes.some(
      (fabricType) => fabricFabricType == fabricType
    );
  }
};

export { advancedSearch };

// $(document).ready(function(){
//   $("#color_cheboxes").click(function(){
//     $(this).toggleClass("active");
//   });
// });
