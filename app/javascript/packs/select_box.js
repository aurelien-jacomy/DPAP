const initSelectLabel = () => {
	let labels = [];
	labels = document.querySelectorAll(".label-choice")
	labels.forEach((label) => {
		label.addEventListener( "click", (event) => {
			label.classList.toggle("active");
		});
	});
}

const initSelectLabelCategory = () => {
	let categories = [];
	categories = document.querySelectorAll(".category-choice")
	categories.forEach((category) => {
		category.addEventListener( "click", (event) => {
			category.classList.toggle("active");
			showCategory(category.dataset.category);
		});
	});
}

const showCategory = (category_id) => {
	let labels = [];
	labels = document.querySelectorAll(`.cat-${category_id}`);
	labels.forEach((label) => {
		label.toggleAttribute("hidden");
	});
}

export { initSelectLabel, initSelectLabelCategory };