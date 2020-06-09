const advancedSearch = () => {
  var fabrics = document.querySelectorAll("#fabric");
  var checkBoxes = document.querySelectorAll(".form-check-input");
  var slider = document.getElementById("price_slider");

  var colorCheckboxes = document.querySelectorAll("#color_checkboxes");
  var fabricTypeCheckboxes = document.querySelectorAll(
    "#fabric_type_checkboxes"
  );
  var labelCheckboxes = document.querySelectorAll("#labels_checkboxes");

  slider.oninput = function () {
    let checkedColors = getCheckedColorBoxesValues(colorCheckboxes);
    let checkedFabricTypes = getCheckedFabricTypeBoxesValues(
      fabricTypeCheckboxes
    );
    let checkedLabels = getCheckedlabelsValues(labelCheckboxes);

    fabrics.forEach((fabric) => {
      if (
        checkLabel(fabric, checkedLabels) &&
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
      let checkedLabels = getCheckedlabelsValues(labelCheckboxes);

      if (
        checkedColors.length == 0 &&
        checkedFabricTypes.length == 0 &&
        checkedLabels.length == 0
      ) {
        ShowAllCards(fabrics);
        return;
      }
      fabrics.forEach((fabric) => {
        if (
          checkLabel(fabric, checkedLabels) &&
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

const getCheckedlabelsValues = (labelCheckboxes) => {
  let checkedLabelsBoxes = [];

  labelCheckboxes.forEach((labelCheckBox) => {
    if (labelCheckBox.checked) {
      checkedLabelsBoxes.push(
        labelCheckBox.nextElementSibling.firstElementChild.textContent
      );
    }
  });

  return checkedLabelsBoxes;
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

  return fabricPrice <= slider.value * 100;
};

const checkColor = (fabric, checkedColors) => {
  let fabricColor = fabric.querySelector("#searchable-item-color").textContent;
  if (checkedColors.length == 0) {
    return true;
  } else {
    return checkedColors.some((color) => fabricColor == color);
  }
};

const separatedFabricLabels = (fabric) => {
  let fabricLabelsNodes = fabric.querySelectorAll("#searchable-item-labels");
  let fabricLabels = [];
  fabricLabelsNodes.forEach((label) => {
    fabricLabels.push(label.textContent);
  });
  return fabricLabels;
};

const checkLabel = (fabric, checkedLabels) => {
  let fabricLabels = separatedFabricLabels(fabric);

  if (checkedLabels.length == 0) {
    return true;
  } else {
    let matchingLabels = [];

    fabricLabels.forEach((individualLabel) => {
      checkedLabels.forEach((individualCheckedLabel) => {
        if (individualLabel == individualCheckedLabel) {
          matchingLabels.push(individualLabel);
        }
      });
    });
    if (matchingLabels.length != 0) {
      return true;
    }
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

